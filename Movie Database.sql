/*
Created: 2022-09-20
Modified: 2022-10-02
Model: PostgreSQL 10
Database: PostgreSQL 10
*/

-- Create tables section -------------------------------------------------

-- Table Director

CREATE TABLE "Director"
(
  "Director ID" Bigint NOT NULL,
  "Director Name" Character varying NOT NULL,
  "Year of birth" Integer NOT NULL,
  "City" Character varying NOT NULL,
  "State" Character varying NOT NULL,
  "Country" Character varying NOT NULL,
  "University Name" Bigint
)
WITH (
  autovacuum_enabled=true)
;

CREATE INDEX "IX_Relationship21" ON "Director" ("University Name")
;

ALTER TABLE "Director" ADD CONSTRAINT "PK_Director" PRIMARY KEY ("Director Name","Director ID")
;

-- Table Actor

CREATE TABLE "Actor"
(
  "Actor ID" Bigint NOT NULL,
  "Actor Name" Character varying NOT NULL,
  "Year of birth" Integer NOT NULL,
  "City" Character varying NOT NULL,
  "State" Character varying NOT NULL,
  "Country" Character varying NOT NULL,
  "Eye color" Character varying,
  "University Name" Bigint
)
WITH (
  autovacuum_enabled=true)
;

CREATE INDEX "IX_Relationship20" ON "Actor" ("University Name")
;

ALTER TABLE "Actor" ADD CONSTRAINT "PK_Actor" PRIMARY KEY ("Actor Name","Actor ID")
;

-- Table Type of movie

CREATE TABLE "Type of movie"
(
  "Genre" Character varying NOT NULL,
  "Genre Description" Character varying NOT NULL
)
WITH (
  autovacuum_enabled=true)
;

ALTER TABLE "Type of movie" ADD CONSTRAINT "PK_Type of movie" PRIMARY KEY ("Genre")
;

-- Table Education

CREATE TABLE "Education"
(
  "Public" Boolean NOT NULL,
  "Representative Color" Character varying NOT NULL,
  "Department Name" Character varying NOT NULL,
  "University Name" Bigint NOT NULL
)
WITH (
  autovacuum_enabled=true)
;

CREATE INDEX "IX_Department Info" ON "Education" ("Department Name","University Name")
;

ALTER TABLE "Education" ADD CONSTRAINT "PK_Education" PRIMARY KEY ("University Name")
;

-- Table Movie

CREATE TABLE "Movie"
(
  "Movie Title" Character varying NOT NULL,
  "Release Date" Date NOT NULL,
  "Rating" Integer NOT NULL,
  "Budget" Double precision NOT NULL,
  "Gross" Double precision
)
WITH (
  autovacuum_enabled=true)
;

ALTER TABLE "Movie" ADD CONSTRAINT "PK_Movie" PRIMARY KEY ("Movie Title","Release Date")
;

-- Table Department

CREATE TABLE "Department"
(
  "Department Name" Character varying NOT NULL,
  "University Name" Bigint NOT NULL,
  "Number of Students" Integer NOT NULL,
  "Desciption" Text
)
WITH (
  autovacuum_enabled=true)
;

ALTER TABLE "Department" ADD CONSTRAINT "PK_Department" PRIMARY KEY ("Department Name","University Name")
;

-- Table Movie Genre

CREATE TABLE "Movie Genre"
(
  "Title" Character varying NOT NULL,
  "Genre" Character varying NOT NULL,
  "Release Date" Date NOT NULL
)
WITH (
  autovacuum_enabled=true)
;

ALTER TABLE "Movie Genre" ADD CONSTRAINT "PK_Movie Genre" PRIMARY KEY ("Title","Genre","Release Date")
;

-- Table Actor Cast

CREATE TABLE "Actor Cast"
(
  "Movie Title" Character varying NOT NULL,
  "Release Date" Date NOT NULL,
  "Actor Name" Character varying NOT NULL,
  "Actor ID" Bigint NOT NULL
)
WITH (
  autovacuum_enabled=true)
;

ALTER TABLE "Actor Cast" ADD CONSTRAINT "PK_Actor Cast" PRIMARY KEY ("Movie Title","Release Date","Actor Name","Actor ID")
;

-- Table Director Cast

CREATE TABLE "Director Cast"
(
  "Director Name" Character varying NOT NULL,
  "Director ID" Bigint NOT NULL,
  "Movie Title" Character varying NOT NULL,
  "Release Date" Date NOT NULL
)
WITH (
  autovacuum_enabled=true)
;

ALTER TABLE "Director Cast" ADD CONSTRAINT "PK_Director Cast" PRIMARY KEY ("Director Name","Director ID","Movie Title","Release Date")
;

-- Table Festivals

CREATE TABLE "Festivals"
(
  "Name" Character varying NOT NULL,
  "Year" Date NOT NULL
)
WITH (
  autovacuum_enabled=true)
;

ALTER TABLE "Festivals" ADD CONSTRAINT "PK_Festivals" PRIMARY KEY ("Name")
;

-- Table Cinema

CREATE TABLE "Cinema"
(
  "Cinema Name" Character varying NOT NULL,
  "Location" Character varying NOT NULL,
  "Price" Double precision NOT NULL,
  "Date" Date NOT NULL,
  "Time" Time NOT NULL,
  "Duration" Time NOT NULL,
  "Cinema Hall" Character varying NOT NULL
)
WITH (
  autovacuum_enabled=true)
