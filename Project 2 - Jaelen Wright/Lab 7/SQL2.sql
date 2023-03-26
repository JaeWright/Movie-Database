--Query 1
SELECT AVG(2022-"Actor"."Year of birth")
FROM "Actor"

--Query 2: Movie title changed to Joker
SELECT COUNT(DISTINCT "Country")
FROM "Actor", (SELECT "Actor Name"
			 FROM "Actor Cast"
			 WHERE "Movie Title" = 'Joker')foo
WHERE "Actor"."Actor Name" = "foo"."Actor Name"

--Query 3
SELECT COUNT("Eye color") FROM "Actor"
WHERE "Eye color" = 'green' 

--Query 4: Actor name changed to Zac Efron
SELECT COUNT("Movie Title") FROM "Actor Cast"
WHERE "Actor Name" = 'Zac Efron'

--Query 5
SELECT MAX("Budget"),MIN("Budget"),AVG("Budget")
FROM "Movie"
INNER JOIN "Movie Genre"
	ON "Movie"."Movie Title" = "Movie Genre"."Title"
GROUP BY ("Movie Genre"."Genre")

--Query 6: City changed to Kingman, Eye color changed to Blue
SELECT "Director"."Director Name",AVG("Rating")
FROM "Movie"
INNER JOIN "Director Cast"
	ON "Movie"."Movie Title" = "Director Cast"."Movie Title"
INNER JOIN "Director"
	ON "Director Cast"."Director Name" = "Director"."Director Name"
WHERE "Director"."City" = 'Kingman'
OR "Director"."Eye color" = 'blue'
GROUP BY ("Director"."Director Name")

--Query 7
SELECT "Movie Title"
FROM "Actor Cast"
INNER JOIN "Actor"
	ON "Actor"."Actor ID" = "Actor Cast"."Actor ID"
GROUP BY "Movie Title"
HAVING COUNT(DISTINCT "Actor"."Country")>=2

--Query 8
SELECT "Movie Title", COUNT("Award ID") as "Num of Awards"
FROM "Awards"
GROUP BY ("Movie Title")
ORDER BY ("Num of Awards") DESC