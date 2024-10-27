--Case Statement:
Select FirstName, LastName, Age,
Case
	When Age > 30 Then 'Old'
	When Age Between 19 And 30 Then 'Young'
	Else 'Teenager'
End As Comment
From [SQL Tutorial].dbo.EmployeeDemo
Where Age is not NULL
Order by Age

--Salary Raise Example:
Select FirstName, LastName, JobTitle, Salary,
Case
	When JobTitle = 'Salesman' Then Salary + (Salary * .10)
	When JobTitle = 'Accountant' Then Salary + (Salary * .03)
	Else Salary + (Salary * .05)
End as IncrementedSalary
From [SQL Tutorial].dbo.EmployeeDemo Join [SQL Tutorial].dbo.EmployeeSalary
On EmployeeDemo.EmployeeID = EmployeeSalary.EmployeeID