;

ALTER TABLE "Cinema" ADD CONSTRAINT "PK_Cinema" PRIMARY KEY ("Cinema Name","Location")
;

-- Table Type of Award

CREATE TABLE "Type of Award"
(
  "Award ID" Integer NOT NULL,
  "Award Category" Character varying NOT NULL,
  "Instituiton" Character varying NOT NULL
)
WITH (
  autovacuum_enabled=true)
;

ALTER TABLE "Type of Award" ADD CONSTRAINT "PK_Type of Award" PRIMARY KEY ("Award ID")
;

-- Table Awards

CREATE TABLE "Awards"
(
  "Award ID" Integer NOT NULL,
  "Movie Title" Character varying NOT NULL,
  "Release Date" Date NOT NULL
)
WITH (
  autovacuum_enabled=true)
;

ALTER TABLE "Awards" ADD CONSTRAINT "PK_Awards" PRIMARY KEY ("Award ID","Movie Title","Release Date")
;

-- Table Tickets and Showtimes

CREATE TABLE "Tickets and Showtimes"
(
  "Cinema Name" Character varying NOT NULL,
  "Location" Character varying NOT NULL,
  "Movie Title" Character varying NOT NULL,
  "Release Date" Date NOT NULL
)
WITH (
  autovacuum_enabled=true)
;

ALTER TABLE "Tickets and Showtimes" ADD CONSTRAINT "PK_Tickets and Showtimes" PRIMARY KEY ("Cinema Name","Location","Movie Title","Release Date")
;

-- Table Festival Appearances

CREATE TABLE "Festival Appearances"
(
  "Name" Character varying NOT NULL,
  "Movie Title" Character varying NOT NULL,
  "Release Date" Date NOT NULL
)
WITH (
  autovacuum_enabled=true)
;

CREATE INDEX "IX_Festivals movie was shown at" ON "Festival Appearances" ("Movie Title","Release Date")
;

ALTER TABLE "Festival Appearances" ADD CONSTRAINT "PK_Festival Appearances" PRIMARY KEY ("Name","Movie Title")
;

-- Create foreign keys (relationships) section -------------------------------------------------

ALTER TABLE "Education"
  ADD CONSTRAINT "Department Info"
    FOREIGN KEY ("Department Name", "University Name")
    REFERENCES "Department" ("Department Name", "University Name")
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
;

ALTER TABLE "Actor"
  ADD CONSTRAINT "Actor Education"
    FOREIGN KEY ("University Name")
    REFERENCES "Education" ("University Name")
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
;

ALTER TABLE "Director"
  ADD CONSTRAINT "Director Education"
    FOREIGN KEY ("University Name")
    REFERENCES "Education" ("University Name")
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
;

ALTER TABLE "Movie Genre"
  ADD CONSTRAINT "Genres of movie"
    FOREIGN KEY ("Title", "Release Date")
    REFERENCES "Movie" ("Movie Title", "Release Date")
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
;

ALTER TABLE "Movie Genre"
  ADD CONSTRAINT "Types of genres"
    FOREIGN KEY ("Genre")
    REFERENCES "Type of movie" ("Genre")
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
;

ALTER TABLE "Actor Cast"
  ADD CONSTRAINT "Actors in Movie"
    FOREIGN KEY ("Movie Title", "Release Date")
    REFERENCES "Movie" ("Movie Title", "Release Date")
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
;

ALTER TABLE "Actor Cast"
  ADD CONSTRAINT "Actors in Cast"
    FOREIGN KEY ("Actor Name", "Actor ID")
    REFERENCES "Actor" ("Actor Name", "Actor ID")
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
;

ALTER TABLE "Director Cast"
  ADD CONSTRAINT "Director(s) in cast"
    FOREIGN KEY ("Director Name", "Director ID")
    REFERENCES "Director" ("Director Name", "Director ID")
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
;

ALTER TABLE "Director Cast"
  ADD CONSTRAINT "Director(s) in movie"
    FOREIGN KEY ("Movie Title", "Release Date")
    REFERENCES "Movie" ("Movie Title", "Release Date")
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
;

ALTER TABLE "Awards"
  ADD CONSTRAINT "Types of Awards"
    FOREIGN KEY ("Award ID")
    REFERENCES "Type of Award" ("Award ID")
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
;

ALTER TABLE "Awards"
  ADD CONSTRAINT "Awards won by movie"
    FOREIGN KEY ("Movie Title", "Release Date")
    REFERENCES "Movie" ("Movie Title", "Release Date")
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
;

ALTER TABLE "Tickets and Showtimes"
  ADD CONSTRAINT "Shows at cinema"
    FOREIGN KEY ("Cinema Name", "Location")
    REFERENCES "Cinema" ("Cinema Name", "Location")
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
;

ALTER TABLE "Tickets and Showtimes"
  ADD CONSTRAINT "Movie Showings"
    FOREIGN KEY ("Movie Title", "Release Date")
    REFERENCES "Movie" ("Movie Title", "Release Date")
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
;

ALTER TABLE "Festival Appearances"
  ADD CONSTRAINT "Movie Festival Showings"
    FOREIGN KEY ("Name")
    REFERENCES "Festivals" ("Name")
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
;

ALTER TABLE "Festival Appearances"
  ADD CONSTRAINT "Festivals movie was shown at"
    FOREIGN KEY ("Movie Title", "Release Date")
    REFERENCES "Movie" ("Movie Title", "Release Date")
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
;
