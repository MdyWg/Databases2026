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
VALUES ('R001', 'Pending', NOW(), 'U001', 'C001');

-- View all pending requests for a specific club
SELECT JR.RequestID, JR.UserID, U.FirstName, U.LastName, JR.RequestStatus, JR.RequestTime
FROM JoinRequest JR
JOIN User U ON JR.UserID = U.UserID
WHERE JR.ClubID = 'C001'
  AND JR.RequestStatus = 'Pending';

-- Approve a join request
UPDATE JoinRequest
SET RequestStatus = 'Approved'
WHERE RequestID = 'R001';

-- Reject a join request
UPDATE JoinRequest
SET RequestStatus = 'Rejected'
WHERE RequestID = 'R002';

-- View all join requests submitted by a specific user
SELECT *
FROM JoinRequest
WHERE UserID = 'U001';

-- Check whether a user already has a pending request for a club
SELECT *
FROM JoinRequest
WHERE UserID = 'U001'
  AND ClubID = 'C001'
  AND RequestStatus = 'Pending';


-- CLUB MEMBERSHIP MANAGEMENT

-- Add a user as a member of a club
INSERT INTO ClubMembership (UserID, ClubID, MembershipRole, MembershipStatus, MembershipJoinDate)
VALUES ('U001', 'C001', 'Member', 'Active', CURDATE());

-- View all members of a specific club
SELECT CM.UserID, U.FirstName, U.LastName, CM.MembershipRole, CM.MembershipStatus, CM.MembershipJoinDate
FROM ClubMembership CM
JOIN User U ON CM.UserID = U.UserID
WHERE CM.ClubID = 'C001';

-- View all clubs that a specific user belongs to
SELECT C.ClubID, C.ClubName, CM.MembershipRole, CM.MembershipStatus
FROM ClubMembership CM
JOIN Club C ON CM.ClubID = C.ClubID
WHERE CM.UserID = 'U001';

-- Update a member's role
UPDATE ClubMembership
SET MembershipRole = 'Officer'
WHERE UserID = 'U001' AND ClubID = 'C001';

-- Update a member's status
UPDATE ClubMembership
SET MembershipStatus = 'Inactive'
WHERE UserID = 'U001' AND ClubID = 'C001';

-- Remove a user from a club
DELETE FROM ClubMembership
WHERE UserID = 'U001' AND ClubID = 'C001';


-- STORED PROCEDURE FOR APPROVING A JOIN REQUEST

DELIMITER $$

CREATE PROCEDURE ApproveJoinRequest(IN p_RequestID CHAR(4))
BEGIN
    DECLARE v_UserID CHAR(4);
    DECLARE v_ClubID CHAR(4);

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