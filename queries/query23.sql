-- Create the Projects table if it doesn't exist
CREATE TABLE IF NOT EXISTS Projects (
    ProjectID INT PRIMARY KEY AUTO_INCREMENT,
    ProjectName VARCHAR(255) NOT NULL,
    Requirements TEXT,
    Deadline DATE,
    TeamLeadID INT,
    FOREIGN KEY (TeamLeadID) REFERENCES Employees(EmployeeID)
);

-- Create the view to show overdue projects with the number of days overdue
CREATE VIEW OverdueProjects AS
SELECT 
    ProjectID,
    ProjectName,
    Requirements,
    Deadline,
    DATEDIFF(CURDATE(), Deadline) AS DaysOverdue
FROM 
    Projects
WHERE 
    Deadline < CURDATE();

-- Query the view to see overdue projects along with the number of days overdue
SELECT * FROM OverdueProjects;
