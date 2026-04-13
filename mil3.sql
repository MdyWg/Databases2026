-- USER DATA

INSERT INTO User (UserID, FirstName, LastName, Email, PasswordHash, AccountCreationDate)
VALUES
('U0001', 'Yousef', 'Rawashdeh', 'yousef@nyu.edu', 'hashed_pw_1', '2026-04-01'),
('U0002', 'Mandy', 'Wang', 'mandy@nyu.edu', 'hashed_pw_2', '2026-04-01'),
('U0003', 'Maliha', 'Khan', 'maliha@nyu.edu', 'hashed_pw_3', '2026-04-02'),
('U0004', 'Adam', 'Lee', 'adam@nyu.edu', 'hashed_pw_4', '2026-04-02'),
('U0005', 'Sara', 'Ali', 'sara@nyu.edu', 'hashed_pw_5', '2026-04-03'),
('U0006', 'Omar', 'Hassan', 'omar@nyu.edu', 'hashed_pw_6', '2026-04-03'),
('U0007', 'Lina', 'Park', 'lina@nyu.edu', 'hashed_pw_7', '2026-04-04'),
('U0008', 'Noah', 'Smith', 'noah@nyu.edu', 'hashed_pw_8', '2026-04-04'),
('U0009', 'Aisha', 'Patel', 'aisha@nyu.edu', 'hashed_pw_9', '2026-04-05'),
('U0010', 'Daniel', 'Kim', 'daniel@nyu.edu', 'hashed_pw_10', '2026-04-05');

-- CLUB MEMBERSHIP DATA

INSERT INTO ClubMembership (UserID, ClubID, MembershipRole, MembershipStatus, MembershipJoinDate)
VALUES
('U0001', 'CL001', 'Owner', 'Active', '2026-04-01'),
('U0002', 'CL001', 'Officer', 'Active', '2026-04-01'),
('U0003', 'CL001', 'Member', 'Active', '2026-04-02'),
('U0004', 'CL001', 'Member', 'Active', '2026-04-02'),
('U0005', 'CL002', 'Owner', 'Active', '2026-04-01'),
('U0006', 'CL002', 'Officer', 'Active', '2026-04-02'),
('U0007', 'CL002', 'Member', 'Active', '2026-04-03'),
('U0008', 'CL003', 'Owner', 'Active', '2026-04-01'),
('U0009', 'CL003', 'Member', 'Active', '2026-04-03'),
('U0010', 'CL003', 'Member', 'Inactive', '2026-04-04');


-- JOIN REQUEST DATA

INSERT INTO JoinRequest (RequestID, RequestStatus, RequestTime, UserID, ClubID)
VALUES
('R0001', 'Pending', '2026-04-06 10:00:00', 'U0004', 'CL002'),
('R0002', 'Approved', '2026-04-06 11:00:00', 'U0003', 'CL003'),
('R0003', 'Rejected', '2026-04-06 12:00:00', 'U0007', 'CL001'),
('R0004', 'Pending', '2026-04-07 09:30:00', 'U0009', 'CL001'),
('R0005', 'Approved', '2026-04-07 10:15:00', 'U0010', 'CL002'),
('R0006', 'Pending', '2026-04-07 11:45:00', 'U0006', 'CL003'),
('R0007', 'Rejected', '2026-04-08 01:00:00', 'U0002', 'CL003'),
('R0008', 'Pending', '2026-04-08 02:20:00', 'U0005', 'CL001'),
('R0009', 'Approved', '2026-04-08 03:10:00', 'U0008', 'CL002'),
('R0010', 'Pending', '2026-04-08 04:00:00', 'U0001', 'CL003');
-- USER LOGIN

-- Retrieve a user record by email for authentication
SELECT UserID, FirstName, LastName, Email, PasswordHash
FROM User
WHERE Email = 'student1@nyu.edu';

-- Direct credential check example
SELECT UserID, FirstName, LastName
FROM User
WHERE Email = 'student1@nyu.edu'
  AND PasswordHash = 'hashed_pw_1';


-- JOIN REQUESTS

