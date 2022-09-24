--New table created for Role lookup.

--CREATE TABLE DBBootCamp.Roles(
--role_id INTEGER IDENTITY(1,1) PRIMARY KEY,
--role_name VARCHAR(50)
--);

DELETE FROM DBBootCamp.Roles;
DELETE FROM DBBootCamp.Users;
DELETE FROM DBBootCamp.Ledger;
DELETE FROM DBBootCamp.Class;

--INSERT INTO DBBootCamp.Roles(role_name) VALUES ('admin'), ('adventurer');
INSERT INTO DBBootCamp.Users(Name, RoleId) VALUES ('Matt', 1);
--INSERT INTO DBBootCamp.Ledger(guest_name, notes, birthday, guest_level) VALUES ('Matt', 'His name is Matt.', '1999/02/10', 5);
--INSERT INTO DBBootCamp.Class(class_name, guest_id, class_level) VALUES ('Fighter', 1, 2), ('Mage', 1, 5), ('Necromancer', 1, 3);

--1.
SELECT u.Id, u.Name, r.role_name FROM DBBootCamp.Users u JOIN DBBootCamp.Roles r ON u.RoleId = r.role_id;

--2.
SELECT * FROM DBBootCamp.Users u JOIN DBBootCamp.Taverns t ON u.Id = t.owner_id WHERE u.Id=1;

--3.
SELECT l.guest_name, c.class_name, c.class_level FROM DBBootCamp.Ledger l JOIN DBBootCamp.Class c  ON l.guest_id = c.guest_id ORDER BY l.guest_name ASC;

--4. 

SELECT TOP(10) t.sales, ts.service_name FROM DBBootCamp.Taverns t JOIN DBBootCamp.TavernServices ts ON t.service = ts.service_id;

--5.

SELECT l.guest_name, count(c.guest_id) AS class_count FROM DBBootCamp.Ledger l JOIN DBBootCamp.Class c ON l.guest_id = c.guest_id GROUP BY l.guest_name;

--6.

SELECT l.guest_name, count(c.guest_id) AS class_count FROM DBBootCamp.Ledger l JOIN DBBootCamp.Class c ON l.guest_id = c.guest_id WHERE c.class_level > 5 GROUP BY l.guest_name;

--7.

SELECT l.guest_name, MAX(c.class_level) AS highest_level FROM DBBootCamp.Ledger l JOIN DBBootCamp.Class c ON l.guest_id = c.guest_id GROUP BY l.guest_name;

--8.

SELECT * FROM DBBootCamp.Ledger l JOIN DBBootCamp.RoomStays r ON l.guest_id = r.guest_id WHERE r.date_stayed_in BETWEEN '01/31/2022' AND '03/01/2022'; 