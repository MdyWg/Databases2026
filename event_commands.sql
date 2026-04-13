USE club_organizations;

-- INSERT LOCATIONS
INSERT INTO Location (LocationID, BuildingName, RoomNumber, HomeAddress) VALUES ('LO001', 'Rogers Hall', 101, '6 MetroTech Center, Brooklyn, NY 11201');
INSERT INTO Location (LocationID, BuildingName, RoomNumber, HomeAddress) VALUES ('LO002', 'Jacobs Academic Building', 674, '370 Jay Street, Brooklyn, NY 11201');
INSERT INTO Location (LocationID, BuildingName, RoomNumber, HomeAddress) VALUES ('LO003', 'Dibner Library', 201, '5 MetroTech Center, Brooklyn, NY 11201');
INSERT INTO Location (LocationID, BuildingName, RoomNumber, HomeAddress) VALUES ('LO004', 'Tandon MakerSpace', 100, '6 MetroTech Center, Brooklyn, NY 11201');
INSERT INTO Location (LocationID, BuildingName, RoomNumber, HomeAddress) VALUES ('LO005', 'Pfizer Auditorium', 1, '5 MetroTech Center, Brooklyn, NY 11201');
INSERT INTO Location (LocationID, BuildingName, RoomNumber, HomeAddress) VALUES ('LO006', '2 MetroTech Center', 802, '2 MetroTech Center, Brooklyn, NY 11201');
INSERT INTO Location (LocationID, BuildingName, RoomNumber, HomeAddress) VALUES ('LO007', 'Rogers Hall', 310, '6 MetroTech Center, Brooklyn, NY 11201');
INSERT INTO Location (LocationID, BuildingName, RoomNumber, HomeAddress) VALUES ('LO008', 'Jacobs Academic Building', 473, '370 Jay Street, Brooklyn, NY 11201');
INSERT INTO Location (LocationID, BuildingName, RoomNumber, HomeAddress) VALUES ('LO009', 'Dibner Library', 105, '5 MetroTech Center, Brooklyn, NY 11201');
INSERT INTO Location (LocationID, BuildingName, RoomNumber, HomeAddress) VALUES ('LO010', '2 MetroTech Center', 1001, '2 MetroTech Center, Brooklyn, NY 11201');

-- INSERT EVENT TYPES
INSERT INTO EventType (EventTypeID, EventTypeName) VALUES ('ET001', 'Workshop');
INSERT INTO EventType (EventTypeID, EventTypeName) VALUES ('ET002', 'Networking');
INSERT INTO EventType (EventTypeID, EventTypeName) VALUES ('ET003', 'Social');
INSERT INTO EventType (EventTypeID, EventTypeName) VALUES ('ET004', 'General Meeting');
INSERT INTO EventType (EventTypeID, EventTypeName) VALUES ('ET005', 'Hackathon');
INSERT INTO EventType (EventTypeID, EventTypeName) VALUES ('ET006', 'Seminar');
INSERT INTO EventType (EventTypeID, EventTypeName) VALUES ('ET007', 'Competition');
INSERT INTO EventType (EventTypeID, EventTypeName) VALUES ('ET008', 'Community Service');
INSERT INTO EventType (EventTypeID, EventTypeName) VALUES ('ET009', 'Info Session');
INSERT INTO EventType (EventTypeID, EventTypeName) VALUES ('ET010', 'Conference');

-- INSERT EVENTS
INSERT INTO Event (EventID, EventTitle, EventDescription, EventStartTime, EventEndTime, EventCapacity, EventStatus, EventVisibility, EventTypeID, LocationID, ClubID) VALUES
('EV001', 'SASE Networking Night', 'Connect with industry professionals and SASE alumni over food and conversation.', '2025-10-15 18:00:00', '2025-10-15 20:00:00', 80, 'Scheduled', 'Public', 'ET002', 'LO005', 'CL001');

INSERT INTO Event (EventID, EventTitle, EventDescription, EventStartTime, EventEndTime, EventCapacity, EventStatus, EventVisibility, EventTypeID, LocationID, ClubID) VALUES
('EV002', 'AOE Sisters Social', 'A members-only social for current AOE sisters.', '2025-10-20 17:00:00', '2025-10-20 19:00:00', 30, 'Scheduled', 'MembersOnly', 'ET003', 'LO002', 'CL002');

