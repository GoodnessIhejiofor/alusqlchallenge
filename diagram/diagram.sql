CREATE TABLE `Clients` (
  `ClientID` int PRIMARY KEY AUTO_INCREMENT,
  `ClientName` varchar(255),
  `ContactName` varchar(255),
  `ContactEmail` varchar(255)
);

CREATE TABLE `Employees` (
  `EmployeeID` int PRIMARY KEY AUTO_INCREMENT,
  `EmployeeName` varchar(255)
);

CREATE TABLE `Projects` (
  `ProjectID` int PRIMARY KEY AUTO_INCREMENT,
  `ProjectName` varchar(255),
  `Requirements` text,
  `Deadline` date,
  `TeamLeadID` int,
  `ClientID` int
);

CREATE TABLE `TeamMembers` (
  `ProjectID` int,
  `EmployeeID` int
);

ALTER TABLE `Projects` ADD FOREIGN KEY (`TeamLeadID`) REFERENCES `Employees` (`EmployeeID`);

ALTER TABLE `Projects` ADD FOREIGN KEY (`ClientID`) REFERENCES `Clients` (`ClientID`);

ALTER TABLE `TeamMembers` ADD FOREIGN KEY (`ProjectID`) REFERENCES `Projects` (`ProjectID`);

ALTER TABLE `TeamMembers` ADD FOREIGN KEY (`EmployeeID`) REFERENCES `Employees` (`EmployeeID`);
