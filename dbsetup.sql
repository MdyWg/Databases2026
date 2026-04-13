-- TABLE CREATION
CREATE DATABASE club_organizations;
USE club_organizations;
CREATE TABLE User (
    UserID CHAR(5), 
    FirstName VARCHAR(20),
    LastName VARCHAR(20),
    Email VARCHAR(20),
    PasswordHash CHAR(20),
    AccountCreationDate DATE,
    Primary Key (UserID)
);
CREATE TABLE Category (
    CategoryID CHAR(5),
    CategoryName VARCHAR(20),
    Primary Key (CategoryID)
);
CREATE TABLE Club (
    ClubID CHAR(5),
    ClubName VARCHAR(30),
    ClubDescription TEXT,
    ClubCreationDate DATE,
    Primary Key (ClubID)
);

CREATE TABLE ClubCategory (
    ClubID CHAR(5),
    CategoryID CHAR(5),
    Primary Key (ClubID, CategoryID),
    FOREIGN KEY (ClubID) REFERENCES Club(ClubID),
    FOREIGN KEY (CategoryID) REFERENCES Category(CategoryID)
);

CREATE TABLE JoinRequest (
    RequestID CHAR(5),
    RequestStatus VARCHAR(10),
    RequestTime TIMESTAMP,
    UserID CHAR(5),
    ClubID CHAR(5),
    Primary Key (RequestID),
    FOREIGN KEY (UserID) REFERENCES User(UserID),
    FOREIGN KEY (ClubID) REFERENCES Club(ClubID)
);
CREATE TABLE ClubMembership (
    UserID CHAR(5),
    ClubID CHAR(5),
    MembershipRole VARCHAR(20),
    MembershipStatus VARCHAR(10),
    MembershipJoinDate DATE,
    Primary Key (UserID, ClubID),
    FOREIGN KEY (UserID) REFERENCES User(UserID),
    FOREIGN KEY (ClubID) REFERENCES Club(ClubID)
);
CREATE TABLE Announcement (
    AnnouncementID CHAR(5),
    AnnouncementTitle VARCHAR(30),
    AnnouncementBody TEXT,
    AnnouncementDate DATE,
    UserID CHAR(5),
    ClubID CHAR(5),
    Primary Key (AnnouncementID),
    FOREIGN KEY (UserID) REFERENCES User(UserID),
    FOREIGN KEY (ClubID) REFERENCES Club(ClubID)
);
CREATE TABLE Location (
    LocationID CHAR(5),
    BuildingName VARCHAR(30),
    RoomNumber INT,
    HomeAddress VARCHAR(50),
    Primary Key (LocationID)
);
CREATE TABLE EventType (
    EventTypeID CHAR(5),
    EventTypeName VARCHAR(20),
    Primary Key (EventTypeID)
);
CREATE TABLE Event (
    EventID CHAR(5),
    EventTitle VARCHAR(30),
    EventDescription TEXT,
    EventStartTime TIMESTAMP,
    EventEndTime TIMESTAMP,
    EventCapacity INT,
    EventStatus VARCHAR(10),
    EventVisibility VARCHAR(10), 
    EventTypeID CHAR(5),
    LocationID CHAR(5),
    ClubID CHAR(5),
    Primary Key (EventID),
    FOREIGN KEY (EventTypeID) REFERENCES EventType(EventTypeID),
    FOREIGN KEY (LocationID) REFERENCES Location(LocationID),
    FOREIGN KEY (ClubID) REFERENCES Club(ClubID)
);
CREATE TABLE RSVP (
    RSVPID CHAR(5),
    RSVPStatus VARCHAR(10),
    RSVPCreationDate DATE,
    UserID CHAR(5),
    EventID CHAR(5),
    Primary Key (RSVPID),
    FOREIGN KEY (UserID) REFERENCES User(UserID),   
    FOREIGN KEY (EventID) REFERENCES Event(EventID)
)
CREATE TABLE Attendance (
    CheckInTime TIMESTAMP,
    CheckInMethod VARCHAR(20),
    EventID CHAR(5),
    RSVPID CHAR(5),
    Primary Key (EventID, RSVPID),
    FOREIGN KEY (RSVPID) REFERENCES RSVP(RSVPID),
    FOREIGN KEY (EventID) REFERENCES Event(EventID)
);

