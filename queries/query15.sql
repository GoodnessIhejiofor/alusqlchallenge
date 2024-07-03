-- Create the view to display the total number of projects assigned to each employee
CREATE VIEW EmployeeProjectCount AS
SELECT 
    e.EmployeeID,
    e.EmployeeName,
    COUNT(tm.ProjectID) AS TotalProjects
FROM 
    Employees e
LEFT JOIN 
    TeamMembers tm ON e.EmployeeID = tm.EmployeeID
GROUP BY 
    e.EmployeeID, e.EmployeeName;