-- User submits a request to join a club
INSERT INTO JoinRequest (RequestID, RequestStatus, RequestTime, UserID, ClubID)
VALUES ('R0001', 'Pending', NOW(), 'U0001', 'CL001');

-- View all pending requests for a specific club
SELECT JR.RequestID, JR.UserID, U.FirstName, U.LastName, JR.RequestStatus, JR.RequestTime
FROM JoinRequest JR
INNER JOIN User U ON JR.UserID = U.UserID
WHERE JR.ClubID = 'CL001'
  AND JR.RequestStatus = 'Pending';

-- Approve a join request
UPDATE JoinRequest
SET RequestStatus = 'Approved'
WHERE RequestID = 'R0001';

-- Reject a join request
UPDATE JoinRequest
SET RequestStatus = 'Rejected'
WHERE RequestID = 'R0002';

-- View all join requests submitted by a specific user
SELECT *
FROM JoinRequest
WHERE UserID = 'U0001';

-- Check whether a user already has a pending request for a club
SELECT *
FROM JoinRequest
WHERE UserID = 'U0001'
  AND ClubID = 'CL001'
  AND RequestStatus = 'Pending';


-- CLUB MEMBERSHIP MANAGEMENT

-- Add a user as a member of a club
INSERT INTO ClubMembership (UserID, ClubID, MembershipRole, MembershipStatus, MembershipJoinDate)
VALUES ('U0001', 'CL001', 'Member', 'Active', CURDATE());

-- View all members of a specific club
SELECT CM.UserID, U.FirstName, U.LastName, CM.MembershipRole, CM.MembershipStatus, CM.MembershipJoinDate
FROM ClubMembership CM
INNER JOIN User U ON CM.UserID = U.UserID
WHERE CM.ClubID = 'CL001';

-- View all clubs that a specific user belongs to
SELECT C.ClubID, C.ClubName, CM.MembershipRole, CM.MembershipStatus
FROM ClubMembership CM
INNER JOIN Club C ON CM.ClubID = C.ClubID
WHERE CM.UserID = 'U0001';

-- Update a member's role
UPDATE ClubMembership
SET MembershipRole = 'Officer'
WHERE UserID = 'U0001' AND ClubID = 'CL001';

-- Update a member's status
UPDATE ClubMembership
SET MembershipStatus = 'Inactive'
WHERE UserID = 'U0001' AND ClubID = 'CL001';

-- Remove a user from a club
DELETE FROM ClubMembership
WHERE UserID = 'U0001' AND ClubID = 'CL001';


-- STORED PROCEDURE FOR APPROVING A JOIN REQUEST

DELIMITER $$

CREATE PROCEDURE ApproveJoinRequest(IN p_RequestID CHAR(5))
BEGIN
    DECLARE v_UserID CHAR(5);
    DECLARE v_ClubID CHAR(5);

    -- Get the user and club from the join request
    SELECT UserID, ClubID
    INTO v_UserID, v_ClubID
    FROM JoinRequest
    WHERE RequestID = p_RequestID;

    -- Update the join request status to Approved
    UPDATE JoinRequest
    SET RequestStatus = 'Approved'
    WHERE RequestID = p_RequestID;

    -- Add the user to the club membership table only if not already a member
    IF NOT EXISTS (
        SELECT 1
        FROM ClubMembership
        WHERE UserID = v_UserID
          AND ClubID = v_ClubID
    ) THEN
        INSERT INTO ClubMembership (UserID, ClubID, MembershipRole, MembershipStatus, MembershipJoinDate)
        VALUES (v_UserID, v_ClubID, 'Member', 'Active', CURDATE());
    END IF;
END$$

DELIMITER ;


-- TRIGGER TO PREVENT DUPLICATE PENDING JOIN REQUESTS

DELIMITER $$

CREATE TRIGGER PreventDuplicatePendingJoinRequest
BEFORE INSERT ON JoinRequest
FOR EACH ROW
BEGIN
    IF EXISTS (
        SELECT 1
        FROM JoinRequest
        WHERE UserID = NEW.UserID
          AND ClubID = NEW.ClubID
          AND RequestStatus = 'Pending'
    ) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'User already has a pending join request for this club';
    END IF;
END$$

DELIMITER ;
