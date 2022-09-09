/* Compiling the total COVID cases and COVID deaths
in a given country for each date, and calculating a percentage
over that of the cases leading to death. */

SELECT 
	continent,
	"location", 
	"date", 
	total_cases, 
	total_deaths, 
	(total_deaths/total_cases)*100 AS death_percentage
FROM covid_deaths
WHERE continent IS NOT NULL
ORDER BY continent, "location", "date" DESC;

/* Converting the output of the above query into a view named 
daily_deaths_country for further exploration and visualization. */

CREATE VIEW daily_deaths_country AS
SELECT 
	continent,
	"location", 
	"date", 
	total_cases, 
	total_deaths, 
	(total_deaths/total_cases)*100 AS death_percentage
FROM covid_deaths
WHERE continent IS NOT NULL
ORDER BY continent, "location", "date" DESC;