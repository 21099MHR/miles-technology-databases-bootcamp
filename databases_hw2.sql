DROP TABLE IF EXISTS DBBootCamp.Taverns;
DROP TABLE IF EXISTS DBBootCamp.TavernServices;
DROP TABLE IF EXISTS DBBootCamp.Supplies;
DROP TABLE IF EXISTS DBBootCamp.TavernStatus;
DROP TABLE IF EXISTS DBBootCamp.Sales;
DROP TABLE IF EXISTS DBBootCamp.SalesSupplies;
DROP TABLE IF EXISTS DBBootCamp.GuestStatus;
DROP TABLE IF EXISTS DBBootCamp.Ledger;
DROP TABLE IF EXISTS DBBootCamp.Class;
DROP TABLE IF EXISTS DBBootCamp.Users;

CREATE TABLE DBBootCamp.TavernServices(
service_name VARCHAR(50) NOT NULL,
service_id INTEGER IDENTITY(1,1) PRIMARY KEY NOT NULL,
price INTEGER NOT NULL
);

CREATE TABLE DBBootCamp.Taverns (
owner_name VARCHAR(50) NOT NULL,
sales INTEGER NOT NULL,
tavern_id INTEGER PRIMARY KEY IDENTITY(1,1) NOT NULL,
service INTEGER NOT NULL
);

CREATE TABLE DBBootCamp.Supplies (
supply_name VARCHAR(50),
unit VARCHAR(20) NOT NULL,
count INTEGER NOT NULL,
supply_id INTEGER IDENTITY(1,1) PRIMARY KEY NOT NULL
);

CREATE TABLE DBBootCamp.Sales(
service_purchased INTEGER NOT NULL,
guest_name VARCHAR(25) NOT NULL,
date_purchased DATE NOT NULL,
amount_purchased INTEGER,
sale_id INTEGER IDENTITY(1,1) PRIMARY KEY NOT NULL
);

CREATE TABLE DBBootCamp.TavernStatus(
current_status VARCHAR(25) NOT NULL,
tavern_id INTEGER IDENTITY(1,1) FOREIGN KEY (tavern_id) REFERENCES DBBootCamp.Taverns (tavern_id)
);

CREATE TABLE DBBootCamp.GuestStatus(
	Id INTEGER IDENTITY(1,1) PRIMARY KEY NOT NULL,
	class_name VARCHAR(250) NOT NULL
);

CREATE TABLE DBBootCamp.Class(
	Id INTEGER IDENTITY(1,1) PRIMARY KEY NOT NULL,
	status_name VARCHAR(250) NOT NULL
);

CREATE TABLE DBBootCamp.Ledger(
guest_name VARCHAR(250),
class_id INTEGER FOREIGN KEY REFERENCES DBBootCamp.Class(Id),
notes VARCHAR(1000),
status_id INTEGER FOREIGN KEY REFERENCES DBBootCamp.GuestStatus(Id),
birthday DATE,
guest_level INT,
guest_id INT PRIMARY KEY IDENTITY(1,1)
);

CREATE TABLE DBBootCamp.Users (
Id INT IDENTITY PRIMARY KEY,
Name VARCHAR(250),
RoleId INT
);

CREATE TABLE DBBootCamp.SupplySales(
id INTEGER IDENTITY(1,1) PRIMARY KEY NOT NULL,
sale_id INTEGER FOREIGN KEY REFERENCES DBBootCamp.Sales(sale_id),
supply_id INTEGER FOREIGN KEY REFERENCES DBBootCamp.Supplies(supply_id)
);


ALTER TABLE DBBootCamp.Taverns ADD FOREIGN KEY (service) REFERENCES DBBootCamp.TavernServices(service_id);
ALTER TABLE DBBootCamp.Users ADD FOREIGN KEY (Name) REFERENCES DBBootCamp.Ledger(guest_name);


--INSERT INTO DBBootCamp.TavernServices(service_name, price) VALUES (5, 50);
--INSERT INTO DBBootCamp.Sales(service_purchased, guest_name, date_purchased, amount_purchased) VALUES (4, 'Tom', 'beep', 2);
--INSERT INTO DBBootCamp.Supplies(supply_name, unit, count) VALUES ('Water', '2022-05-17', 100);


INSERT INTO DBBootCamp.TavernServices(service_name, price) VALUES ('Weapon Sharpening', 50);
INSERT INTO DBBootCamp.TavernServices(service_name, price) VALUES ('Weapon Sharpening', 100);
INSERT INTO DBBootCamp.TavernServices(service_name, price) VALUES ('Pencil Pushing', 250);
INSERT INTO DBBootCamp.TavernServices(service_name, price) VALUES ('Beds', 10);
INSERT INTO DBBootCamp.TavernServices(service_name, price) VALUES ('Darts', 1000);

INSERT INTO DBBootCamp.Taverns(owner_name, sales, service) VALUES ('Joe', 54, 1);
INSERT INTO DBBootCamp.Taverns(owner_name, sales, service) VALUES ('Joe', 77, 2);
INSERT INTO DBBootCamp.Taverns(owner_name, sales, service) VALUES ('Moe', 54, 4);
INSERT INTO DBBootCamp.Taverns(owner_name, sales, service) VALUES ('Poe', 10, 4);
INSERT INTO DBBootCamp.Taverns(owner_name, sales, service) VALUES ('Crow', 63, 5);

INSERT INTO DBBootCamp.Supplies(supply_name, unit, count) VALUES ('Cheese', 'Pounds', 5);
INSERT INTO DBBootCamp.Supplies(supply_name, unit, count) VALUES ('Bread', 'Ounces', 50);
INSERT INTO DBBootCamp.Supplies(supply_name, unit, count) VALUES ('Water', 'Ounces', 100);
INSERT INTO DBBootCamp.Supplies(supply_name, unit, count) VALUES ('Beer', 'Ounces', 500);
INSERT INTO DBBootCamp.Supplies(supply_name, unit, count) VALUES ('Wine', 'Ounces', 1000);

INSERT INTO DBBootCamp.Sales(service_purchased, guest_name, date_purchased, amount_purchased) VALUES (1, 'Matt', '1999-02-10', 2);
INSERT INTO DBBootCamp.Sales(service_purchased, guest_name, date_purchased, amount_purchased) VALUES (5, 'Tom', '2012-12-05', 2);
INSERT INTO DBBootCamp.Sales(service_purchased, guest_name, date_purchased, amount_purchased) VALUES (4, 'Tom', '2012-12-05', 2);
INSERT INTO DBBootCamp.Sales(service_purchased, guest_name, date_purchased, amount_purchased) VALUES (2, 'Emile', '2022-05-17', 10);
INSERT INTO DBBootCamp.Sales(service_purchased, guest_name, date_purchased, amount_purchased) VALUES (3, 'Matt', '2022-07-01', 2);

INSERT INTO DBBootCamp.TavernStatus(current_status) VALUES ('Active');
INSERT INTO DBBootCamp.TavernStatus(current_status) VALUES ('Active');
INSERT INTO DBBootCamp.TavernStatus(current_status) VALUES ('Inactive');
INSERT INTO DBBootCamp.TavernStatus(current_status) VALUES ('Active');
INSERT INTO DBBootCamp.TavernStatus(current_status) VALUES ('Inactive');

