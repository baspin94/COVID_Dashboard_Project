/* Compiling each continent's current COVID death count 
through September 8, 2022. */

SELECT 
	continent,
	MAX(total_deaths) AS total_death_count
FROM covid_deaths
WHERE 
	total_deaths IS NOT NULL  
	AND continent IS NOT NULL
GROUP BY continent
ORDER BY total_death_count DESC;

/* Converting the output of the above query into a view named 
max_deaths_continent for further exploration and visualization. */

CREATE VIEW max_deaths_continent AS
SELECT 
	continent,
	MAX(total_deaths) AS total_death_count
FROM covid_deaths
WHERE 
	total_deaths IS NOT NULL  
	AND continent IS NOT NULL
GROUP BY continent
ORDER BY total_death_count DESC;