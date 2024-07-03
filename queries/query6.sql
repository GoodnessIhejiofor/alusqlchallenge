-- Find the total number of employees working on each project.
SELECT p.ProjectName, COUNT(tm.EmployeeID) AS TotalEmployees 
FROM Projects p
JOIN TeamMembers tm ON p.ProjectID = tm.ProjectID
GROUP BY p.ProjectName;
