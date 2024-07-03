-- Create a function to calculate the number of days a project is overdue
CREATE FUNCTION DaysOverdue(project_deadline DATE)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE days_overdue INT;
    SET days_overdue = DATEDIFF(CURDATE(), project_deadline);
    RETURN IF(days_overdue > 0, days_overdue, 0);
END;
