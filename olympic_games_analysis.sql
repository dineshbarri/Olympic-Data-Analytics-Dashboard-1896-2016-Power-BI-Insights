--------------------------------------------------------
-- CREATE TABLE

/*
DROP TABLE IF EXISTS olympic_data;
DROP TABLE IF EXISTS noc_regions;
*/

/* 
CREATE TABLE noc_regions (
	NOC char(3),
	Region varchar(255),
	PRIMARY KEY (NOC)
);
COPY noc_regions FROM 'C:\Users\yihan\OneDrive\Desktop\Projects\noc_regions.csv' DELIMITER ',' CSV HEADER;
CREATE TABLE olympic_data (
    ID integer,
    Name varchar(255),
    Sex char(1),
    Age integer,
    Height real,
    Weight real,
    Team varchar(255),
    NOC char(3),
    Games varchar(255),
    Year integer,
    Season varchar(255),
    City varchar(255),
    Sport varchar(255),
    Event varchar(255),
    Medal varchar(255),
	FOREIGN KEY (NOC) REFERENCES noc_regions (NOC)
);
COPY olympic_data FROM 'C:\Users\yihan\OneDrive\Desktop\Projects\athlete_events.csv' DELIMITER ',' CSV HEADER NULL 'NA';
*/

SELECT * FROM olympic_data;

-- Number of athletes
SELECT 
	COUNT(DISTINCT id) AS num_athletes
FROM olympic_data;

-- Number of Teams
SELECT 
	COUNT(DISTINCT team) AS num_teams
FROM olympic_data
WHERE team IS NOT NULL;

-- Team with the most number of Gold Medals
WITH gold_medals AS (
	SELECT *
	FROM olympic_data
	WHERE medal = 'Gold'
)

SELECT 
	team, COUNT(*) AS num_gold_medals
FROM gold_medals
GROUP BY team
ORDER BY 2 DESC;

-- Average Weight of all Male Medal-winning Judo Athletes
SELECT 
	ROUND( AVG(CAST(weight as NUMERIC)), 1 ) as avg_weight
FROM olympic_data
WHERE medal IS NOT NULL AND sport = 'Judo' AND sex = 'M';


-- Median Age of Gold Medalist Winners across all Olympics
SELECT 
	CAST(PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY age) AS INTEGER) AS median_age
FROM olympic_data
WHERE LOWER(medal) LIKE '%gold%' AND age IS NOT NULL;

-- How did the Average Male Height change between Olympics from 1896 to 2016?
WITH cte as (
	SELECT year, ROUND( AVG(CAST(height AS NUMERIC)), 1 ) as avg_height
	FROM olympic_data
	WHERE sex = 'M'
	GROUP BY year)
	
, cte2 as (
	SELECT year, avg_height, LAG(avg_height, 1) OVER (ORDER BY year) as prev_height
	FROM cte)
	
SELECT *, ABS(avg_height - prev_height) AS height_difference
FROM cte2
ORDER BY year;


/* Top Teams in the Rio De Janeiro 2016 Olympics by Medals Won, per Event.
Ordered by Team Name in ascending order in the event of a tie */
WITH rio_olympics AS (
	SELECT *
	FROM olympic_data
	WHERE games = '2016 Summer' AND City = 'Rio de Janeiro' AND medal IN ('Bronze', 'Silver', 'Gold') -- alternatively use NOT NULL
)
, cte AS ( 
	SELECT 
		team, 
		event, 
		COUNT(medal) AS num_medals, 
		ROW_NUMBER() OVER (PARTITION BY event ORDER BY COUNT(medal), team) AS rnk
	FROM rio_olympics
	GROUP BY team, event
)

SELECT
	event,
	COALESCE(MAX(CASE WHEN rnk = 1 THEN CONCAT(team, ' with ', num_medals, ' medal(s)') ELSE NULL END), 'No team') AS gold_team,
	COALESCE(MAX(CASE WHEN rnk = 2 THEN CONCAT(team, ' with ', num_medals, ' medal(s)') ELSE NULL END), 'No team') AS silver_team,
	COALESCE(MAX(CASE WHEN rnk = 3 THEN CONCAT(team, ' with ', num_medals, ' medal(s)') ELSE NULL END), 'No team') AS bronze_team
FROM cte
GROUP BY event
ORDER BY event;

-- All Norwegian Alpine Skiiers who participated in 1992 but did not participate in 1994 
WITH cte AS (
	SELECT *
	FROM olympic_data
	INNER JOIN noc_regions
	USING (NOC)
	WHERE olympic_data.sport = 'Alpine Skiing' AND noc_regions.region = 'Norway'
	)

, athletes_1992 AS (
	SELECT id, name
	FROM cte
	WHERE year = 1992
	)
	
