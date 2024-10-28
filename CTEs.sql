--Manupulate complex subquery data
--Also called as With Query

--Example:
With CTE_Employee as
(Select FirstName, LastName, Gender, Salary,
COUNT(Gender) Over (Partition by Gender) as TotalGender,
AVG(Salary) Over (Partition By Gender) as AvgSalary
From [SQL Tutorial]..EmployeeDemo Dem
JOIN [SQL Tutorial]..EmployeeSalary Sal
	ON Dem.EmployeeID = Sal.EmployeeID
Where Sal.Salary > 45000
)

Select FirstName + ' ' + LastName as FullName, AvgSalary 
From CTE_Employee