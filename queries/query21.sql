-- Create the Employees table if it doesn't exist
CREATE TABLE IF NOT EXISTS Employees (
    EmployeeID INT PRIMARY KEY AUTO_INCREMENT,
    EmployeeName VARCHAR(255) NOT NULL
);

-- Create the Projects table with TeamLeadID
CREATE TABLE IF NOT EXISTS Projects (
    ProjectID INT PRIMARY KEY AUTO_INCREMENT,
    ProjectName VARCHAR(255) NOT NULL,
    Requirements TEXT,
    Deadline DATE,
    TeamLeadID INT,
    FOREIGN KEY (TeamLeadID) REFERENCES Employees(EmployeeID)
);
-- Set delimiter to allow for trigger definition
DELIMITER //

-- Trigger to ensure a valid TeamLeadID on INSERT
CREATE TRIGGER BeforeProjectInsert
BEFORE INSERT ON Projects
FOR EACH ROW
BEGIN
    DECLARE leadExists INT;
    SELECT COUNT(*) INTO leadExists FROM Employees WHERE EmployeeID = NEW.TeamLeadID;
    IF leadExists = 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Invalid Team Lead: The team lead assigned to the project does not exist in the Employees table.';
    END IF;
END //

-- Trigger to ensure a valid TeamLeadID on UPDATE
CREATE TRIGGER BeforeProjectUpdate
BEFORE UPDATE ON Projects
FOR EACH ROW
BEGIN
    DECLARE leadExists INT;
    SELECT COUNT(*) INTO leadExists FROM Employees WHERE EmployeeID = NEW.TeamLeadID;
    IF leadExists = 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Invalid Team Lead: The team lead assigned to the project does not exist in the Employees table.';
    END IF;
END //

-- Reset delimiter
DELIMITER ;
-- Insert a valid employee
INSERT INTO Employees (EmployeeName) VALUES ('John Doe');

-- Insert another valid employee
INSERT INTO Employees (EmployeeName) VALUES ('Jane Smith');

-- Try to insert a project with a valid TeamLeadID
INSERT INTO Projects (ProjectName, Requirements, Deadline, TeamLeadID) VALUES ('New Project', 'Some requirements', '2024-12-31', 1);

-- Try to insert a project with an invalid TeamLeadID (should raise an error)
INSERT INTO Projects (ProjectName, Requirements, Deadline, TeamLeadID) VALUES ('Invalid Project', 'Some requirements', '2024-12-31', 999);
