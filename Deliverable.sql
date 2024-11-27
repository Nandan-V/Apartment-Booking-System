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
