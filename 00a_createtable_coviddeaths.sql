/* Initial set-up of the covid_deaths table that will contain 
records from 'Our World in Data''s COVID-19 data up to September 8th, 2022. */

CREATE TABLE covid_deaths
(iso_code varchar,
continent varchar,
"location" varchar,
"date" date,
population int,
total_cases int,
new_cases int,
new_cases_smoothed numeric,
total_deaths int,
new_deaths int,
new_deaths_smoothed numeric,
total_cases_per_million numeric,
new_cases_per_million numeric,
new_cases_smoothed_per_million numeric,
total_deaths_per_million numeric,
new_deaths_per_million numeric,
new_deaths_smoothed_per_million numeric,
reproduction_rate numeric,
icu_patients int,
icu_patients_per_million numeric,
hosp_patients int,
hosp_patients_per_million numeric,
weekly_icu_admissions int,
weekly_icu_admissions_per_million numeric,
weekly_hosp_admissions int,
weekly_hosp_admissions_per_million numeric
)