-- do all insert commands here, minimum 10 entries per table, we should probably do the inserts for whatever
-- task we're responsible for like users, clubs, and events

-- CLUB CATEGORIES
INSERT INTO Category (CategoryID, CategoryName) VALUES ('CA001', 'Sports');
INSERT INTO Category (CategoryID, CategoryName) VALUES ('CA002', 'Arts');
INSERT INTO Category (CategoryID, CategoryName) VALUES ('CA003', 'Academic');
INSERT INTO Category (CategoryID, CategoryName) VALUES ('CA004', 'Cultural');
INSERT INTO Category (CategoryID, CategoryName) VALUES ('CA005', 'Community Service');
INSERT INTO Category (CategoryID, CategoryName) VALUES ('CA006', 'Professional Development');
INSERT INTO Category (CategoryID, CategoryName) VALUES ('CA007', 'Hobbies');
INSERT INTO Category (CategoryID, CategoryName) VALUES ('CA008', 'Media');
INSERT INTO Category (CategoryID, CategoryName) VALUES ('CA009', 'Leadership');
INSERT INTO Category (CategoryID, CategoryName) VALUES ('CA010', 'STEM');

-- CLUBS AND ASSOCIATED CATEGORIES
INSERT INTO Club (ClubID, ClubName, ClubDescription, ClubCreationDate) VALUES 
('CL001', 'Society of Asian Scientists & Engineers (SASE)', 
'SASE at NYU Tandon School of Engineering aims to equip members with the skill set to succeed in professional environments', 
'2020-01-15');
INSERT INTO ClubCategory (ClubID, CategoryID) VALUES ('CL001', 'CA004');
INSERT INTO ClubCategory (ClubID, CategoryID) VALUES ('CL001', 'CA006');

INSERT INTO Club (ClubID, ClubName, ClubDescription, ClubCreationDate) VALUES 
('CL002', 'Alpha Omega Epsilon (AOE)', 'Alpha Omega Epsilon is a professional and social sorority', '2019-09-10');
INSERT INTO ClubCategory (ClubID, CategoryID) VALUES ('CL002', 'CA006');
INSERT INTO ClubCategory (ClubID, CategoryID) VALUES ('CL002', 'CA009');

INSERT INTO Club (ClubID, ClubName, ClubDescription, ClubCreationDate) VALUES 
('CL003', 'Business & Finance Group (BFG)', 
'The Business & Finance Club at NYU is dedicated to empowering the NYU Tandon student body with comprehensive financial education', 
'2021-02-20');
INSERT INTO ClubCategory (ClubID, CategoryID) VALUES ('CL003', 'CA006');

INSERT INTO Club (ClubID, ClubName, ClubDescription, ClubCreationDate) VALUES 
('CL004', 'Chemists Club', 
'The Chemists Club strives to bridge the gap between academia and industry in the chemistry and chemical engineering field', 
'2020-10-05');
INSERT INTO ClubCategory (ClubID, CategoryID) VALUES ('CL004', 'CA010');

