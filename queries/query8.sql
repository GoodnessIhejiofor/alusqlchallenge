-- List employees who are not currently team leads on any project.
SELECT e.EmployeeName FROM Employees e
LEFT JOIN ProjectTeam pt ON e.EmployeeID = pt.EmployeeID AND pt.TeamLead = TRUE
WHERE pt.EmployeeID IS NULL;
