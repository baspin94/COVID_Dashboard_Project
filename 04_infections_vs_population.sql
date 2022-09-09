/* Compiling each country's highest infection count alongside its
population and calculating the percentage of infections 
relative to population. */

SELECT 
	continent,
	"location", 
	population, 
	MAX(total_cases) AS highest_infection_count, 
	MAX((total_cases/population)*100) AS percent_infected
FROM covid_deaths
WHERE 
	total_cases IS NOT NULL 
	AND population IS NOT NULL 
	AND continent IS NOT NULL
GROUP BY continent, "location", population
ORDER BY percent_infected DESC;

/* Converting the output of the above query into a view named 
infections_vs_population for further exploration and visualization. */

CREATE VIEW infections_vs_population AS
SELECT 
	continent,
	"location", 
	population, 
	MAX(total_cases) AS highest_infection_count, 
	MAX((total_cases/population)*100) AS percent_infected
FROM covid_deaths
WHERE 
	total_cases IS NOT NULL 
	AND population IS NOT NULL 
	AND continent IS NOT NULL
GROUP BY continent, "location", population
ORDER BY percent_infected DESC;