INSERT INTO Event (EventID, EventTitle, EventDescription, EventStartTime, EventEndTime, EventCapacity, EventStatus, EventVisibility, EventTypeID, LocationID, ClubID) VALUES
('EV003', 'BFG Stock Pitch Competition', 'Compete to deliver the best stock pitch in front of industry judges.', '2025-11-05 14:00:00', '2025-11-05 17:00:00', 50, 'Scheduled', 'Public', 'ET007', 'LO005', 'CL003');

INSERT INTO Event (EventID, EventTitle, EventDescription, EventStartTime, EventEndTime, EventCapacity, EventStatus, EventVisibility, EventTypeID, LocationID, ClubID) VALUES
('EV004', 'Chem Club Lab Tour', 'Tour the chemistry research labs with faculty guides. Open to members only.', '2025-09-28 11:00:00', '2025-09-28 12:30:00', 20, 'Completed', 'MembersOnly', 'ET009', 'LO007', 'CL004');

INSERT INTO Event (EventID, EventTitle, EventDescription, EventStartTime, EventEndTime, EventCapacity, EventStatus, EventVisibility, EventTypeID, LocationID, ClubID) VALUES
('EV005', 'oSTEM Study Session', 'Midterm study session open to all students. Snacks provided.', '2025-10-08 16:00:00', '2025-10-08 19:00:00', 40, 'Completed', 'Public', 'ET003', 'LO003', 'CL005');

INSERT INTO Event (EventID, EventTitle, EventDescription, EventStartTime, EventEndTime, EventCapacity, EventStatus, EventVisibility, EventTypeID, LocationID, ClubID) VALUES
('EV006', 'Anime Movie Night', 'Watch a classic Miyazaki film with club members. Popcorn and drinks included.', '2025-11-12 19:00:00', '2025-11-12 22:00:00', 60, 'Scheduled', 'Public', 'ET003', 'LO005', 'CL006');

INSERT INTO Event (EventID, EventTitle, EventDescription, EventStartTime, EventEndTime, EventCapacity, EventStatus, EventVisibility, EventTypeID, LocationID, ClubID) VALUES
('EV007', 'PPC Weekly Practice', 'Weekly competitive programming practice session. All skill levels welcome.', '2025-10-22 18:00:00', '2025-10-22 20:00:00', 35, 'Scheduled', 'MembersOnly', 'ET004', 'LO008', 'CL007');

INSERT INTO Event (EventID, EventTitle, EventDescription, EventStartTime, EventEndTime, EventCapacity, EventStatus, EventVisibility, EventTypeID, LocationID, ClubID) VALUES
('EV008', 'Robotics Arduino Workshop', 'Hands-on Arduino workshop. Build your first robot arm.', '2025-11-01 13:00:00', '2025-11-01 16:00:00', 25, 'Scheduled', 'Public', 'ET001', 'LO004', 'CL008');

INSERT INTO Event (EventID, EventTitle, EventDescription, EventStartTime, EventEndTime, EventCapacity, EventStatus, EventVisibility, EventTypeID, LocationID, ClubID) VALUES
('EV009', 'SWE Resume Workshop', 'Get your resume reviewed by engineers from top companies.', '2025-09-18 15:00:00', '2025-09-18 17:00:00', 45, 'Completed', 'Public', 'ET001', 'LO002', 'CL009');

INSERT INTO Event (EventID, EventTitle, EventDescription, EventStartTime, EventEndTime, EventCapacity, EventStatus, EventVisibility, EventTypeID, LocationID, ClubID) VALUES
('EV010', 'Student Council Town Hall', 'Open forum for students to voice concerns and ideas for the semester.', '2025-10-01 12:00:00', '2025-10-01 13:30:00', 100, 'Completed', 'Public', 'ET004', 'LO005', 'CL010');

INSERT INTO Event (EventID, EventTitle, EventDescription, EventStartTime, EventEndTime, EventCapacity, EventStatus, EventVisibility, EventTypeID, LocationID, ClubID) VALUES
('EV011', 'SASE Hackathon 2025', 'A 24-hour hackathon hosted by SASE. Teams of up to 4. Prizes for top 3.', '2025-11-15 10:00:00', '2025-11-16 10:00:00', 120, 'Scheduled', 'Public', 'ET005', 'LO006', 'CL001');

INSERT INTO Event (EventID, EventTitle, EventDescription, EventStartTime, EventEndTime, EventCapacity, EventStatus, EventVisibility, EventTypeID, LocationID, ClubID) VALUES
('EV012', 'SWE Industry Panel', 'Hear from women engineers at Meta, Google, and Amazon about their career paths.', '2025-11-20 17:00:00', '2025-11-20 19:00:00', 70, 'Scheduled', 'Public', 'ET006', 'LO005', 'CL009');

