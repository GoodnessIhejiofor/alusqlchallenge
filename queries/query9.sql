-- -- Combine a list of projects with deadlines before December 1st and another list with "Management" in the project name.
SELECT * FROM Projects WHERE Deadline < '2024-12-01'
UNION
SELECT * FROM Projects WHERE ProjectName LIKE '%Management%';