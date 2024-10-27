--Better way to do group by operation in one line:
--Example of Partition by:
Select FirstName, LastName, Gender, Salary,
COUNT(Gender) Over(Partition by Gender) as TotalGender
From [SQL Tutorial]..EmployeeDemo Dem
JOIN [SQL Tutorial]..EmployeeSalary Sal
ON Dem.EmployeeID = Sal.EmployeeID
