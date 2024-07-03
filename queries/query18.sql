-- Create a stored procedure to add a new client and their first project
DELIMITER //

CREATE PROCEDURE AddClientAndProject(
    IN clientName VARCHAR(255),
    IN contactName VARCHAR(255),
    IN contactEmail VARCHAR(255),
    IN projectName VARCHAR(255),
    IN requirements TEXT,
    IN deadline DATE
)
BEGIN
    DECLARE newClientID INT;
    
    -- Insert a new client
    INSERT INTO Clients (ClientName, ContactName, ContactEmail)
    VALUES (clientName, contactName, contactEmail);
    
    -- Get the last inserted client ID
    SET newClientID = LAST_INSERT_ID();
    
    -- Insert the new project associated with the new client
    INSERT INTO Projects (ProjectName, Requirements, Deadline, ClientID)
    VALUES (projectName, requirements, deadline, newClientID);
END //

DELIMITER ;
