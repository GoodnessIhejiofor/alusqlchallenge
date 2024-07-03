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
-- Insert sample employees
INSERT INTO Employees (EmployeeName) VALUES ('John Doe'), ('Jane Smith'), ('Alice Brown'), ('David Lee');

-- Insert sample projects
INSERT INTO Projects (ProjectName, Requirements, Deadline, TeamLeadID) 
VALUES 
('E-commerce Platform', 'Extensive documentation', '2024-12-01', 1),
('Mobile App for Learning', 'Gamified learning modules', '2024-08-15', 2);

-- Insert sample team members
INSERT INTO TeamMembers (ProjectID, EmployeeID) 
VALUES 
(1, 3), 
(1, 4),
(2, 3);

-- Query the view to see the project details along with the total number of team members
SELECT * FROM ProjectDetailsWithTeamMembers;
