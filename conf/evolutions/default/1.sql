# --- !Ups

CREATE TABLE "EVENT" (
  "ID"              BIGINT PRIMARY KEY AUTO_INCREMENT,
  "NAME"            VARCHAR(120) NOT NULL,
  "DESCRIPTION"     VARCHAR      NOT NULL,
  "EVENT_CATEGORY"  VARCHAR(60)  NOT NULL,
  "START_DATE_TIME" BIGINT       NOT NULL,
  "END_DATE_TIME"   BIGINT
);

-- insert into EVENT ("NAME", "DESCRIPTION", "EVENT_CATEGORY", "START_DATE_TIME", "END_DATE_TIME")
--   VALUES ('Damian', 'lolasldasod', 'Workshops', 1497375479, 1497375479);

CREATE TABLE "PAGE" (
  "ID"       BIGINT PRIMARY KEY AUTO_INCREMENT,
  "EVENT_ID" BIGINT      NOT NULL,
  "ORDINAL"  INT         NOT NULL,
  "TITLE"    VARCHAR(60) NOT NULL,
  FOREIGN KEY ("EVENT_ID")
  REFERENCES EVENT (ID) ON DELETE CASCADE
);

CREATE TABLE "SECTION" (
  "ID"      BIGINT PRIMARY KEY AUTO_INCREMENT,
  "PAGE_ID" BIGINT      NOT NULL,
  "ORDINAL" INT         NOT NULL,
  "TITLE"   VARCHAR(60) NOT NULL,
  FOREIGN KEY ("PAGE_ID")
  REFERENCES PAGE (ID) ON DELETE CASCADE
);

CREATE TABLE "IMAGE" (
  "ID"          BIGINT PRIMARY KEY AUTO_INCREMENT,
  "SECTION_ID"  BIGINT       NOT NULL,
  "ORDINAL"     INT          NOT NULL,
  "URL"         VARCHAR(120) NOT NULL,
  "DESCRIPTION" VARCHAR,
  FOREIGN KEY ("SECTION_ID")
  REFERENCES SECTION (ID) ON DELETE CASCADE
);

CREATE TABLE "PARAGRAPH" (
  "ID"         BIGINT PRIMARY KEY AUTO_INCREMENT,
  "SECTION_ID" BIGINT  NOT NULL,
  "ORDINAL"    INT     NOT NULL,
  "CONTENT"    VARCHAR NOT NULL,
  FOREIGN KEY ("SECTION_ID")
  REFERENCES SECTION (ID) ON DELETE CASCADE
);

CREATE TABLE "HEADING" (
  "ID"         BIGINT PRIMARY KEY AUTO_INCREMENT,
  "SECTION_ID" BIGINT  NOT NULL,
  "ORDINAL"    INT     NOT NULL,
  "CONTENT"    VARCHAR NOT NULL,
  FOREIGN KEY ("SECTION_ID")
  REFERENCES SECTION (ID) ON DELETE CASCADE
);

# --- !Downs
DROP TABLE "EVENT";
DROP TABLE "PAGE";
DROP TABLE "SECTION";
DROP TABLE "IMAGE";
DROP TABLE "PARAGRAPH";
DROP TABLE "HEADING";