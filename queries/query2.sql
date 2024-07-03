-- List all projects for "Big Retail Inc." ordered by deadline.
SELECT p.* FROM Projects p
JOIN Clients c ON p.ClientID = c.ClientID
WHERE c.ClientName = 'Big Retail Inc.'
ORDER BY p.Deadline;