SELECT DISTINCT name 
FROM athletes_1992
WHERE id NOT IN (SELECT DISTINCT id FROM cte WHERE year = 1994)
ORDER BY name;

-- Year with the Highest Number of Participants
SELECT year, COUNT(id) AS num_participants
FROM olympic_data
GROUP BY year
ORDER BY 2 DESC
LIMIT 1;

-- Sports with the most number of athletes with a BMI of at least 30
WITH sports as (
	SELECT DISTINCT sport, name, ROUND(CAST(weight/((height/100)^2) AS NUMERIC), 2) AS bmi
	FROM olympic_data
	WHERE height IS NOT NULL AND weight IS NOT NULL AND weight/((height/100)^2) >= 30
	)
SELECT 
	sport, 
	COUNT(*) as num_athletes
FROM sports
GROUP BY sport
ORDER BY 2 DESC

-- Year, Event and Sport in which the youngest athlete participated in
SELECT year, name, age, sport, event
FROM olympic_data
WHERE age = (SELECT MIN(age) FROM olympic_data)

-- M:F Gender Ratio for each Olympic Games
WITH cte1 AS (
	SELECT 
		games, 
		CAST(SUM(CASE WHEN sex = 'M' THEN 1 ELSE 0 END) AS NUMERIC) AS total_males, 
		CAST(SUM(CASE WHEN sex = 'F' THEN 1 ELSE 0 END) AS NUMERIC) AS total_females
	FROM olympic_data
	GROUP BY games
	)

, cte2 AS (
	SELECT 
		games, 
		NULLIF(total_males, 0) AS total_males, 
		NULLIF(total_females, 0) AS total_females -- Set to NULL to prevent Division by Zero Error
	FROM cte1
	)
	
SELECT *, ROUND(total_males / total_females, 3) AS gender_ratio
FROM cte2

-- Does the length of an individual's first name have any connections with medals won?
SELECT 
	LENGTH(SPLIT_PART(name, ' ', 1)) AS first_name_length, 
	SUM(CASE WHEN medal IS NULL THEN 1 ELSE 0 END) AS zero_medals,
	SUM(CASE WHEN medal = 'Gold' THEN 1 ELSE 0 END) AS gold_medals,
	SUM(CASE WHEN medal = 'Silver' THEN 1 ELSE 0 END) AS silver_medals,
	SUM(CASE WHEN medal = 'Bronze' THEN 1 ELSE 0 END) AS bronze_medals
FROM olympic_data
GROUP BY 1
ORDER BY 1 

-- Classify Athletes as Single or Multiple Teams
-- Athletes with multiple teams have the special character '/' in the team name
SELECT 
	DISTINCT name,
	CASE WHEN team LIKE '%/%' THEN 'Multiple Teams'
	ELSE 'Single Team' END AS team_classification
FROM olympic_data

SELECT *
FROM olympic_data

-- Number of medals earned in each category by Chinese athletes from the 2000 to 2016 summer Olympics.

SELECT 
	medal,
	COUNT(CASE WHEN year = 2000 THEN id ELSE NULL END) AS medals_2000,
	COUNT(CASE WHEN year = 2004 THEN id ELSE NULL END) AS medals_2004,
	COUNT(CASE WHEN year = 2008 THEN id ELSE NULL END) AS medals_2008,
	COUNT(CASE WHEN year = 2012 THEN id ELSE NULL END) AS medals_2012,
	COUNT(CASE WHEN year = 2016 THEN id ELSE NULL END) AS medals_2016
FROM olympic_data
INNER JOIN noc_regions
USING (NOC)
WHERE noc_regions.region = 'China' AND olympic_data.medal IS NOT NULL
GROUP BY medal
ORDER BY array_position(array['Bronze', 'Silver', 'Gold'], medal) -- Custom Order

-- Cumulative Sum of Medals won by China over all Olympic Games
WITH cte AS (
	SELECT 
		games, 
		SUM(CASE WHEN medal = 'Gold' THEN 1 ELSE 0 END) AS n_gold_medals,
		SUM(CASE WHEN medal = 'Silver' THEN 1 ELSE 0 END) AS n_silver_medals,
		SUM(CASE WHEN medal = 'Bronze' THEN 1 ELSE 0 END) AS n_bronze_medals
	FROM olympic_data
	WHERE team = 'China'
	GROUP BY games
	)
	
SELECT
	games, 
	SUM(n_gold_medals) OVER (ORDER BY games) as cumulative_gold_medals,
	SUM(n_silver_medals) OVER (ORDER BY games) as cumulative_silver_medals,
	SUM(n_bronze_medals) OVER (ORDER BY games) as cumulative_bronze_medals
FROM cte