-- Select Data we are going to use in this project:
Select location, date, total_cases, new_cases, total_deaths, population
From CovidDeaths
Order By 1,2

-- Total cases VS Total deaths:
Select location, date, total_cases, total_deaths, (total_deaths / total_cases)*100 
As DeathRatio
From CovidDeaths Where location like '%States%'
Order By 1,2

-- Total Cases VS Population:

Select location, date, total_cases, population, (total_cases / population)*100 As Ratio
From CovidDeaths 

-- Countries with highest infection rate:
Select location, population, MAX(total_cases) As HighestInfection, MAX((total_cases / population))*100 
As HighestInfectionRatio
From CovidDeaths
Group by location, population
Order by HighestInfectionRatio Desc

-- Highest death count per population:

Select location, MAX(cast(total_deaths as int)) As HighestDeath
From CovidDeaths
Where continent is not NULL
Group by location
Order by HighestDeath Desc

-- Highest death count by continent:
-- There is an issue with dataset, that's we're using location to represent continent.

Select location, MAX(cast(total_deaths as int)) As HighestDeath
From CovidDeaths
Where continent is NULL
Group by location
Order by HighestDeath Desc

-- World Death Ratio:

Select SUM(new_cases) as TS, SUM(cast(new_deaths as int)) as TD, 
(SUM(cast(new_deaths as int))/ SUM(new_cases))*100 
As DeathRatio
From CovidDeaths
Where continent is not null
--Group by date
Order by 1,2

-- Total population VS Vaccinations:

Select d.continent, d.location, d.date, d.population, v.new_vaccinations, 
SUM(CONVERT(int, v.new_vaccinations)) 
Over(Partition by d.location Order by d.location, d.date) as VaccinatedPeople
From PortfolioProject..CovidDeaths as d
Join PortfolioProject..CovidVaccinations as v
	On d.location = v.location
	and d.date = v.date
	Where d.continent is not NULL
	Order by 2,3

-- Use CTE:
With PopVsVac (continent, location, date, population, new_vaccinations, VaccinatedPeople)
as
(	
Select d.continent, d.location, d.date, d.population, v.new_vaccinations, 
SUM(CONVERT(int, v.new_vaccinations)) 
Over(Partition by d.location Order by d.location, d.date) as VaccinatedPeople
From PortfolioProject..CovidDeaths as d
Join PortfolioProject..CovidVaccinations as v
	On d.location = v.location
	and d.date = v.date
	Where d.continent is not NULL
	--Order by 2,3	
)

Select *, (VaccinatedPeople/population)*100 as Percentages
From PopVsVac
