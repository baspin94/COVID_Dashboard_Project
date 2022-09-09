/* Compiling each country's highest death count alongside its
population and calculating the percentage of deaths 
relative to the population. */

SELECT 
	continent,
	"location", 
	MAX((total_deaths/population)*100) AS pop_death_percent
FROM covid_deaths
WHERE 
	total_deaths IS NOT NULL 
	AND population IS NOT NULL 
	AND continent IS NOT NULL
GROUP BY continent, "location"
ORDER BY pop_death_percent DESC;

/* Converting the output of the above query into a view named 
deaths_vs_population for further exploration and visualization. */

CREATE VIEW deaths_vs_population AS
SELECT 
	continent,
	"location", 
	MAX((total_deaths/population)*100) AS pop_death_percent
FROM covid_deaths
WHERE 
	total_deaths IS NOT NULL 
	AND population IS NOT NULL 
	AND continent IS NOT NULL
GROUP BY continent, "location"
ORDER BY pop_death_percent DESC;