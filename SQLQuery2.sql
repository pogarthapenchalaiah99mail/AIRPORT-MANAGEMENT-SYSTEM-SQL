-- AIRPORT MANAGEMENT SYSTEM

CREATE DATABASE AirportDB;
GO

USE AirportDB;
GO

-- 1. Passengers Table
CREATE TABLE Passengers (
    PassengerID INT PRIMARY KEY,
    PassengerName VARCHAR(50),
    Age INT,
    Gender VARCHAR(10),
    Phone VARCHAR(15)
);

-- 2. Flights Table
CREATE TABLE Flights (
    FlightID INT PRIMARY KEY,
    Airline VARCHAR(50),
    Source VARCHAR(50),
    Destination VARCHAR(50),
    Price DECIMAL(10,2)
);

-- 3. Bookings Table
CREATE TABLE Bookings (
    BookingID INT PRIMARY KEY,
    PassengerID INT,
    FlightID INT,
    BookingDate DATE,
    FOREIGN KEY (PassengerID)
        REFERENCES Passengers(PassengerID),
    FOREIGN KEY (FlightID)
        REFERENCES Flights(FlightID)
);

-- INSERT PASSENGERS
INSERT INTO Passengers VALUES
(1, 'Ravi', 25, 'Male', '9876543210'),
(2, 'Sita', 22, 'Female', '9876543211'),
(3, 'Kiran', 30, 'Male', '9876543212');

-- INSERT FLIGHTS
INSERT INTO Flights VALUES
(101, 'IndiGo', 'Hyderabad', 'Delhi', 5500),
(102, 'Air India', 'Hyderabad', 'Mumbai', 6000),
(103, 'SpiceJet', 'Delhi', 'Chennai', 4500);

-- INSERT BOOKINGS
INSERT INTO Bookings VALUES
(1001, 1, 101, '2026-11-16'),
(1002, 2, 102, '2026-11-16'),
(1003, 3, 103, '2026-11-16');

-- VIEW PASSENGERS
SELECT * FROM Passengers;

-- VIEW FLIGHTS
SELECT * FROM Flights;

-- INNER JOIN
SELECT
    P.PassengerName,
    F.Airline,
    F.Source,
    F.Destination,
    F.Price
FROM Bookings B
INNER JOIN Passengers P
ON B.PassengerID = P.PassengerID
INNER JOIN Flights F
ON B.FlightID = F.FlightID;

-- TOTAL BOOKINGS
SELECT COUNT(*) AS TotalBookings
FROM Bookings;

-- HIGHEST FLIGHT PRICE
SELECT MAX(Price) AS HighestPrice
FROM Flights;

-- CASE WHEN
SELECT
    Airline,
    Price,
    CASE
        WHEN Price >= 6000 THEN 'Expensive'
        ELSE 'Normal'
    END AS FlightCategory
FROM Flights;

-- RANK
SELECT
    Airline,
    Price,
    RANK() OVER (ORDER BY Price DESC) AS PriceRank
FROM Flights;