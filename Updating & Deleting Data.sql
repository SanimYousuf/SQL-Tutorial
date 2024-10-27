--Update Row Info:
UPDATE [SQL Tutorial].dbo.EmployeeDemo
SET EmployeeID = 1012 WHERE FirstName = 'Holy' AND LastName = 'Flax'

--Another Example:
UPDATE [SQL Tutorial].dbo.EmployeeDemo
SET Age = 31, Gender = 'Female'
WHERE EmployeeID = 1012

--Delete Row:
Delete From [SQL Tutorial].dbo.EmployeeDemo
Where EmployeeID = 1005