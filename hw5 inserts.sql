--INSERT INTO Taverns.Classes(Name) VALUES ('Mage'), ('Warrior'), ('Priest')
--INSERT INTO Taverns.Users(Name, RoleId) VALUES ('Matt', 2), ('Tom', 2), ('Phiring', 1), ('Richard', 2);
--INSERT INTO Taverns.Guests(Name, Birthdate, Notes, StatusId) VALUES ('Matt', '02/10/1999', 'N/A', 1), ('Richard', '08/30/1999', 'N/A', 1), ('Phiring', '8/27/1999', 'N/A', 1)

--INSERT INTO Taverns.Levels(ClassId, GuestId, level) VALUES (2, 1, 5), (2, 2, 5), (1, 3, 10), (2, 4, 4)

--INSERT INTO Taverns.RoomStatuses(name) VALUES ('Occupied'), ('Unoccupied')
--INSERT INTO TAVERNS.Rooms(Name, TavernId, StatusId, price) VALUES ('101', 1, 2, 500.0), ('102', 1, 1, 400.0), ('201', 2, 1, 300.0), ('202', 2, 2, 200.0)
--INSERT INTO Taverns.Stays(Rate, SaleId, GuestId, RoomId, Date) VALUES (45.0, 2, 3, 4, '02/10/1999')
--INSERT INTO Taverns.Taverns(Name, OwnerId, LocationId) VALUES ('The Tav', 1, 1), ('The Other Tav', 2, 2), ('The Tav The Third', 3, 3)

INSERT INTO Taverns.Roles(Name, Description) VALUES ('Admin', 'Administrator account.'), ('General User', 'General user account.')

SELECT Taverns.LevelGrouping(9) AS Level_Grouping;

SELECT * FROM Taverns.GetOpenRooms('02/10/1999')

SELECT * FROM Taverns.GetPriceRange(0, 1000)

SELECT * FROM Taverns.Rooms

EXEC Taverns.Undercut;

SELECT * FROM Taverns.Rooms;