-- INSERT RSVPs
INSERT INTO RSVP (RSVPID, RSVPStatus, RSVPCreationDate, UserID, EventID) VALUES ('RS001', 'Going', '2025-10-10', 'U0001', 'EV001');
INSERT INTO RSVP (RSVPID, RSVPStatus, RSVPCreationDate, UserID, EventID) VALUES ('RS002', 'Going', '2025-10-11', 'U0002', 'EV001');
INSERT INTO RSVP (RSVPID, RSVPStatus, RSVPCreationDate, UserID, EventID) VALUES ('RS003', 'Tentative', '2025-10-12', 'U0003', 'EV001');
INSERT INTO RSVP (RSVPID, RSVPStatus, RSVPCreationDate, UserID, EventID) VALUES ('RS004', 'Going', '2025-10-18', 'U0002', 'EV002');
INSERT INTO RSVP (RSVPID, RSVPStatus, RSVPCreationDate, UserID, EventID) VALUES ('RS005', 'Going', '2025-10-30', 'U0004', 'EV003');
INSERT INTO RSVP (RSVPID, RSVPStatus, RSVPCreationDate, UserID, EventID) VALUES ('RS006', 'Going', '2025-09-25', 'U0003', 'EV004');
INSERT INTO RSVP (RSVPID, RSVPStatus, RSVPCreationDate, UserID, EventID) VALUES ('RS007', 'Going', '2025-10-05', 'U0005', 'EV005');
INSERT INTO RSVP (RSVPID, RSVPStatus, RSVPCreationDate, UserID, EventID) VALUES ('RS008', 'NotGoing', '2025-10-06', 'U0006', 'EV005');
INSERT INTO RSVP (RSVPID, RSVPStatus, RSVPCreationDate, UserID, EventID) VALUES ('RS009', 'Going', '2025-11-10', 'U0007', 'EV006');
INSERT INTO RSVP (RSVPID, RSVPStatus, RSVPCreationDate, UserID, EventID) VALUES ('RS010', 'Going', '2025-10-20', 'U0008', 'EV007');
INSERT INTO RSVP (RSVPID, RSVPStatus, RSVPCreationDate, UserID, EventID) VALUES ('RS011', 'Tentative', '2025-10-28', 'U0009', 'EV008');
INSERT INTO RSVP (RSVPID, RSVPStatus, RSVPCreationDate, UserID, EventID) VALUES ('RS012', 'Going', '2025-09-15', 'U0010', 'EV009');

-- INSERT ATTENDANCE
INSERT INTO Attendance(CheckInTime, CheckInMethod, EventID, RSVPID) VALUES ('2025-10-15 17:55:00', 'Manual', 'EV001', 'RS001');
INSERT INTO Attendance(CheckInTime, CheckInMethod, EventID, RSVPID) VALUES ('2025-10-15 18:02:00', 'Manual', 'EV001', 'RS002');
INSERT INTO Attendance(CheckInTime, CheckInMethod, EventID, RSVPID) VALUES ('2025-10-20 16:58:00', 'QRCode', 'EV002', 'RS004');
INSERT INTO Attendance(CheckInTime, CheckInMethod, EventID, RSVPID) VALUES ('2025-11-05 13:50:00', 'Manual', 'EV003', 'RS005');
INSERT INTO Attendance(CheckInTime, CheckInMethod, EventID, RSVPID) VALUES ('2025-09-28 10:55:00', 'QRCode', 'EV004', 'RS006');
INSERT INTO Attendance(CheckInTime, CheckInMethod, EventID, RSVPID) VALUES ('2025-10-08 15:58:00', 'Manual', 'EV005', 'RS007');
INSERT INTO Attendance(CheckInTime, CheckInMethod, EventID, RSVPID) VALUES ('2025-11-12 18:55:00', 'QRCode', 'EV006', 'RS009');
INSERT INTO Attendance(CheckInTime, CheckInMethod, EventID, RSVPID) VALUES ('2025-10-22 17:50:00', 'Manual', 'EV007', 'RS010');
INSERT INTO Attendance(CheckInTime, CheckInMethod, EventID, RSVPID) VALUES ('2025-09-18 14:55:00', 'QRCode', 'EV009', 'RS012');
INSERT INTO Attendance(CheckInTime, CheckInMethod, EventID, RSVPID) VALUES ('2025-11-01 11:50:00', 'Manual', 'EV008', 'RS011');


-- SQL COMMANDS USED BY THE APP


-- EVENT CREATION --

