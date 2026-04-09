-- ADD SQL COMMANDS HERE OR CREATE NEW FILE
CREATE DATABASE club_organizations;
USE club_organizations;
CREATE TABLE User (
    UserID CHAR(4), 
    FirstName VARCHAR(20),
    LastName VARCHAR(20),
    Email VARCHAR(20),
    PasswordHash CHAR(20),
    AccountCreationDate DATE,
    -- AccountStatus idk what datatype, maybe boolean?
    Primary Key (UserID)
);
CREATE TABLE Category (
    CategoryID CHAR(4),
    CategoryName VARCHAR(20),
    Primary Key (CategoryID)
);
CREATE TABLE Club (
    ClubID CHAR(4),
    ClubName VARCHAR(20),
    ClubDescription TEXT,
    ClubCreationDate DATE,
    CategoryID CHAR(4),
    Primary Key (ClubID),
    FOREIGN KEY (CategoryID) REFERENCES Category(CategoryID)
);
CREATE TABLE JoinRequest (
    RequestID CHAR(4),
    RequestStatus VARCHAR(10),
    RequestTime TIMESTAMP,
    UserID CHAR(4),
    ClubID CHAR(4),
    Primary Key (RequestID),
    FOREIGN KEY (UserID) REFERENCES User(UserID),
    FOREIGN KEY (ClubID) REFERENCES Club(ClubID)
);
CREATE TABLE ClubMembership (
    UserID CHAR(4),
    ClubID CHAR(4),
    MembershipRole VARCHAR(20),
    MembershipStatus VARCHAR(10), -- maybe boolean?
    MembershipJoinDate DATE,
    Primary Key (UserID, ClubID),
    FOREIGN KEY (UserID) REFERENCES User(UserID),
    FOREIGN KEY (ClubID) REFERENCES Club(ClubID)
);
CREATE TABLE Announcement (
    AnnouncementID CHAR(4),
    AnnouncementTitle VARCHAR(30),
    AnnouncementBody TEXT,
    AnnouncementDate DATE,
    UserID CHAR(4),
    ClubID CHAR(4),
    Primary Key (AnnouncementID),
    FOREIGN KEY (UserID) REFERENCES User(UserID),
    FOREIGN KEY (ClubID) REFERENCES Club(ClubID)
);
CREATE TABLE Location (
    LocationID CHAR(4),
    BuildingName VARCHAR(30),
    RoomNumber INT,
    HomeAddress VARCHAR(50),
    Primary Key (LocationID)
);
CREATE TABLE EventType (
    EventTypeID CHAR(4),
    EventTypeName VARCHAR(20),
    Primary Key (EventTypeID)
);
CREATE TABLE Event (
    EventID CHAR(4),
    EventTitle VARCHAR(30),
    EventDescription TEXT,
    EventStartTime TIMESTAMP,
    EventEndTime TIMESTAMP,
    EventCapacity INT,
    EventStatus --idk datatype, 
    EventVisibility VARCHAR(10), 
    EventTypeID CHAR(4),
    LocationID CHAR(4),
    ClubID CHAR(4),
    Primary Key (EventID),
    FOREIGN KEY (EventTypeID) REFERENCES EventType(EventTypeID),
    FOREIGN KEY (LocationID) REFERENCES Location(LocationID),
    FOREIGN KEY (ClubID) REFERENCES Club(ClubID)
);
CREATE TABLE RSVP (
    RSVPID CHAR(4),
    RSVPStatus VARCHAR(10),
    RSVPCreationDate DATE,
    UserID CHAR(4),
    EventID CHAR(4),
    Primary Key (RSVPID),
    FOREIGN KEY (UserID) REFERENCES User(UserID),   
    FOREIGN KEY (EventID) REFERENCES Event(EventID)
)
CREATE TABLE Attendance (
    CheckInTime TIMESTAMP,
    CheckInMethod VARCHAR(20),
    EventID CHAR(4),
    RSVPID CHAR(4),
    Primary Key (EventID, RSVPID),
    FOREIGN KEY (RSVPID) REFERENCES RSVP(RSVPID),
    FOREIGN KEY (EventID) REFERENCES Event(EventID)
);

-- do all insert commands here, minimum 10 entries per table 
