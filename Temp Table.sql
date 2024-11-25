--Create a temporary table:
Create Table #tempTable (
EmployeeID int,
JobTitle varchar(100),
Salary int
)

--Insert data from other table:
Insert Into #tempTable Select
* From [SQL Tutorial]..EmployeeSalary

--Another example:
CREATE TABLE #tempEmployee (
JobTitle varchar(50),
EmployeePerJob int,
AvgAge int,
AvgSalary int
)

--Insert New data from another table:
INSERT INTO #tempEmployee 
Select JobTitle, COUNT(JobTitle), AVG(Age), AVG(Salary) From
[SQL Tutorial].dbo.EmployeeDemo Join [SQL Tutorial].dbo.EmployeeSalary
ON EmployeeDemo.EmployeeID = EmployeeSalary.EmployeeID
Group by JobTitle

--To create temp table again:
DROP TABLE IF EXISTS #tempTable
