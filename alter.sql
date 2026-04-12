-- INSERT OTHER SQL STATEMENTS (UPDATE, DELETE, etc.) HERE OR CREATE NEW FILE

-- EDITING CLUB INFORMATION

-- update club name and description for a club
DELIMITER //
CREATE PROCEDURE UpdateClubInfo (
    IN club_id CHAR(5),
    IN club_name VARCHAR(30),
    IN club_description TEXT
)
BEGIN
    IF club_name IS NOT NULL THEN
        UPDATE Club
        SET ClubName = club_name
        WHERE ClubID = club_id;
    END IF;
    IF club_description IS NOT NULL THEN
        UPDATE Club
        SET ClubDescription = club_description
        WHERE ClubID = club_id;
    END IF;
END //

DELIMITER ;

-- search for clubs by name 
DELIMITER //
CREATE PROCEDURE ClubSearch (
    IN keyword VARCHAR(50)
)
BEGIN
    SELECT ClubID, ClubName, ClubDescription
    FROM Club
    WHERE ClubName LIKE keyword
    ORDER BY ClubName;
END //

DELIMITER ;

-- filter clubs by category
DELIMITER //
CREATE PROCEDURE FilterClubsByCategory (
    IN category_name VARCHAR(20)
)
BEGIN
    SELECT c.ClubName, c.ClubDescription
    FROM Club c
    INNER JOIN ClubCategory cc ON c.ClubID = cc.ClubID
    INNER JOIN Category ca ON cc.CategoryID = ca.CategoryID
    WHERE ca.CategoryName = category_name
    ORDER BY c.ClubName;
END //

DELIMITER ;

-- update announcement title and body for an announcement
DELIMITER //
CREATE PROCEDURE UpdateAnnouncementInfo (
    IN announcement_id CHAR(5),
    IN announcement_title VARCHAR(30),
    IN announcement_body TEXT
)
BEGIN
    IF announcement_title IS NOT NULL THEN
        UPDATE Announcement
        SET AnnouncementTitle = announcement_title
        WHERE AnnouncementID = announcement_id;
    END IF;
    IF announcement_body IS NOT NULL THEN
        UPDATE Announcement
        SET AnnouncementBody = announcement_body
        WHERE AnnouncementID = announcement_id;
    END IF;
END //

DELIMITER ;

-- remove announcement
DELIMITER //
CREATE PROCEDURE RemoveAnnouncement (
    IN announcement_id CHAR(5)
)
BEGIN
    DELETE FROM Announcement
    WHERE AnnouncementID = announcement_id;
END //

DELIMITER ;

-- delete club
DELIMITER //

CREATE PROCEDURE DeleteClub (
    IN club_id CHAR(5)
)
BEGIN
    DELETE FROM ClubMembership
    WHERE ClubID = club_id;

    DELETE FROM ClubCategory
    WHERE ClubID = club_id;

    DELETE FROM Announcement
    WHERE ClubID = club_id;

    DELETE FROM Club
    WHERE ClubID = club_id;
END //

DELIMITER ;