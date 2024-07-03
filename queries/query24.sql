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

CREATE PROCEDURE UpdateProjectTeamMembers(
    IN p_ProjectID INT,
    IN p_NewTeamMembers TEXT
)
BEGIN
    -- Declare a variable to store each employee ID
    DECLARE v_EmployeeID INT;
    DECLARE v_Delimiter CHAR(1) DEFAULT ',';

    -- Remove existing team members
    DELETE FROM TeamMembers WHERE ProjectID = p_ProjectID;

    -- Loop through the new team members list
    WHILE LENGTH(p_NewTeamMembers) > 0 DO
        -- Extract the next employee ID from the list
        SET v_EmployeeID = SUBSTRING_INDEX(p_NewTeamMembers, v_Delimiter, 1);

        -- Insert the new team member
        INSERT INTO TeamMembers (ProjectID, EmployeeID) VALUES (p_ProjectID, v_EmployeeID);

        -- Remove the inserted employee ID from the list
        SET p_NewTeamMembers = SUBSTRING(p_NewTeamMembers FROM LENGTH(v_EmployeeID) + 2);
    END WHILE;
END //

DELIMITER ;

-- Call the stored procedure to update team members
CALL UpdateProjectTeamMembers(1, '2,3,4');