INSERT INTO Club (ClubID, ClubName, ClubDescription, ClubCreationDate) VALUES 
('CL005', 'oSTEM', 
'The purpose of oSTEM at NYU is to foster a campus and community environment that is safe, supportive, 
and informative to all students regardless of physical gender, perceived gender, sexual orientation, 
or any other physical or physiological attribute', '2019-09-10');
INSERT INTO ClubCategory (ClubID, CategoryID) VALUES ('CL005', 'CA006');
INSERT INTO ClubCategory (ClubID, CategoryID) VALUES ('CL005', 'CA010');

INSERT INTO Club (ClubID, ClubName, ClubDescription, ClubCreationDate) VALUES 
('CL006', 'Poly Anime Society (PAS)',
'The Poly Anime Society promotes an environment that heightens awareness and appreciation of Japanese culture and entertainment', 
'2021-01-25');
INSERT INTO ClubCategory (ClubID, CategoryID) VALUES ('CL006', 'CA007');

INSERT INTO Club (ClubID, ClubName, ClubDescription, ClubCreationDate) VALUES 
('CL007', 'Poly Programming Club (PPC)',
'The Poly Programming Club (PPC) is the official competitive programming club of NYU Tandon!', 
'2022-12-23');
INSERT INTO ClubCategory (ClubID, CategoryID) VALUES ('CL007', 'CA010');

INSERT INTO Club (ClubID, ClubName, ClubDescription, ClubCreationDate) VALUES 
('CL008', 'Robotics Club', 
'Robotics Clubs mission is to create a relaxed learning environment that encourages students to learn from one another.',
'2020-09-15');
INSERT INTO ClubCategory (ClubID, CategoryID) VALUES ('CL008', 'CA010');

INSERT INTO Club (ClubID, ClubName, ClubDescription, ClubCreationDate) VALUES 
('CL009', 'Society of Women Engineers (SWE)',
'The Society of Women Engineers (SWE) is a not-for-profit educational and service organization that 
empowers women to succeed and advance in the field of engineering', '2019-09-10');
INSERT INTO ClubCategory (ClubID, CategoryID) VALUES ('CL009', 'CA006');

INSERT INTO Club (ClubID, ClubName, ClubDescription, ClubCreationDate) VALUES 
('CL010', 'Undergraduate Student Council',
'The School of Engineering Student Councils are elected by students of the School of Engineering to serve as
 their primary representatives, advocates, and liaisons to the entire student community', '2018-09-11');
INSERT INTO ClubCategory (ClubID, CategoryID) VALUES ('CL010', 'CA009');

-- ANNOUNCEMENTS
INSERT INTO Announcement (AnnouncementID, AnnouncementTitle, AnnouncementBody, AnnouncementDate, UserID, ClubID) VALUES 
('AN001', 'Welcome!', 'We are excited to welcome new members to our club! Join us for our first meeting of the semester', 
'2023-08-25', 'US001', 'CL001');

INSERT INTO Announcement (AnnouncementID, AnnouncementTitle, AnnouncementBody, AnnouncementDate, UserID, ClubID) VALUES 
('AN002', 'Upcoming Event: Networking Night', 'Join us for a night of networking with industry professionals!', 
'2023-09-10', 'US001', 'CL001');

INSERT INTO Announcement (AnnouncementID, AnnouncementTitle, AnnouncementBody, AnnouncementDate, UserID, ClubID) VALUES 
('AN003', 'Volunteer Opportunity', 'We are looking for volunteers to help with our community service event next month. 
Sign up if you are interested!', '2023-09-20', 'US002', 'CL009');

INSERT INTO Announcement (AnnouncementID, AnnouncementTitle, AnnouncementBody, AnnouncementDate, UserID, ClubID) VALUES 
('AN004', 'Study & Chill Session', 'Come hang out before finals!', '2023-12-01', 'US003', 'CL001');

INSERT INTO Announcement (AnnouncementID, AnnouncementTitle, AnnouncementBody, AnnouncementDate, UserID, ClubID) VALUES 
('AN005', 'Guest Speaker Event', 'We are excited to announce that we will be hosting a guest speaker from Google next week!',
'2023-10-15', 'US001', 'CL009');

INSERT INTO Announcement (AnnouncementID, AnnouncementTitle, AnnouncementBody, AnnouncementDate, UserID, ClubID) VALUES 
('AN006', 'Hackathon', 'Get ready for our hackathon! More details to come soon.', '2023-11-01', 'US004', 'CL007');

INSERT INTO Announcement (AnnouncementID, AnnouncementTitle, AnnouncementBody, AnnouncementDate, UserID, ClubID) VALUES 
('AN007', 'Volunteer Opportunity', 'Join us for a day of mentoring local high school students',
'2023-10-05', 'US002', 'CL009');

INSERT INTO Announcement (AnnouncementID, AnnouncementTitle, AnnouncementBody, AnnouncementDate, UserID, ClubID) VALUES 
('AN008', 'End of Semester Party', 'Join us for our end of semester party! Food and drinks will be provided.', '2023-12-15', 'US001', 'CL001');

INSERT INTO Announcement (AnnouncementID, AnnouncementTitle, AnnouncementBody, AnnouncementDate, UserID, ClubID) VALUES 
('AN009', 'Resume Workshop', 'Join us for a resume workshop to help you prepare for your job search!', '2023-09-30', 'US002', 'CL002');

INSERT INTO Announcement (AnnouncementID, AnnouncementTitle, AnnouncementBody, AnnouncementDate, UserID, ClubID) VALUES 
('AN010', 'Arduino Workshop', 'Learn the basics of Arduino programming and build your first project!', '2023-10-20', 'US002', 'CL008');


