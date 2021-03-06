name := """CoordCMS"""
organization := "com.example"

version := "1.0-SNAPSHOT"

lazy val root = (project in file(".")).enablePlugins(PlayScala)

scalaVersion := "2.11.11"

libraryDependencies += filters
libraryDependencies += "org.scalatestplus.play" %% "scalatestplus-play" % "2.0.0" % Test
libraryDependencies += "com.typesafe.play" %% "play-slick" % "2.1.0"
libraryDependencies += "com.typesafe.play" %% "play-slick-evolutions" % "2.1.0"
libraryDependencies += "com.h2database" % "h2" % "1.4.195"
libraryDependencies += "org.webjars" %% "webjars-play" % "2.5.0"
libraryDependencies += "org.webjars" % "bootstrap" % "3.3.7-1"
libraryDependencies += "org.webjars" % "jquery" % "3.2.1"
libraryDependencies += "org.webjars.bower" % "mustache" % "2.3.0"

// Adds additional packages into Twirl
//TwirlKeys.templateImports += "com.example.controllers._"

// Adds additional packages into conf/routes
// play.sbt.routes.RoutesKeys.routesImport += "com.example.binders._"
