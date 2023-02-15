/*
Queries used for Tableau Project
*/



-- 1. Global Numbers

SELECT SUM(new_cases) AS Total_cases,SUM(CAST(new_deaths AS int)) AS Total_Deaths,
SUM(CAST(new_deaths AS int))/SUM(new_cases)*100 as DeathPercentage
FROM CovidDeath									
WHERE 
--location like '%emirates%' AND
location NOT IN('High income','Upper middle income')
AND continent IS NOT NULL
--GROUP BY date
ORDER BY 1,2
GO


-- 2. Total Deaths Per Continent

-- We take these out as they are not inluded in the above queries and want to stay consistent
-- European Union is part of Europe

SELECT location,SUM(CAST(total_deaths AS int)) AS Total_Death_Count
from CovidDeath
WHERE continent IS NULL
AND location NOT IN('world','European Union','International','High income','Upper middle income','Low income')
GROUP BY location
ORDER BY Total_Death_Count DESC

GO

--3. Percent Population Infected By Country

SELECT location,population,MAX(total_cases) AS HighestinfectionCount, MAX((total_cases/population)*100) AS PercentagePoulationInfected
FROM CovidDeath
GROUP BY location,population
ORDER BY PercentagePoulationInfected DESC

--4. Percent Population Infected

SELECT location,population,date,MAX(total_cases) AS HighestinfectionCount, MAX((total_cases/population)*100) AS PercentagePoulationInfected
FROM CovidDeath
GROUP BY location,population,date
ORDER BY PercentagePoulationInfected DESC


select distinct location from CovidDeath
