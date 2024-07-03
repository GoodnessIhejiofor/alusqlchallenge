-- Create a view to show only ongoing projects (not yet completed).
CREATE VIEW OngoingProjects AS
SELECT * FROM Projects WHERE Deadline >= CURDATE();