-- Insert a new event
INSERT INTO Event (EventID, EventTitle, EventDescription, EventStartTime, EventEndTime, EventCapacity, EventStatus, EventVisibility, EventTypeID, LocationID, ClubID)
VALUES ('EV013', 'New Workshop', 'A brand new workshop for beginners.', '2025-12-01 10:00:00', '2025-12-01 12:00:00', 30, 'Scheduled', 'Public', 'ET001', 'LO001', 'CL001');

-- Update event details
UPDATE Event
SET EventTitle = 'Updated Workshop Title',
    EventDescription = 'Updated description with new details.',
    EventCapacity = 40
WHERE EventID = 'EV013';

-- Cancel an event
UPDATE Event
SET EventStatus = 'Cancelled'
WHERE EventID = 'EV013';

-- Delete an event
DELETE FROM Event
WHERE EventID = 'EV013';


-- EVENT SEARCH AND FILTERING --

-- Get all upcoming scheduled events
SELECT e.EventID, e.EventTitle, e.EventStartTime, e.EventEndTime,
       e.EventVisibility, c.ClubName, l.BuildingName, l.RoomNumber
FROM Event e
INNER JOIN Club c ON e.ClubID = c.ClubID
INNER JOIN Location l ON e.LocationID = l.LocationID
WHERE e.EventStatus = 'Scheduled'
ORDER BY e.EventStartTime;

-- Search events by title keyword
SELECT e.EventID, e.EventTitle, e.EventStartTime, c.ClubName
FROM Event e
INNER JOIN Club c ON e.ClubID = c.ClubID
WHERE e.EventTitle LIKE '%Workshop%';

-- Filter events by club
SELECT EventID, EventTitle, EventStartTime, EventEndTime, EventVisibility
FROM Event
WHERE ClubID = 'CL001'
ORDER BY EventStartTime;

-- Filter events by event type
SELECT e.EventID, e.EventTitle, e.EventStartTime, c.ClubName
FROM Event e
INNER JOIN Club c ON e.ClubID = c.ClubID
WHERE e.EventTypeID = 'ET001';

-- Filter public events only
SELECT e.EventID, e.EventTitle, e.EventStartTime, c.ClubName, l.BuildingName
FROM Event e
INNER JOIN Club c ON e.ClubID = c.ClubID
INNER JOIN Location l ON e.LocationID = l.LocationID
WHERE e.EventVisibility = 'Public' AND e.EventStatus = 'Scheduled'
ORDER BY e.EventStartTime;

-- Filter events by date range
SELECT e.EventID, e.EventTitle, e.EventStartTime, c.ClubName
FROM Event e
INNER JOIN Club c ON e.ClubID = c.ClubID
WHERE e.EventStartTime BETWEEN '2025-10-01' AND '2025-10-31';

-- Get single event details (individual event page)
SELECT e.EventID, e.EventTitle, e.EventDescription, e.EventStartTime, e.EventEndTime,
       e.EventCapacity, e.EventVisibility, e.EventStatus,
       c.ClubName, l.BuildingName, l.RoomNumber, l.HomeAddress
FROM Event e
INNER JOIN Club c ON e.ClubID = c.ClubID
INNER JOIN Location l ON e.LocationID = l.LocationID
WHERE e.EventID = 'EV001';

-- Get events a user has RSVP'd to
SELECT e.EventID, e.EventTitle, e.EventStartTime, r.RSVPStatus, c.ClubName
FROM Event e
INNER JOIN RSVP r ON e.EventID = r.EventID
INNER JOIN Club c ON e.ClubID = c.ClubID
WHERE r.UserID = 'US001';

-- Get RSVP count for an event
SELECT e.EventID, e.EventTitle, e.EventCapacity, COUNT(r.RSVPID) AS GoingCount
FROM Event e
LEFT JOIN RSVP r ON e.EventID = r.EventID AND r.RSVPStatus = 'Going'
WHERE e.EventID = 'EV001'
GROUP BY e.EventID, e.EventTitle, e.EventCapacity;


-- RSVP HANDLING --

-- Create a new RSVP
INSERT INTO RSVP (RSVPID, RSVPStatus, RSVPCreationDate, UserID, EventID)
VALUES ('RS013', 'Going', CURDATE(), 'US001', 'EV006');

-- Update RSVP status
UPDATE RSVP
SET RSVPStatus = 'Tentative'
WHERE RSVPID = 'RS013';

-- Cancel RSVP
UPDATE RSVP
SET RSVPStatus = 'NotGoing'
WHERE RSVPID = 'RS013';

