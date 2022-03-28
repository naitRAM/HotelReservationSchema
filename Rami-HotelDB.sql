DROP DATABASE IF EXISTS HotelReservation;
CREATE DATABASE HotelReservation;
USE HotelReservation;

CREATE TABLE Guest (
    GuestId INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Address VARCHAR(25) NOT NULL,
    City VARCHAR(25) NOT NULL,
    State CHAR(2) NOT NULL,
    Zipcode CHAR(5) NOT NULL,
    Phone CHAR(10) NOT NULL
);

CREATE TABLE Reservation (
    ReservationId INT PRIMARY KEY AUTO_INCREMENT,
    StartDate DATE NOT NULL,
    EndDate DATE NOT NULL,
    AdultNum TINYINT,
    ChildNum TINYINT,
    GuestId INT NOT NULL,
    CONSTRAINT FOREIGN KEY (GuestId)
        REFERENCES Guest (GuestId)
);

CREATE TABLE RoomType (
    RoomTypeId TINYINT PRIMARY KEY AUTO_INCREMENT,
    RoomType CHAR(10) NOT NULL,
    StdOccupancy TINYINT NOT NULL,
    MaxOccupancy TINYINT NOT NULL,
    BasePrice DECIMAL(6 , 2 ) NOT NULL,
    PersonCost DECIMAL(5 , 2 )
);

CREATE TABLE Room (
    RoomId SMALLINT PRIMARY KEY AUTO_INCREMENT,
    RoomNum SMALLINT,
    ADA BOOL NOT NULL,
    RoomTypeId TINYINT NOT NULL,
    CONSTRAINT FOREIGN KEY (RoomTypeId)
        REFERENCES RoomType (RoomTypeId)
);

CREATE TABLE ReservationRoom (
    ReservationId INT NOT NULL,
    RoomId SMALLINT NOT NULL,
    PRIMARY KEY pk_Reservation_Room (ReservationId , RoomId),
    CONSTRAINT FOREIGN KEY (ReservationId)
        REFERENCES Reservation (ReservationId),
    CONSTRAINT FOREIGN KEY (RoomId)
        REFERENCES Room (RoomId)
);

CREATE TABLE Amenity (
    AmenityId TINYINT PRIMARY KEY AUTO_INCREMENT,
    AmenityName CHAR(20) NOT NULL,
    AmenityCost DECIMAL(5 , 2 )
);

CREATE TABLE RoomAmenity (
    RoomId SMALLINT NOT NULL,
    AmenityId TINYINT NOT NULL,
    PRIMARY KEY pk_Room_Amenity (RoomId , AmenityId),
    CONSTRAINT FOREIGN KEY (RoomId)
        REFERENCES Room (RoomId),
    CONSTRAINT FOREIGN KEY (AmenityId)
        REFERENCES Amenity (AmenityId)
);

