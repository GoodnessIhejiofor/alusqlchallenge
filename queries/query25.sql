-- Create the Employees table if it doesn't exist
CREATE TABLE IF NOT EXISTS Employees (
    EmployeeID INT PRIMARY KEY AUTO_INCREMENT,
    EmployeeName VARCHAR(255) NOT NULL
);

-- Create the Projects table if it doesn't exist
CREATE TABLE IF NOT EXISTS Projects (
    ProjectID INT PRIMARY KEY AUTO_INCREMENT,
    ProjectName VARCHAR(255) NOT NULL,
    Requirements TEXT,
    Deadline DATE,
    TeamLeadID INT,
    FOREIGN KEY (TeamLeadID) REFERENCES Employees(EmployeeID)
);

-- Create the TeamMembers table if it doesn't exist
CREATE TABLE IF NOT EXISTS TeamMembers (
    ProjectID INT,
    EmployeeID INT,
    FOREIGN KEY (ProjectID) REFERENCES Projects(ProjectID),
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID),
    PRIMARY KEY (ProjectID, EmployeeID)
);

DELIMITER //

CREATE TRIGGER BeforeProjectDelete
BEFORE DELETE ON Projects
FOR EACH ROW
BEGIN
    DECLARE teamMemberCount INT;
    
    -- Check if there are any team members assigned to the project
    SELECT COUNT(*) INTO teamMemberCount
    FROM TeamMembers
    WHERE ProjectID = OLD.ProjectID;
    
    -- If there are team members, prevent the deletion
    IF teamMemberCount > 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Cannot delete project with assigned team members';
    END IF;
END //

DELIMITER ;

-- Insert a sample employee
INSERT INTO Employees (EmployeeName) VALUES ('John Doe');

-- Insert a sample project
INSERT INTO Projects (ProjectName, Requirements, Deadline, TeamLeadID) 
VALUES ('E-commerce Platform', 'Extensive documentation', '2024-12-01', 1);

-- Insert sample team members
INSERT INTO TeamMembers (ProjectID, EmployeeID) VALUES (1, 1);

-- Try to delete the project (should raise an error)
DELETE FROM Projects WHERE ProjectID = 1;

-- Remove team members
DELETE FROM TeamMembers WHERE ProjectID = 1;

-- Try to delete the project again (should succeed)
DELETE FROM Projects WHERE ProjectID = 1;
