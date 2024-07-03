-- Create the view to show project names and client contact information for projects with a deadline in November 2024
CREATE VIEW ProjectsNovember2024 AS
SELECT 
    p.ProjectName,
    c.ClientName,
    c.ContactName,
    c.ContactEmail,
    p.Deadline
FROM 
    Projects p
JOIN 
    Clients c ON p.ClientID = c.ClientID
WHERE 
    p.Deadline BETWEEN '2024-11-01' AND '2024-11-30';
