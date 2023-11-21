-- Table for Party Representatives

CREATE TABLE neww;
DROP TABLE neww;

SET SQL_SAFE_UPDATES = 0;

USE votingsystem;

CREATE TABLE PartyRepresentative (
    RepresentativeID INT PRIMARY KEY,
    PartyName VARCHAR(30),
    FullName VARCHAR(15),
    LastName VARCHAR(15),
    Age INT,
    EmailID VARCHAR(40) UNIQUE,
    UniqueID INT UNIQUE,
    Username VARCHAR(10) UNIQUE,
    Password VARCHAR(64),
    LocationID VARCHAR(7),
    NumberOfVotes INT
);

INSERT INTO PartyRepresentative VALUES(001, 'Momoland', 'Raj', 'Kumar', 45, 'raj.kumar@gmail.com', 11223344, 'raj123', 'kumar@raj', 'lud@001', 99);
INSERT INTO PartyRepresentative VALUES(002, 'Chocoland', 'Chhota', 'Bheem', 35, 'chhota.bheem@gmail.com', 11332244, 'chhota123', 'bheem@chhota', 'lud@001', 101);
INSERT INTO PartyRepresentative VALUES(003, 'Butterland', 'Champa', 'Kumari', 27, 'champa.kumari@gmail.com', 22113344, 'champa123', 'kumari@champa', 'lud@001', 399);
INSERT INTO PartyRepresentative VALUES(004, 'Newland', 'Manga', 'Singh', 432, 'mangal.singh@gmail.com', 21223344, 'mangal123', 'singh@mangal', 'lud@001',	199);
SELECT * FROM PartyRepresentative;
DELETE FROM PartyRepresentative;

SELECT * FROM PartyRepresentative INNER JOIN Vote
ON
PartyRepresentative.RepresentativeID = Vote.RepresentativeID;

SELECT * FROM PartyRepresentative LEFT JOIN Vote
ON
PartyRepresentative.RepresentativeID = Vote.RepresentativeID;

SELECT * FROM PartyRepresentative RIGHT JOIN Vote
ON
PartyRepresentative.RepresentativeID = Vote.RepresentativeID;



-- Table for Voters
CREATE TABLE Voter (
    VoterID INT PRIMARY KEY,
    FullName VARCHAR(15),
    LastName VARCHAR(15),
    Age INT,
    EmailID VARCHAR(40) UNIQUE,
    UniqueID INT UNIQUE,
    Username VARCHAR(10) UNIQUE,
    Password VARCHAR(64),
    LocationID VARCHAR(7)
);

INSERT INTO Voter VALUES(101, 'Jaggu', 'Kalandar', 22, 'jaggu.kalandar@gmail.com', 12223444, 'jaggu123', 'kalandar@jaggu', 'lud@001');
INSERT INTO Voter VALUES(102, 'Tuntun', 'Mausi', 52, 'tuntun.mausi@gmail.com', 12233444, 'tuntun123', 'mausi@tuntun', 'lud@001');
INSERT INTO Voter VALUES(103, 'Rajkumari', 'Indumati', 32, 'rajkumari.indumati@gmail.com', 13223444, 'kumari123', 'indumati@rajkumari', 'lud@001');

SELECT * FROM Voter;

CREATE INDEX VoterIndex ON Voter (FullName);
DROP INDEX VoterIndx ON Voter;

UPDATE Voter
SET VoterID = 101
WHERE UniqueID = 12223444;

UPDATE Voter
SET VoterID = 102
WHERE UniqueID = 12233444;

-- Table for Votes
CREATE TABLE Vote (
    VoteID INT PRIMARY KEY,
    ElectionID INT,
    LocationID VARCHAR(7),
    VoterID INT,
    RepresentativeID INT
);

INSERT INTO Vote VALUES(1, 010101, 'lud@001', 101, 001);
INSERT INTO Vote VALUES(2, 010101, 'lud@001', 102, 002);
INSERT INTO Vote VALUES(3, 010101, 'lud@001', 103, 001);
INSERT INTO Vote VALUES(4, 010101, 'lud@001', 103, 003);

SELECT * FROM Vote;
SELECT VoteID, ElectionID FROM Vote;
DELETE FROM Vote;

-- Table for Locations
CREATE TABLE Location (
    LocationID VARCHAR(7) PRIMARY KEY,
    LocationName VARCHAR(20),
    ElectionID INT
);

INSERT INTO Location VAlUES('lud@001', 'Ludhyana', 010101);

-- Table for Elections
CREATE TABLE Election (
    ElectionID INT PRIMARY KEY,
    Title VARCHAR(20),
    Description VARCHAR(30),
    StartDate DATE,
    EndDate DATE
);

INSERT INTO Election VALUES(010101, 'Loksabha', 'Important Election', '2023-10-01', '2023-11-01');


-- Table for Administrators
CREATE TABLE Administrator (
    AdministratorID INT PRIMARY KEY,
    FullName VARCHAR(15),
    LastName VARCHAR(15),
    EmailID VARCHAR(40) UNIQUE,
    Username VARCHAR(10) UNIQUE,
    Password VARCHAR(64) 
);

INSERT INTO Administrator VALUES(00100, 'Jawahar', 'Ningam', 'jawahar.ningam@gmail.com', 'jawahar123', 'ningam@jawahar');

SELECT * FROM Administrator;
DELETE FROM Administrator;


-- Define foreign
ALTER TABLE Vote
ADD CONSTRAINT FK_Vote_Election
FOREIGN KEY (ElectionID) REFERENCES Election(ElectionID);

ALTER TABLE Vote
ADD CONSTRAINT FK_Vote_Location
FOREIGN KEY (LocationID) REFERENCES Location(LocationID);

ALTER TABLE Vote
ADD CONSTRAINT FK_Vote_Voter
FOREIGN KEY (VoterID) REFERENCES Voter(VoterID);

ALTER TABLE Vote
ADD CONSTRAINT FK_Vote_Representaitve
FOREIGN KEY (RepresentativeID) REFERENCES PartyRepresentative(RepresentativeID);

ALTER TABLE Location
ADD CONSTRAINT FK_Location_Election
FOREIGN KEY (ElectionID) REFERENCES Election(ElectionID);






