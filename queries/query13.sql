-- Create the view to display project information along with assigned team leads
CREATE VIEW ProjectWithTeamLeads AS
SELECT 
    p.ProjectID,
    p.ProjectName,
    p.Requirements,
    p.Deadline,
    e.EmployeeID AS TeamLeadID,
    e.EmployeeName AS TeamLeadName
FROM 
    Projects p
JOIN 
    ProjectTeam pt ON p.ProjectID = pt.ProjectID
JOIN 
    Employees e ON pt.EmployeeID = e.EmployeeID
WHERE 
    pt.TeamLead = TRUE;