--Having Clause:
Select JobTitle, COUNT(JobTitle) AS CountJobTitle From
[SQL Tutorial].dbo.EmployeeDemo Join [SQL Tutorial].dbo.EmployeeSalary
ON EmployeeDemo.EmployeeID = EmployeeSalary.EmployeeID
Group by JobTitle
Having COUNT(JobTitle) > 1

--Another Example:
Select JobTitle, AVG(Salary) AS AverageSalary From
[SQL Tutorial].dbo.EmployeeDemo Join [SQL Tutorial].dbo.EmployeeSalary
ON EmployeeDemo.EmployeeID = EmployeeSalary.EmployeeID
Group by JobTitle
Having AVG(Salary) > 45000
Order by AVG(Salary)