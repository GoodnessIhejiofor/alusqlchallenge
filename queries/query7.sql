-- Find all clients with projects having a deadline after October 31st, 2024.
SELECT DISTINCT c.ClientName FROM Clients c
JOIN Projects p ON c.ClientID = p.ClientID
WHERE p.Deadline > '2024-10-31';
