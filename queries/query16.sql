-- Create a function to calculate the number of days remaining until a project deadline
CREATE FUNCTION DaysUntilDeadline(project_deadline DATE)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE days_remaining INT;
    SET days_remaining = DATEDIFF(project_deadline, CURDATE());
    RETURN days_remaining;
END;

-- Test the function with a sample project deadline
SELECT 
    ProjectID,
    ProjectName,
    Deadline,
    DaysUntilDeadline(Deadline) AS DaysRemaining
FROM 
    Projects;
