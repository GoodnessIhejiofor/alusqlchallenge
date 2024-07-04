-- Create database
CREATE DATABASE alu_project DEFAULT CHARACTER SET = 'utf8mb4';

-- Created project table
CREATE TABLE project (
    project_id int NOT NULL PRIMARY KEY AUTO_INCREMENT,
    project_name VARCHAR(255) NOT NULL COMMENT 'Project Name',
    requirements TEXT,
    deadline DATE NOT NULL COMMENT 'Deadline'
);

-- Created client table
CREATE TABLE client (
    client_id int NOT NULL PRIMARY KEY AUTO_INCREMENT,
    client_name VARCHAR(255) NOT NULL COMMENT 'Client Name',
    email VARCHAR(255) NOT NULL COMMENT 'Email'
);

-- Created team table
CREATE TABLE team (
    team_id int NOT NULL PRIMARY KEY AUTO_INCREMENT,
    team_member VARCHAR(255) NOT NULL COMMENT 'team_member',
    is_lead BOOLEAN NOT NULL DEFAULT FALSE COMMENT 'is_lead'
);
-- ADD client_id column to project table
ALTER TABLE project ADD COLUMN client_id INT;

-- ADD foreign key constraint to project table referencing client table
ALTER TABLE project
ADD CONSTRAINT fk_client FOREIGN KEY (client_id) REFERENCES client (client_id);

-- ADD project_id column to team table
ALTER TABLE team ADD COLUMN project_id INT;

-- ADD foreign key constraint to team table referencing project table
ALTER TABLE team
ADD CONSTRAINT fk_project FOREIGN KEY (project_id) REFERENCES project (project_id);

------------------------------------------------------------
-- ---------------------------(Part1 End) ------------------

-- DROP AND ALTER TEAM TABLE TO employees
CREATE TABLE employees (
    employee_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    employee_name VARCHAR(255) NOT NULL COMMENT 'Employee Name'
);

-- CREATE TEAM_MEMBERS TABLE WITH FOREIGN KEY CONSTRAINTS FOR project_id and employee_id (many-to-many relationship)
CREATE TABLE team_members (
    project_id INT,
    employee_id INT,
    FOREIGN KEY (project_id) REFERENCES project (project_id),
    FOREIGN KEY (employee_id) REFERENCES employees (employee_id)
);

-- ADD is_lead column to team_members table
ALTER TABLE team_members
ADD COLUMN is_lead BOOLEAN NOT NULL DEFAULT FALSE COMMENT 'is_lead';

-- Add test client row
INSERT INTO client VALUES ( "1", "Big Retail Inc.", "Peter Parker" );

-- Add test project row
INSERT INTO
    project
VALUES (
        "1",
        "E-commerce Platform",
        "Extensive documentation",
        "2024-12-01",
        "1"
    );

-- INSERT Client Data
INSERT INTO
    client (contact_name, client_name)
VALUES (
        'Trendsetters Inc.',
        'Sandra Bullock'
    ),
    (
        'Gearhead Supply Co.',
        'Daniel Craig'
    ),
    (
        "Fine Dine Group",
        "Olivia Rodriguez"
    ),
    (
        'Green Thumb Gardens',
        'Mark Robinson'
    ),
    (
        "Busy Bees Daycare",
        "Emily Blunt"
    ),
    (
        "Acme Pharmaceuticals",
        "David Kim"
    ),
    (
        "Knowledge Stream Inc.",
        "Matthew McConaughey"
    ),
    (
        "Software Craft LLC",
        "Jennifer Lopez"
    );

-- INSERT Project Data
INSERT INTO
    `project` (
        `project_name`,
        `requirements`,
        `deadline`,
        `client_id`
    )
VALUES (
        'Mobile App for Learning',
        'Gamified learning modules',
        '2024-08-15',
        2
    );