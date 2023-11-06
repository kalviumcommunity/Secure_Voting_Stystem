-- Table for Party Representatives
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

-- Table for Votes
CREATE TABLE Vote (
    VoteID INT PRIMARY KEY,
    ElectionID INT,
    LocationID VARCHAR(7),
    VoterID INT,
    RepresentativeID INT
);

-- Table for Locations
CREATE TABLE Location (
    LocationID VARCHAR(7) PRIMARY KEY,
    LocationName VARCHAR(20),
    ElectionID INT
);

-- Table for Elections
CREATE TABLE Election (
    ElectionID INT PRIMARY KEY,
    Title VARCHAR(20),
    Description VARCHAR(30),
    StartDate DATE,
    EndDate DATE
);

-- Table for Administrators
CREATE TABLE Administrator (
    AdministratorID INT PRIMARY KEY,
    FullName VARCHAR(15),
    LastName VARCHAR(15),
    EmailID VARCHAR(40) UNIQUE,
    Username VARCHAR(10) UNIQUE,
    Password VARCHAR(64) 
);

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






