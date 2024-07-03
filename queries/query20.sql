-- Create the audit table for logging project updates
CREATE TABLE ProjectAuditLog (
    AuditID INT PRIMARY KEY AUTO_INCREMENT,
    ProjectID INT,
    OldProjectName VARCHAR(255),
    NewProjectName VARCHAR(255),
    OldRequirements TEXT,
    NewRequirements TEXT,
    OldDeadline DATE,
    NewDeadline DATE,
    UpdatedBy VARCHAR(255),
    UpdatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (ProjectID) REFERENCES Projects(ProjectID)
);

-- Create the audit table for logging project updates
CREATE TABLE ProjectAuditLog (
    AuditID INT PRIMARY KEY AUTO_INCREMENT,
    ProjectID INT,
    OldProjectName VARCHAR(255),
    NewProjectName VARCHAR(255),
    OldRequirements TEXT,
    NewRequirements TEXT,
    OldDeadline DATE,
    NewDeadline DATE,
    UpdatedBy VARCHAR(255),
    UpdatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (ProjectID) REFERENCES Projects(ProjectID)
);

-- Create a trigger to log updates made to the Projects table
DELIMITER //

CREATE TRIGGER AfterProjectUpdate
AFTER UPDATE ON Projects
FOR EACH ROW
BEGIN
    INSERT INTO ProjectAuditLog (
        ProjectID, 
        OldProjectName, 
        NewProjectName, 
        OldRequirements, 
        NewRequirements, 
        OldDeadline, 
        NewDeadline,
        UpdatedBy
    )
    VALUES (
        OLD.ProjectID, 
        OLD.ProjectName, 
        NEW.ProjectName, 
        OLD.Requirements, 
        NEW.Requirements, 
        OLD.Deadline, 
        NEW.Deadline,
        'SYSTEM_USER()'
    );
END //

DELIMITER ;

-- Update a project record to test the trigger
UPDATE Projects
SET ProjectName = 'Updated Project Name'
WHERE ProjectID = 1;

-- Check the ProjectAuditLog table to verify the log entry
SELECT * FROM ProjectAuditLog;
