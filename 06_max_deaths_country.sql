/* Compiling each country's current COVID death count through September 8, 2022. */

SELECT 
	continent,
	"location", 
	MAX(total_deaths) AS total_death_count
FROM covid_deaths
WHERE 
	total_deaths IS NOT NULL  
	AND continent IS NOT NULL
GROUP BY continent, "location"
ORDER BY total_death_count DESC;

/* Converting the output of the above query into a view named 
max_deaths_country for further exploration and visualization. */

CREATE VIEW max_deaths_country AS
SELECT 
	continent,
	"location", 
	MAX(total_deaths) AS total_death_count
FROM covid_deaths
WHERE 
	total_deaths IS NOT NULL  
	AND continent IS NOT NULL
GROUP BY continent, "location"
ORDER BY total_death_count DESC;