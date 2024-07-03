-- Create a view to simplify retrieving client contact 
CREATE VIEW ClientContacts AS
SELECT ClientName, ContactName, ContactEmail FROM Clients;