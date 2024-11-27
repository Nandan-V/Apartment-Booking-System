-- Drop tables in reverse dependency order
DROP TABLE IF EXISTS Booking;
DROP TABLE IF EXISTS Apartment;
DROP TABLE IF EXISTS Guest;
DROP TABLE IF EXISTS Buildings;

-- Create Buildings table
CREATE TABLE Buildings (
    BuildingID INT PRIMARY KEY,
    Name VARCHAR(40) NOT NULL,
    Address VARCHAR(40) NOT NULL,
    ManagerName VARCHAR(40) NOT NULL
);

-- Create Guest table
CREATE TABLE Guest (
    GuestID INT PRIMARY KEY,
    FirstName VARCHAR(40) NOT NULL,
    LastName VARCHAR(40) NOT NULL,
    Phone VARCHAR(15) UNIQUE NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL
);

-- Create Apartment table
CREATE TABLE Apartment (
    ApartmentID INT PRIMARY KEY,
    BuildingID INT NOT NULL,
    Type VARCHAR(40) NOT NULL,
    ApartmentNumber INT NOT NULL,
    Rent DECIMAL(10, 2) NOT NULL,
    Availability BOOLEAN NOT NULL,
    FOREIGN KEY (BuildingID) REFERENCES Buildings(BuildingID)
);

-- Create Booking table
CREATE TABLE Booking (
    BookingID INT PRIMARY KEY,
    GuestID INT NOT NULL,
    ApartmentID INT NOT NULL,
    CheckInDate DATE NOT NULL,
    CheckOutDate DATE NOT NULL,
    Status VARCHAR(40) NOT NULL,
    FOREIGN KEY (GuestID) REFERENCES Guest(GuestID),
    FOREIGN KEY (ApartmentID) REFERENCES Apartment(ApartmentID)
);

INSERT INTO Buildings (BuildingID, Name, Address, ManagerName)
VALUES
    (111, 'London House', '4th Ave Sw', 'Alice Johnson'),
    (112, 'Maple Residences', '456 Maple Dr, Calgary', 'Bob Smith'),
    (113, 'Urban Heights', '789 Urban Ln, Calgary', 'Catherine Lee'),
    (114, 'Downtown Suites', '101 City Center Blvd, Calgary', 'David Wilson'),
    (115, 'Riverside Towers', '202 River Rd, Calgary', 'Emily Brown'),
    (116, 'Pine Valley Condos', '300 Pine St, Calgary', 'Nathan Adams'),
    (117, 'Aspen Grove Apartments', '400 Aspen Rd, Calgary', 'Sophia Carter'),
    (118, 'Lakeview Residences', '500 Lakeview Dr, Calgary', 'James Taylor'),
    (119, 'Greenwood Suites', '600 Forest Ave, Calgary', 'Isabella Moore'),
    (110, 'Skyline Towers', '700 Skyline Blvd, Calgary', 'Liam Thompson');



INSERT INTO Apartment (ApartmentID, BuildingID, Type, ApartmentNumber, Rent, Availability)
VALUES
    (1, 111, 'Studio', 101, 1200.00, TRUE),
    (2, 111, '1-Bedroom', 102, 1500.00, FALSE),
    (3, 112, '2-Bedroom', 201, 1800.00, TRUE),
    (4, 112, 'Studio', 202, 1250.00, TRUE),
    (5, 113, '1-Bedroom', 301, 1400.00, FALSE),
    (6, 113, '2-Bedroom', 302, 2000.00, TRUE),
    (7, 114, 'Studio', 401, 1100.00, TRUE),
    (8, 114, '1-Bedroom', 402, 1600.00, FALSE),
    (9, 115, '2-Bedroom', 501, 2200.00, TRUE),
    (10, 115, 'Studio', 502, 1150.00, TRUE),
    (11, 111, '1-Bedroom', 103, 1500.00, TRUE),
    (12, 112, 'Studio', 203, 1300.00, FALSE),
    (13, 113, '1-Bedroom', 303, 1450.00, TRUE),
    (14, 114, '2-Bedroom', 403, 2100.00, TRUE),
    (15, 115, 'Studio', 503, 1200.00, TRUE);
 
 INSERT INTO Guest (GuestID, FirstName, LastName, Phone, Email)
VALUES
    (1, 'John', 'Doe', '+14035551234', 'john.doe@example.com'),
    (2, 'Jane', 'Smith', '+14035552345', 'jane.smith@example.com'),
    (3, 'Michael', 'Brown', '+14035553456', 'michael.brown@example.com'),
    (4, 'Sarah', 'Wilson', '+14035554567', 'sarah.wilson@example.com'),
    (5, 'Robert', 'Johnson', '+14035555678', 'robert.johnson@example.com'),
    (6, 'Emily', 'Clark', '+14035556789', 'emily.clark@example.com'),
    (7, 'William', 'Garcia', '+14035557890', 'william.garcia@example.com'),
    (8, 'Elizabeth', 'Martinez', '+14035558901', 'elizabeth.martinez@example.com'),
    (9, 'James', 'Lopez', '+14035559012', 'james.lopez@example.com'),
    (10, 'Olivia', 'Hernandez', '+14035550123', 'olivia.hernandez@example.com');

INSERT INTO Booking (BookingID, GuestID, ApartmentID, CheckInDate, CheckOutDate, Status)
VALUES
    (1, 1, 2, '2024-01-01', '2024-01-07', 'Confirmed'),
    (2, 2, 5, '2024-01-10', '2024-01-15', 'Pending'),
    (3, 3, 3, '2024-02-01', '2024-02-10', 'Cancelled'),
    (4, 4, 6, '2024-02-15', '2024-02-20', 'Confirmed'),
    (5, 5, 9, '2024-03-01', '2024-03-05', 'Pending'),
    (6, 6, 7, '2024-03-10', '2024-03-15', 'Confirmed'),
    (7, 7, 12, '2024-04-01', '2024-04-07', 'Cancelled'),
    (8, 8, 8, '2024-04-10', '2024-04-15', 'Confirmed'),
    (9, 9, 15, '2024-05-01', '2024-05-07', 'Pending'),
    (10, 10, 14, '2024-05-10', '2024-05-15', 'Confirmed'),
    (11, 1, 10, '2024-06-01', '2024-06-07', 'Cancelled'),
    (12, 2, 1, '2024-06-10', '2024-06-15', 'Confirmed'),
    (13, 3, 4, '2024-07-01', '2024-07-07', 'Pending'),
    (14, 4, 11, '2024-07-10', '2024-07-15', 'Confirmed'),
    (15, 5, 13, '2024-08-01', '2024-08-07', 'Pending'),
    (16, 6, 10, '2024-08-10', '2024-08-15', 'Cancelled'),
    (17, 7, 7, '2024-09-01', '2024-09-07', 'Confirmed'),
    (18, 8, 6, '2024-09-10', '2024-09-15', 'Pending'),
    (19, 9, 2, '2024-10-01', '2024-10-07', 'Confirmed'),
    (20, 10, 14, '2024-10-10', '2024-10-15', 'Cancelled');