-- Delete an RSVP
DELETE FROM RSVP
WHERE RSVPID = 'RS013';

-- Check if user already RSVP'd to an event
SELECT RSVPID, RSVPStatus
FROM RSVP
WHERE UserID = 'US001' AND EventID = 'EV006';

-- Get all RSVPs for an event
SELECT r.RSVPID, r.RSVPStatus, r.RSVPCreationDate, u.FirstName, u.LastName
FROM RSVP r
INNER JOIN User u ON r.UserID = u.UserID
WHERE r.EventID = 'EV001';

-- Count RSVPs by status for an event
SELECT RSVPStatus, COUNT(*) AS StatusCount
FROM RSVP
WHERE EventID = 'EV001'
GROUP BY RSVPStatus;


-- ATTENDANCE / CHECK-IN --

-- Check in a user
INSERT INTO Attendance (CheckInTime, CheckInMethod, EventID, RSVPID)
VALUES (NOW(), 'Manual', 'EV001', 'RS001');

-- Check if user already checked in
SELECT CheckInTime, CheckInMethod
FROM Attendance
WHERE EventID = 'EV001' AND RSVPID = 'RS001';

-- Get all attendees for an event
SELECT u.FirstName, u.LastName, a.CheckInTime, a.CheckInMethod
FROM Attendance a
INNER JOIN RSVP r ON a.RSVPID = r.RSVPID
INNER JOIN User u ON r.UserID = u.UserID
WHERE a.EventID = 'EV001';

-- Count attendees for an event
SELECT COUNT(*) AS TotalAttendees
FROM Attendance
WHERE EventID = 'EV001';

-- Verify user RSVP'd Going before check-in
SELECT r.RSVPID
FROM RSVP r
WHERE r.EventID = 'EV001' AND r.UserID = 'US001' AND r.RSVPStatus = 'Going';

-- Delete attendance record
DELETE FROM Attendance
WHERE EventID = 'EV001' AND RSVPID = 'RS001';


-- ADVANCED PL/SQL COMMANDS


-- TRIGGER: prevent RSVP if event is at full capacity
DELIMITER //
CREATE TRIGGER trg_check_event_capacity
BEFORE INSERT ON RSVP
FOR EACH ROW
BEGIN
    DECLARE current_going INT;
    DECLARE max_capacity INT;

    IF NEW.RSVPStatus = 'Going' THEN
        SELECT EventCapacity INTO max_capacity
        FROM Event WHERE EventID = NEW.EventID;

        SELECT COUNT(*) INTO current_going
        FROM RSVP WHERE EventID = NEW.EventID AND RSVPStatus = 'Going';

        IF current_going >= max_capacity THEN
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Cannot RSVP: event is at full capacity.';
        END IF;
    END IF;
END //
DELIMITER ;


-- STORED PROCEDURE: create an RSVP with validation
DELIMITER //
CREATE PROCEDURE sp_create_rsvp(
    IN p_RSVPID CHAR(5),
    IN p_UserID CHAR(5),
    IN p_EventID CHAR(5),
    IN p_RSVPStatus VARCHAR(10)
)
BEGIN
    DECLARE v_event_status VARCHAR(15);
    DECLARE v_event_visibility VARCHAR(10);
    DECLARE v_club_id CHAR(5);
    DECLARE v_existing INT;
    DECLARE v_is_member INT;

    SELECT EventStatus, EventVisibility, ClubID
    INTO v_event_status, v_event_visibility, v_club_id
    FROM Event WHERE EventID = p_EventID;

    IF v_event_status != 'Scheduled' THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Cannot RSVP: event is not scheduled.';
    END IF;

    SELECT COUNT(*) INTO v_existing
    FROM RSVP WHERE UserID = p_UserID AND EventID = p_EventID;

    IF v_existing > 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Cannot RSVP: user already RSVP''d to this event.';
    END IF;

    IF v_event_visibility = 'MembersOnly' THEN
        SELECT COUNT(*) INTO v_is_member
        FROM ClubMembership
        WHERE UserID = p_UserID AND ClubID = v_club_id AND MembershipStatus = 'Active';

        IF v_is_member = 0 THEN
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Cannot RSVP: members-only event and user is not a member.';
        END IF;
    END IF;

    INSERT INTO RSVP (RSVPID, RSVPStatus, RSVPCreationDate, UserID, EventID)
    VALUES (p_RSVPID, p_RSVPStatus, CURDATE(), p_UserID, p_EventID);
END //
DELIMITER ;
