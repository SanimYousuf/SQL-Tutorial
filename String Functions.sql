/*
Today's Topic: String Functions - TRIM, LTRIM, RTRIM, Replace, Substring, Upper, Lower
*/

--Drop Table EmployeeErrors;

CREATE TABLE EmployeeErrors (
EmployeeID varchar(50)
,FirstName varchar(50)
,LastName varchar(50)
)

Insert into EmployeeErrors Values 
('1001  ', 'Jimbo', 'Halbert')
,('  1002', 'Pamela', 'Beasely')
,('1005', 'TOby', 'Flenderson - Fired')

Select *
From EmployeeErrors

-- Uses of Trim, LTrim, RTrim

Select EmployeeID, Trim(EmployeeID) as ID_Trim
From EmployeeErrors

Select EmployeeID, LTrim(EmployeeID) as ID_Trim
From EmployeeErrors

Select EmployeeID, RTrim(EmployeeID) as ID_Trim
From EmployeeErrors

-- Using Replace

Select LastName, REPLACE(LastName, '- Fired', '') as FixedLastName
From EmployeeErrors

-- Using SubString

Select SubString(err.FirstName,1,3),  SubString(dem.FirstName,1,3) From
EmployeeErrors err Join EmployeeDemo dem
On SubString(err.FirstName,1,3) =  SubString(dem.FirstName,1,3)

-- Using UPPER & lower Functions

Select FirstName, UPPER(FirstName) From
EmployeeErrors

Select FirstName, Lower(FirstName) From
EmployeeErrors