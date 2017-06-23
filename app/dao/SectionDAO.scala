package dao

import javax.inject.Inject

import models.{Page, Section}
import play.api.db.slick.DatabaseConfigProvider

import scala.concurrent.{ExecutionContext, Future}


class SectionDAO @Inject()(protected val dbConfigProvider: DatabaseConfigProvider)
                          (implicit executionContext: ExecutionContext) extends BaseDAO[Section] {
  import profile.api._

  private val sections = TableQuery[SectionTable]

  def insert(entity: Section): Future[Long] = {
    db.run(sections returning sections.map(_.id) += entity)
  }

  def insert(entities: Seq[Section]): Future[String] = {
    db.run(sections ++= entities)
      .map { _ => "Collection successfully added" }
      .recover {
        case ex: Exception => ex.getCause.getMessage
      }
  }

  def findByPageId(pageId: Long) = None

  def update(id: Long) = ???

  // It must delete all fields before
  def delete(id: Long) = ???

  def count(): Future[Int] =
    db.run(sections.length.result)

  // only for test purpose
  def all(): Future[Seq[Section]] =
    db.run(sections.result)

  private class SectionTable(tag: Tag) extends Table[Section](tag, "SECTION") {
    def id = column[Long]("ID", O.PrimaryKey, O.AutoInc)
    def pageId = column[Long]("PAGE_ID")
    def ordinal = column[Int]("ORDINAL")
    def title = column[String]("TITLE")

    def * = (id.?, pageId, ordinal, title) <> (Section.tupled, Section.unapply)
  }
}