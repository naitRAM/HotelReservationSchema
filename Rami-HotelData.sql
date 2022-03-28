USE HotelReservation;

INSERT INTO Guest (FirstName, LastName, Address, City, State, Zipcode, Phone) VALUES 
	('Rami', 'Mansieh', '400 Broad Street', 'Seattle', 'WA', '98109', '6487869768'),
    ('Mack', 'Simmer', '379 Old Shore Street', 'Council Bluffs', 'IA', '51501', '2915530508'),
    ('Bettyann', 'Seery', '750 Wintergreen Dr.', 'Wasilla', 'AK', '99654', '4782779632'),
    ('Duane', 'Cullison', '9662 Foxrun Lane', 'Harlingen', 'TX', '78552', '3084940198'),
    ('Karie', 'Yang', '9378 W. Augusta Ave.', 'West Deptford', 'NJ', '08096', '2147300298'), 
    ('Aurore', 'Lipton', '762 Wild Rose Street', 'Saginaw', 'MI', '48601', '3775070974'),
    ('Zachary', 'Luechtefeld', '7 Poplar Dr.', 'Arvada', 'CO', '80003', '8144852615'),
    ('Jeremiah', 'Pendergrass', '70 Oakwood St.', 'Zion', 'IL', '60099', '2794910960'),
    ('Walter', 'Halaway', '7556 Arrowhead St.', 'Cumberland', 'RI', '02864', '4463966785'),
    ('Wilfred', 'Vise', '77 West Surrey Street', 'Oswego', 'NY', '13126', '8347271001'),
    ('Maritza', 'Tilton', '939 Linda Rd.', 'Burke', 'VA', '22015', '4463516860'), 
    ('Joleen', 'Tison', '87 Queen St.', 'Drexel Hill', 'PA', '19026', '2318932755');
    
    
INSERT INTO Reservation (AdultNum, ChildNum, StartDate, EndDate, GuestId) VALUES
	(1, 0, '2023-02-02', '2023-02-04',  2), 
    (2, 1, '2023-02-05', '2023-02-10', 3), 
    (2, 0, '2023-02-22', '2023-02-24', 4), 
    (2, 2, '2023-03-06', '2023-03-07', 5), 
    (1, 1, '2023-03-17', '2023-03-20', 1),
    (3, 0, '2023-03-18', '2023-03-23', 6),
    (2, 2, '2023-03-29', '2023-03-31', 7),
    (2, 0, '2023-03-31', '2023-04-05', 8),
    (1, 0, '2023-04-09', '2023-04-13', 9),
    (1, 1, '2023-04-23', '2023-04-24', 10),
    (2, 4, '2023-05-30', '2023-06-02', 11), 
    (2, 0, '2023-06-10', '2023-06-14', 12),
    (1, 0, '2023-06-10', '2023-06-14', 12), 
    (3, 0, '2023-06-17', '2023-06-18', 6), 
    (2, 0, '2023-06-28', '2023-07-02', 1), 
    (3, 1, '2023-07-13', '2023-07-14', 9),
    (4, 2, '2023-07-18', '2023-07-21', 10),
    (2, 1, '2023-07-28', '2023-07-29', 3),
    (1, 0, '2023-08-30', '2023-09-01', 3),
    (2, 0, '2023-09-16', '2023-09-17', 2),
    (2, 2, '2023-09-13', '2023-09-15', 5), 
    (2, 2, '2023-11-22', '2023-11-25', 4),
    (2, 0, '2023-11-22', '2023-11-25', 2),
    (2, 2, '2023-11-22', '2023-11-25', 2),
    (2, 0, '2023-12-24', '2023-12-28', 11);
    
INSERT INTO RoomType (RoomType, StdOccupancy, MaxOccupancy, BasePrice) VALUES
	('Single', 2, 2, 149.99);
    
INSERT INTO RoomType (RoomType, StdOccupancy, MaxOccupancy, BasePrice, PersonCost) VALUES
    ('Double', 2, 4, 174.99, 10),
    ('Suite', 3, 8, 399.99, 20);

INSERT INTO Room (RoomTypeId, RoomNum, ADA) VALUES
	(2, 201, 0),
    (2, 202, 1),
    (2, 203, 0),
    (2, 204, 1),
    (1, 205, 0),
    (1, 206, 1),
    (1, 207, 0),
    (1, 208, 1),
    (2, 301, 0), 
    (2, 302, 1),
    (2, 303, 0), 
    (2, 304, 1), 
    (1, 305, 0),
    (1, 306, 1), 
    (1, 307, 0),
    (1, 308, 1),
    (3, 401, 1),
    (3, 402, 1);
    
INSERT INTO ReservationRoom (ReservationId, RoomId) VALUES 
	(1, 16),
    (2, 3),
    (3, 13),
    (4, 1),
    (5, 15),
    (6, 10),
    (7, 2),
    (8, 12),
    (9, 9),
    (10, 7),
    (11, 17),
    (12, 6),
    (13, 8),
    (14, 12),
    (15, 5),
    (16, 4),
    (17, 17),
    (18, 11),
    (19, 13),
    (20, 8),
    (21, 3),
    (22, 17),
    (23, 6),
    (24, 9),
    (25, 10);
    
INSERT INTO Amenity (AmenityName, AmenityCost) VALUES
    ('Jacuzzi', 25.00);
    
INSERT INTO Amenity (AmenityName) VALUES
	('Microwave'), 
    ('Oven'),
    ('Refrigerator');
    
INSERT INTO RoomAmenity(RoomId, AmenityId) VALUES
	(1, 1),
    (1, 2),
    (2, 4),
    (3, 1),
    (3, 2),
    (4, 4),
    (5, 1),
    (5, 2),
    (5, 4),
    (6, 2), 
    (6, 4),
    (7, 1),
    (7, 2),
    (7, 4),
    (8, 2),
    (8, 4),
    (9, 1),
    (9, 2),
    (10, 4),
    (11, 1), 
    (11, 2),
    (12, 4),
    (13, 1),
    (13, 2),
    (13, 4),
    (14, 2),
    (14, 4),
    (15, 1),
    (15, 2),
    (15, 4),
    (16, 2),
    (16, 4),
    (17, 2),
    (17, 3),
    (17, 4),
    (18, 2),
    (18, 3),
    (18, 4);
    
DELETE FROM ReservationRoom 
WHERE
    ReservationRoom.ReservationId = (SELECT 
        ReservationId
    FROM
        Reservation
    
    WHERE
        Reservation.GuestId = (SELECT 
            GuestId
        FROM
            Guest
        
        WHERE
            Guest.FirstName LIKE 'Jeremiah'
            AND Guest.LastName LIKE 'Pendergrass'));

DELETE FROM Reservation 
WHERE
    Reservation.GuestId = (SELECT 
        GuestId
    FROM
        Guest
    
    WHERE
        Guest.FirstName LIKE 'Jeremiah'
        AND Guest.LastName LIKE 'Pendergrass');
     
SET SQL_SAFE_UPDATES = 0;

DELETE FROM Guest 
WHERE
    Guest.FirstName LIKE 'Jeremiah'
    AND Guest.LastName LIKE 'Pendergrass';

SET SQL_SAFE_UPDATES = 1;
    