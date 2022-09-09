-- Joining the covid_deaths and covid_vaccinations tables.

SELECT *
FROM covid_deaths AS cd
JOIN covid_vaccinations AS cv
	ON 
		cd.location = cv.location
		AND cd.date = cv.date;

/* Building on the join from the previous query to compile the daily 
new vaccinations in each country alongside its rolling vaccination total. */

SELECT 
	cd.continent, 
	cd.location, 
	cd.date, 
	cd.population,
	cv.new_vaccinations,
	SUM(cv.new_vaccinations) 
		OVER (PARTITION BY cd.location ORDER BY cd.location, cd.date) AS rolling_vaccinations
FROM covid_deaths AS cd
JOIN covid_vaccinations AS cv
	ON 
		cd.location = cv.location
		AND cd.date = cv.date
WHERE 
	cd.continent IS NOT NULL
	AND new_vaccinations IS NOT NULL
ORDER BY 1, 2, 3;

/* Building on to this query using a CTE to calculate additional column based on
aggregated values */ 

WITH pvv AS (
SELECT 
	cd.continent, 
	cd.location, 
	cd.date, 
	cd.population,
	cv.new_vaccinations,
	SUM(cv.new_vaccinations) 
		OVER (PARTITION BY cd.location ORDER BY cd.location, cd.date) AS rolling_vaccinations
FROM covid_deaths AS cd
JOIN covid_vaccinations AS cv
	ON 
		cd.location = cv.location
		AND cd.date = cv.date
WHERE 
	cd.continent IS NOT NULL
	AND new_vaccinations IS NOT NULL)
SELECT *, (rolling_vaccinations/population)*100 AS percent_vaxed
FROM pvv;

/* Converting the output of the above query into a view named 
percent_pop_vax for further exploration and visualization. */

CREATE VIEW percent_pop_vax AS
WITH pvv AS (
SELECT 
	cd.continent, 
	cd.location, 
	cd.date, 
	cd.population,
	cv.new_vaccinations,
	SUM(cv.new_vaccinations) 
		OVER (PARTITION BY cd.location ORDER BY cd.location, cd.date) AS rolling_vaccinations
FROM covid_deaths AS cd
JOIN covid_vaccinations AS cv
	ON 
		cd.location = cv.location
		AND cd.date = cv.date
WHERE 
	cd.continent IS NOT NULL
	AND new_vaccinations IS NOT NULL)
SELECT *, (rolling_vaccinations/population)*100 AS percent_vaxed
FROM pvv;