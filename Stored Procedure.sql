-- Stored Procedure:

CREATE PROCEDURE TEST 
AS Select * From EmployeeDemo

EXEC TEST

-- Create another procedure:

CREATE PROCEDURE Temp_Employee
AS
CREATE TABLE #tempEmployee (
JobTitle varchar(50),
EmployeePerJob int,
AvgAge int,
AvgSalary int
)

INSERT INTO #tempEmployee 
Select JobTitle, COUNT(JobTitle), AVG(Age), AVG(Salary) From
[SQL Tutorial].dbo.EmployeeDemo Join [SQL Tutorial].dbo.EmployeeSalary
ON EmployeeDemo.EmployeeID = EmployeeSalary.EmployeeID
Group by JobTitle

Select * From #tempEmployee

Exec Temp_Employee