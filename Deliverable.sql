CREATE TABLE Buildings(
  BuildingID INT PRIMARY KEY,
  Name VARCHAR (40),
  Address VARCHAR(40),
  ManagerName VARCHAR(40)
);

CREATE TABLE Apartment(
ApartmentId INT PRIMARY KEY,
BuildingID INT,
Type VARCHAR (40),
ApartmentNumber INT,
Rent DECIMAL(10, 2),
Availability Boolean,
  
FOREIGN KEY (BuildingID) REFRENCES Buildings(BuildingID)
);

CREATE TABLE Booking(
BookingID INT PRIMARY KEY,
GuestID INT,
ApartmentID INT,
CheckInDate DATE,
CheckOutDate DATE,
Status VARCHAR(40),

FOREIGN KEY (GuestID) REFERENCES Guest(GuestID),
FOREIGN KEY (ApartmentID) REFERENCES Apartment(ApartmentID)
);

CREATE TABLE Guest(
GuestID INT PRIMARY KEY,
FirstName VARCHAR (40),
LastName VARCHAR (40),
Phone VARCHAR(15),
Email VARCHAR(100) 
);
