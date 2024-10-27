--Create New Table:
Create table WareHouseEmployeeDemo
(EmployeeID int,
FirstName varchar(50),
LastName varchar(50),
Age int,
Gender varchar(50)
)

--Insert New Data:
Insert into WareHouseEmployeeDemo VALUES
(1013, 'Darryl', 'Philbin', NULL, 'Male'),
(1050, 'Roy', 'Anderson', 31, 'Male'),
(1051, 'Hidetoshi', 'Hasagawa', 40, 'Male'),
(1052, 'Val', 'Johnson', 31, 'Female')

--Union Operation:
Select * From [SQL Tutorial].dbo.EmployeeDemo 
UNION
Select * From [SQL Tutorial].dbo.WareHouseEmployeeDemo  

--To keep all of data:
Select * From [SQL Tutorial].dbo.EmployeeDemo 
UNION ALL
Select * From [SQL Tutorial].dbo.WareHouseEmployeeDemo
Order by EmployeeID