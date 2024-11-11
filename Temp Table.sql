--Create a temporary table:
Create Table #tempTable (
EmployeeID int,
JobTitle varchar(100),
Salary int
)

--Insert data from other table:
Insert Into #tempTable Select
* From [SQL Tutorial]..EmployeeSalary
