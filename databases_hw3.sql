-- Written for 9/19 Homework 3

--CREATE TABLE DBBootCamp.Rooms(
--room_id INTEGER IDENTITY(1,1) PRIMARY KEY NOT NULL,
--room_status VARCHAR(250),
--tavern_id INTEGER FOREIGN KEY REFERENCES DBBootCamp.Taverns(tavern_id),
--price INTEGER
--);

--CREATE TABLE DBBootCamp.RoomStays(
--sale_id INTEGER FOREIGN KEY REFERENCES DBBootCamp.Sales(sale_id),
--guest_id INTEGER FOREIGN KEY REFERENCES DBBootCamp.Ledger(guest_id),
--room_id INTEGER FOREIGN KEY REFERENCES DBBootCamp.Rooms(room_id),
--date_stayed_in DATE,
--rate INTEGER
--);

-- End of new tables

--ALTER TABLE DBBootCamp.Taverns ADD FOREIGN KEY (service) REFERENCES DBBootCamp.TavernServices(service_id);
--ALTER TABLE DBBootCamp.Users ADD FOREIGN KEY (Name) REFERENCES DBBootCamp.Ledger(guest_name);

--New alter ran in seperate Query to add Column class_name to Class



INSERT INTO DBBootCamp.TavernServices(service_name, price) VALUES ('Weapon Sharpening', 50), ('Weapon Sharpening', 100), ('Pencil Pushing', 250), ('Beds', 10), ('Darts', 1000);

--INSERT INTO DBBootCamp.Taverns(tavern_name, sales, service) VALUES ('Joe', 54, 1), ('Joe', 77, 2), ('Moe', 54, 4), ('Poe', 10, 4), ('Crow', 63, 5);

INSERT INTO DBBootCamp.Supplies(supply_name, unit, count) VALUES ('Cheese', 'Pounds', 5), ('Bread', 'Ounces', 50), ('Water', 'Ounces', 100), ('Beer', 'Ounces', 500), ('Wine', 'Ounces', 1000);

INSERT INTO DBBootCamp.Sales(service_purchased, guest_name, date_purchased, amount_purchased) VALUES (1, 'Matt', '1999-02-10', 2), (5, 'Tom', '2012-12-05', 2), (4, 'Tom', '2012-12-05', 2), (2, 'Emile', '2022-05-17', 10), (3, 'Matt', '2022-07-01', 2);

--INSERT INTO DBBootCamp.TavernStatus(current_status) VALUES ('Active'), ('Active'), ('Inactive'), ('Active'), ('Inactive');


-- Queries for HW3

--2.
SELECT * FROM DBBootCamp.Ledger WHERE Ledger.birthday < '1/1/2000';

--3.
SELECT * FROM DBBootCamp.Rooms WHERE Rooms.price > 100;

--4.
SELECT DISTINCT guest_name FROM DBBootCamp.Ledger;

--5.
SELECT * FROM DBBootCamp.Ledger ORDER BY Ledger.guest_name ASC;

--6.
SELECT TOP(10) sales FROM DBBootCamp.Taverns ORDER BY sales DESC;

--7.
SELECT * FROM DBBootCamp.GuestStatus 
UNION 
SELECT * FROM DBBootCamp.TavernStatus
UNION
SELECT * FROM DBBootCamp.Users

--8.
SELECT Ledger.guest_level, Class.class_name,  CASE 
WHEN guest_level <= 10 THEN 'Low Level'
WHEN guest_level >= 10 AND guest_level <= 20 THEN 'Mid Level'
ELSE 'High Level' END AS Level_Range FROM DBBootCamp.Ledger JOIN DBBootCamp.Class ON Ledger.class_id = Class.Id;
