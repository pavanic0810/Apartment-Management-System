
-- APARTMENT MANAGEMENT SYSTEM
-- DATABASE CREATION

CREATE DATABASE ApartmentDB;

USE ApartmentDB;


-- TABLE 1: APARTMENT

CREATE TABLE Apartment (
    apartment_no INT PRIMARY KEY,
    apartment_name VARCHAR(50)
);


-- TABLE 2: RESIDENTS

CREATE TABLE Residents (
    resident_id INT PRIMARY KEY,
    resident_name VARCHAR(50)
);


-- TABLE 3: APARTMENT RESIDENTS

CREATE TABLE Apartment_Residents (
    id INT PRIMARY KEY,
    apartment_no INT,
    resident_id INT,

    FOREIGN KEY (apartment_no)
    REFERENCES Apartment(apartment_no),

    FOREIGN KEY (resident_id)
    REFERENCES Residents(resident_id)
);


-- INSERT RECORDS INTO APARTMENT

INSERT INTO Apartment VALUES
(101, 'Green Residency'),
(102, 'Royal Residency'),
(103, 'Lake Residency');


-- INSERT RECORDS INTO RESIDENTS

INSERT INTO Residents VALUES
(1, 'Ravi'),
(2, 'Kumar'),
(3, 'Pavan');


-- INSERT RECORDS INTO APARTMENT_RESIDENTS

INSERT INTO Apartment_Residents VALUES
(1, 101, 1),
(2, 102, 2),
(3, 103, 3);


-- DISPLAY ALL TABLES

SELECT * FROM Apartment;

SELECT * FROM Residents;

SELECT * FROM Apartment_Residents;


-- SEARCH PARTICULAR APARTMENT NUMBER

SELECT * FROM Apartment
WHERE apartment_no = 102;


-- SEARCH APARTMENT WITH RESIDENT DETAILS

SELECT
    Apartment.apartment_no,
    Apartment.apartment_name,
    Residents.resident_name
FROM Apartment
JOIN Apartment_Residents
ON Apartment.apartment_no =
   Apartment_Residents.apartment_no
JOIN Residents
ON Apartment_Residents.resident_id =
   Residents.resident_id
WHERE Apartment.apartment_no = 102;


-- INSERT NEW APARTMENT

INSERT INTO Apartment
VALUES (104, 'Sunshine Residency');


-- INSERT NEW RESIDENT

INSERT INTO Residents
VALUES (4, 'Suresh');


-- CONNECT NEW APARTMENT AND RESIDENT

INSERT INTO Apartment_Residents
VALUES (4, 104, 4);


-- UPDATE APARTMENT NAME

UPDATE Apartment
SET apartment_name = 'Golden Residency'
WHERE apartment_no = 102;


-- UPDATE RESIDENT NAME

UPDATE Residents
SET resident_name = 'Ramesh'
WHERE resident_id = 2;


-- DELETE APARTMENT RECORD

DELETE FROM Apartment_Residents
WHERE apartment_no = 104;

DELETE FROM Apartment
WHERE apartment_no = 104;


-- DELETE RESIDENT RECORD

DELETE FROM Apartment_Residents
WHERE resident_id = 4;

DELETE FROM Residents
WHERE resident_id = 4;


-- DISPLAY FINAL ANSWER USING JOIN

SELECT
    Apartment_Residents.id,
    Apartment.apartment_no,
    Apartment.apartment_name,
    Residents.resident_name
FROM Apartment_Residents
JOIN Apartment
ON Apartment_Residents.apartment_no =
   Apartment.apartment_no
JOIN Residents
ON Apartment_Residents.resident_id =
   Residents.resident_id;
