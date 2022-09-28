--1.

SELECT u.*, r.Name, r.Description FROM Taverns.Users u JOIN Taverns.Roles r ON u.RoleId = r.Id;

--2.

SELECT c.Name, COUNT(u.RoleId) AS class_count FROM Taverns.Classes c JOIN Taverns.Users u ON c.Id = u.RoleId GROUP BY c.Name;

--3.

SELECT g.Name, c.name Class_Name, l.level Level, 

CASE 

WHEN l.level < 5 THEN 'Beginner'
WHEN l.level >= 5 AND l.level < 10 THEN 'Intermediate'
WHEN l.level >= 10 THEN 'Expert'
END AS Level_Group

FROM Taverns.Guests g JOIN Taverns.Levels l ON g.Id = l.GuestId JOIN Taverns.Classes c ON l.ClassId = c.Id ORDER BY g.Name ASC;

--4.


--CREATE FUNCTION Taverns.LevelGrouping(@level int)

--RETURNS VARCHAR(50)

--BEGIN
--DECLARE @ret AS VARCHAR(50)

--SET @ret = (SELECT CASE WHEN @level < 5 THEN 'Beginner'
--WHEN @level >= 5 AND @level < 10 THEN 'Intermediate'
--WHEN @level >= 10 THEN 'Expert' END);

--RETURN @ret

--END

--5.

--CREATE FUNCTION Taverns.GetOpenRooms(@date date)

--RETURNS TABLE

--AS
--RETURN
--(
--SELECT t.Name Tavern, r.Name, rs.name Status, s.Date FROM Taverns.Rooms r 
--JOIN Taverns.RoomStatuses rs ON r.StatusId = rs.Id 
--JOIN Taverns.Stays s ON r.Id = s.RoomId
--JOIN Taverns.Taverns t ON r.TavernId = t.Id

--WHERE r.StatusId = 2 AND s.Date = @date
--);


--6.

ALTER FUNCTION Taverns.GetPriceRange(@min decimal(18,2), @max decimal(18,2))

RETURNS TABLE

AS
RETURN
(
SELECT t.Name Tavern, t.Id Tavern_Id, r.Name, rs.name Status, s.Rate, s.Date FROM Taverns.Rooms r 
JOIN Taverns.RoomStatuses rs ON r.StatusId = rs.Id 
JOIN Taverns.Stays s ON r.Id = s.RoomId
JOIN Taverns.Taverns t ON r.TavernId = t.Id

WHERE s.Rate > @min AND s.Rate < @max
);


--7.

ALTER PROCEDURE Taverns.Undercut

AS 

SET NOCOUNT ON
DECLARE @min_tav_id AS INT
DECLARE @min_tav_price AS INT

SELECT @min_tav_id = p.Tavern_Id, @min_tav_price = p.Rate FROM Taverns.GetPriceRange(0, 5000) p;

DECLARE @new_min_id AS INT
DECLARE @new_min_price AS decimal(18,2)

SET @new_min_price = @min_tav_price - .01

SELECT @new_min_price

SELECT t.Id FROM Taverns.Taverns t WHERE t.Id != @min_tav_id ORDER BY NEWID()

INSERT INTO Taverns.Rooms(Name, StatusId, TavernId, price) VALUES ('New Room', 2, @new_min_id, @new_min_price)

GO