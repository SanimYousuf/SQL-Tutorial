--Aliasing means temporarily changing the column name!
--Example 1:
Select FirstName as Fname
From [SQL Tutorial].dbo.EmployeeDemo

--Example 2:
Select FirstName Fname
From [SQL Tutorial].dbo.EmployeeDemo

--Example 3:
Select FirstName + ' ' + LastName as FullName
From [SQL Tutorial].dbo.EmployeeDemo

--Aliasing Table Name:
--Example 4:
Select Demo.EmployeeID
From [SQL Tutorial].dbo.EmployeeDemo as Demo

--Example 5:
Select Demo.EmployeeID, Sal.Salary
From [SQL Tutorial].dbo.EmployeeDemo as Demo
JOIN [SQL Tutorial].dbo.EmployeeSalary as Sal
ON Demo.EmployeeID = Sal.EmployeeID