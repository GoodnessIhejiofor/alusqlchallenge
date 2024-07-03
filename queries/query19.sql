-- Create the archive table for completed projects
CREATE TABLE ArchivedProjects (
    ProjectID INT PRIMARY KEY AUTO_INCREMENT,
    ProjectName VARCHAR(255) NOT NULL,
    Requirements TEXT,
    Deadline DATE,
    ClientID INT,
    FOREIGN KEY (ClientID) REFERENCES Clients(ClientID)
);

-- Create a stored procedure to move completed projects to the archive table
DELIMITER //

CREATE PROCEDURE MoveCompletedProjects()
BEGIN
    -- Insert completed projects into the archive table
    INSERT INTO ArchivedProjects (ProjectID, ProjectName, Requirements, Deadline, ClientID)
    SELECT ProjectID, ProjectName, Requirements, Deadline, ClientID
    FROM Projects
    WHERE Deadline < CURDATE();
    
    -- Delete completed projects from the original table
    DELETE FROM Projects
    WHERE Deadline < CURDATE();
END //

DELIMITER ;

-- Test the stored procedure to move completed projects
CALL MoveCompletedProjects();

