/* Compiling the daily global totals of new COVID cases and deaths and calculating 
the percentage of new deaths relative to the number of new cases. */

SELECT 
	"date", 
	SUM(new_cases) AS total_new_cases,
	SUM(new_deaths) AS total_new_deaths,
	SUM(new_deaths)/SUM(new_cases) * 100 AS death_percentage
FROM covid_deaths
WHERE 
	continent IS NOT NULL
	AND new_cases IS NOT NULL
GROUP BY "date"
ORDER BY "date";

/* Converting the output of the above query into a view named 
global_numbers_daily for further exploration and visualization. */

CREATE VIEW global_numbers_daily AS
SELECT 
	"date", 
	SUM(new_cases) AS total_new_cases,
	SUM(new_deaths) AS total_new_deaths,
	SUM(new_deaths)/SUM(new_cases) * 100 AS death_percentage
FROM covid_deaths
WHERE 
	continent IS NOT NULL
	AND new_cases IS NOT NULL
GROUP BY "date"
ORDER BY "date";