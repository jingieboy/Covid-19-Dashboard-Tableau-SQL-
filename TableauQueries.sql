/*
Queries used for Tableau Project
*/


--1.

SELECT SUM(new_cases) AS total_cases, SUM(new_deaths) as total_deaths, SUM(new_deaths)/SUM(new_Cases)*100 as DeathPercentage
FROM CovidDeaths
WHERE continent IS NOT NULL 
--Group By date
ORDER BY 1,2


--2.

SELECT continent, MAX(CAST(total_deaths AS float)) AS TotalDeathCount
FROM CovidDeaths cd 
WHERE continent IS NOT NULL 
GROUP BY continent
ORDER BY TotalDeathCount DESC


--3.

SELECT location, population, MAX(CAST(total_cases AS float)) AS HighestInfectionCount, 
	MAX(CAST(total_cases AS float)/CAST(population AS float))*100 AS PopulationInfectedPercent
FROM CovidDeaths cd 
WHERE continent IS NOT NULL 
GROUP BY location, population
ORDER BY PopulationInfectedPercent DESC 


--4.

SELECT location, population, date, MAX(CAST(total_cases AS float)) AS HighestInfectionCount, 
	MAX(CAST(total_cases AS float)/CAST(population AS float))*100 AS PopulationInfectedPercent
FROM CovidDeaths cd
GROUP BY location, population,date
ORDER BY PopulationInfectedPercent DESC

