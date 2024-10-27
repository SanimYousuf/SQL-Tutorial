--Inner join:
Select EmployeeDemo.EmployeeID, FirstName, LastName, JobTitle, Salary  From 
[SQL Tutorial].dbo.EmployeeDemo Inner Join [SQL Tutorial].dbo.EmployeeSalary
On EmployeeDemo.EmployeeID = EmployeeSalary.EmployeeID;

--Full Outer join:
Select EmployeeDemo.EmployeeID, FirstName, LastName, JobTitle, Salary  From 
[SQL Tutorial].dbo.EmployeeDemo Full Outer Join [SQL Tutorial].dbo.EmployeeSalary
On EmployeeDemo.EmployeeID = EmployeeSalary.EmployeeID;

--Left Outer join:
Select EmployeeDemo.EmployeeID, FirstName, LastName, JobTitle, Salary  From 
[SQL Tutorial].dbo.EmployeeDemo Left Outer Join [SQL Tutorial].dbo.EmployeeSalary
On EmployeeDemo.EmployeeID = EmployeeSalary.EmployeeID;

--Right Outer join:
Select EmployeeDemo.EmployeeID, FirstName, LastName, JobTitle, Salary  From 
[SQL Tutorial].dbo.EmployeeDemo Right Outer Join [SQL Tutorial].dbo.EmployeeSalary
On EmployeeDemo.EmployeeID = EmployeeSalary.EmployeeID;

--Another way:
Select EmployeeDemo.EmployeeID, FirstName, LastName, JobTitle, Salary  From 
[SQL Tutorial].dbo.EmployeeDemo Left Outer Join [SQL Tutorial].dbo.EmployeeSalary
On EmployeeDemo.EmployeeID = EmployeeSalary.EmployeeID
Where FirstName = 'Michael' Order by Salary DESC;

--Average Salary:
Select JobTitle, AVG(Salary) As AverageSalary From 
[SQL Tutorial].dbo.EmployeeDemo Inner Join [SQL Tutorial].dbo.EmployeeSalary
On EmployeeDemo.EmployeeID = EmployeeSalary.EmployeeID
Where JobTitle = 'Salesman' Group by Jobtitle
