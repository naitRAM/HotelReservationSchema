-- 1. Return a list of reservations that end in July 2023, including the name of the guest, the room number(s), and the reservation dates
SELECT 
    CONCAT(g.FirstName, ' ', g.LastName) AS Guest,
    ro.RoomNum AS RoomNumber,
    re.StartDate AS CheckInDate,
    re.EndDate AS CheckOutDate
FROM
    Reservation AS re
        INNER JOIN
    Guest AS g ON re.GuestId = g.GuestId
        INNER JOIN
    ReservationRoom AS rr ON re.ReservationId = rr.ReservationId
        INNER JOIN
    Room AS ro ON rr.RoomId = ro.RoomId
WHERE
    re.EndDate BETWEEN '2023-07-01' AND '2023-07-31';
    
-- 2. Return a list of all reservations for rooms with a jacuzzi, displaying the guest's name, the room number, and the dates of the reservation
SELECT 
    CONCAT(g.FirstName, ' ', g.LastName) AS Guest,
    ro.RoomNum AS RoomNumber,
    re.StartDate AS CheckInDate,
    re.EndDate AS CheckOutDate
FROM
    Reservation AS re
        INNER JOIN
    Guest AS g ON re.GuestId = g.GuestId
        INNER JOIN
    ReservationRoom AS rr ON re.ReservationId = rr.ReservationId
        INNER JOIN
    Room AS ro ON rr.RoomId = ro.RoomId
        INNER JOIN
    RoomAmenity AS ra ON ro.RoomId = ra.RoomId
        INNER JOIN
    Amenity AS a ON ra.AmenityId = a.AmenityId
WHERE
    a.AmenityName = 'Jacuzzi';

-- 3. Return all the rooms reserved for a specific guest, including the guest's name, the room(s) reserved, the starting date of the reservation, and how many people were included in the reservation (Choose a guest's name from the existing data)
SELECT 
    CONCAT(g.FirstName, ' ', g.LastName) AS Guest,
    ro.RoomNum AS RoomNum,
    re.StartDate AS CheckInDate,
    (re.AdultNum + re.ChildNum) AS GuestCount
FROM
    Reservation AS re
        INNER JOIN
    Guest AS g ON re.GuestId = g.GuestId
        INNER JOIN
    ReservationRoom AS rr ON rr.ReservationId = re.ReservationId
        INNER JOIN
    Room AS ro ON rr.RoomId = ro.RoomId
WHERE
    g.FirstName LIKE 'Bettyann'
        AND g.LastName LIKE 'Seery';

-- 4. Return a list of rooms, reservation ID, and per-room cost for each reservation. The results should include all rooms, whether or not there is a reservation associated with the room
SELECT 
    ro.RoomNum AS RoomNumber,
    re.ReservationId AS ReservationId,
    ((SUM(IFNULL(a.AmenityCost, 0)) + rt.BasePrice + IF(re.AdultNum > rt.StdOccupancy,
        (re.AdultNum - rt.StdOccupancy) * rt.PersonCost,
        0)) * DATEDIFF(re.EndDate, re.StartDate)) AS TotalCost
FROM
    Room AS ro
        LEFT JOIN
    RoomType AS rt ON ro.RoomTypeId = rt.RoomTypeId
        LEFT JOIN
    RoomAmenity AS ra ON ro.RoomId = ra.RoomId
        LEFT JOIN
    Amenity AS a ON ra.AmenityId = a.AmenityId
        LEFT JOIN
    ReservationRoom AS rr ON ro.RoomId = rr.RoomId
        LEFT JOIN
    Reservation AS re ON rr.ReservationId = re.ReservationId
GROUP BY re.ReservationId
ORDER BY ISNULL(re.ReservationId) , re.ReservationId;

-- 5. Return all the rooms accommodating at least three guests and that are reserved on any date in April 2023
SELECT 
    ro.RoomNum AS RoomNumber,
    (re.AdultNum + re.ChildNum) AS TotalGuests,
    re.StartDate AS CheckInDate,
    re.EndDate AS CheckOutDate
FROM
    Reservation AS re
        INNER JOIN
    ReservationRoom AS rr ON re.ReservationId = rr.ReservationId
        INNER JOIN
    Room AS ro ON rr.RoomId = ro.RoomId
WHERE
    (re.AdultNum + re.ChildNum) >= 3
        AND ((re.StartDate BETWEEN '2023-04-01' AND '2023-04-30')
        OR (re.EndDate BETWEEN '2023-04-01' AND '2023-04-30'));

-- 6. Return a list of all guest names and the number of reservations per guest, sorted starting with the guest with the most reservations and then by the guest's last name
SELECT 
    CONCAT(g.FirstName, ' ', g.LastName) AS Guest,
    COUNT(re.ReservationId) AS NumReservations
FROM
    Guest AS g
        INNER JOIN
    Reservation re ON g.GuestId = re.GuestId
GROUP BY re.GuestId
ORDER BY NumReservations DESC , g.LastName;

-- Display the name, address, and phone number of a guest based on their phone number (Choose a phone number from the existing data)
SELECT 
    CONCAT(FirstName, ' ', LastName) AS GuestName,
    Address,
    CONCAT('(',
            SUBSTRING(Phone, 1, 3),
            ')',
            SUBSTRING(Phone, 4, 3),
            '-',
            SUBSTRING(Phone, 7, 4)) AS `Phone#`
FROM
    Guest
WHERE
    Phone LIKE '3084940198';
	
    
 
