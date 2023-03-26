--Query 1: Country changed to United States
SELECT "Director Name"  FROM "Director"
WHERE "Country" ='United States';

--Query 2: Director Name changed to Quentin Tarantino
SELECT "Movie Title"  FROM "Director Cast"
WHERE "Director Name" ='Quentin Tarantino';

--Query 3
SELECT "Actor Name"
FROM "Actor Cast",(SELECT "Movie Title" 
				   FROM "Movie"
	  			   WHERE ("Budget"/**currencyRate*/)> 1000000/**currencyRate*/)foo
WHERE "Actor Cast"."Movie Title" = "foo"."Movie Title"
/*
Currency rates at time of completion (usd ->)
CAD - 1.36
JPY - 148
RUB - 60.80
EUR - 1
CHF - 0.99
*/

--Query 4: Last name changed to start with S or N 
SELECT * FROM "Director" 
WHERE "Director Name" LIKE '% S%'
OR "Director Name" LIKE '% N%'

--Query 5
SELECT "Actor Cast"."Actor Name","Movie Title"
FROM "Actor Cast"
Inner JOIN "Movie Genre"
	ON "Actor Cast"."Movie Title" = "Movie Genre"."Title"
INNER JOIN "Actor"
	ON "Actor"."Actor Name" = "Actor Cast"."Actor Name"
WHERE "Movie Genre"."Genre" = 'Comedy'
AND (2022-"Actor"."Year of birth") < 40

--Query 6
SELECT "a1"."Actor Name","a2"."Actor Name"
FROM "Actor" a1, "Actor" a2
WHERE "a1"."Eye color" = "a2"."Eye color"
AND "a1"."Actor Name" < "a2"."Actor Name"