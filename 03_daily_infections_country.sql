/* Compiling the total COVID cases alongside the
population of each country and calculating the percentage 
of each country's population that has been infected with COVID so far. */

SELECT 
	continent,
	"location", 
	"date", 
	total_cases, 
	population, 
	(total_cases/population)*100 AS percent_infected
FROM covid_deaths
WHERE continent IS NOT NULL
ORDER BY continent, "location", "date" DESC;

/* Converting the output of the above query into a view named 
daily_infections_country for further exploration and visualization. */

CREATE VIEW daily_infections_country AS
SELECT 
	continent,
	"location", 
	"date", 
	total_cases, 
	population, 
	(total_cases/population)*100 AS percent_infected
FROM covid_deaths
WHERE continent IS NOT NULL
ORDER BY continent, "location", "date" DESC;