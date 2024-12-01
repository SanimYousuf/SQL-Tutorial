-- Sub query in select:

Select EmployeeID, Salary, (Select AVG(Salary) From EmployeeSalary) 
As AvgSalary From EmployeeSalary

-- How to do it with partition by:

Select EmployeeID, Salary, AVG(Salary) Over()
As AvgSalary From EmployeeSalary

-- Group by doesn't work:

Select EmployeeID, Salary, AVG(Salary)
As AvgSalary From EmployeeSalary
Group by EmployeeID, Salary
Order by 1,2 

-- Subquery in from:

Select a.EmployeeID, AvgSalary
From (Select EmployeeID, Salary, AVG(Salary) Over()
	 As AvgSalary From EmployeeSalary) a

-- Subquery in where:

Select EmployeeID, JobTitle, Salary
From EmployeeSalary
Where EmployeeID in (
		Select EmployeeID
		From EmployeeDemo
		Where Age > 30)

