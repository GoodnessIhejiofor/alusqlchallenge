-- Count the number of projects assigned to David Lee.
SELECT COUNT(*) FROM TeamMembers tm
JOIN Employees e ON tm.EmployeeID = e.EmployeeID
WHERE e.EmployeeName = 'David Lee';