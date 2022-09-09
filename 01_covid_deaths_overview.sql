/* Getting an overview of key data points we'll be looking at
from the infection and death-related data from 'Our World in Data''s COVID-19 
data up to September 8th, 2022. */

SELECT 
	continent,
	"location", 
	"date", 
	total_cases, 
	new_cases, 
	total_deaths, 
	population
FROM covid_deaths
WHERE continent IS NOT NULL
ORDER BY continent, "location", "date";

/* Converting the output of the above query into a view named deaths_overview
for further exploration and visualization. */

CREATE VIEW deaths_overview AS
SELECT 
	continent,
	"location", 
	"date", 
	total_cases, 
	new_cases, 
	total_deaths, 
	population
FROM covid_deaths
WHERE continent IS NOT NULL
ORDER BY continent, "location", "date";