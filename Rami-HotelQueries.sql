
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
    
-- Result:
/*
Guest,RoomNumber,CheckInDate,CheckOutDate
"Rami Mansieh",205,2023-06-28,2023-07-02
"Walter Halaway",204,2023-07-13,2023-07-14
"Wilfred Vise",401,2023-07-18,2023-07-21
"Bettyann Seery",303,2023-07-28,2023-07-29
*/
    
    
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
    
-- Result:
/*
Guest,RoomNumber,CheckInDate,CheckOutDate
"Karie Yang",201,2023-03-06,2023-03-07
"Bettyann Seery",203,2023-02-05,2023-02-10
"Karie Yang",203,2023-09-13,2023-09-15
"Rami Mansieh",205,2023-06-28,2023-07-02
"Wilfred Vise",207,2023-04-23,2023-04-24
"Walter Halaway",301,2023-04-09,2023-04-13
"Mack Simmer",301,2023-11-22,2023-11-25
"Bettyann Seery",303,2023-07-28,2023-07-29
"Duane Cullison",305,2023-02-22,2023-02-24
"Bettyann Seery",305,2023-08-30,2023-09-01
"Rami Mansieh",307,2023-03-17,2023-03-20
*/
    

SELECT 
    CONCAT(g.FirstName, ' ', g.LastName) AS Guest,
    ro.RoomNum AS RoomNum,
    re.StartDate AS CheckInDate,
    (rr.AdultNum + rr.ChildNum) AS GuestCount
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
        
-- Result:
/*
Guest,RoomNum,CheckInDate,GuestCount
"Bettyann Seery",203,2023-02-05,3
"Bettyann Seery",303,2023-07-28,3
"Bettyann Seery",305,2023-08-30,1
*/


SELECT 
    ro.RoomNum AS RoomNumber,
    re.ReservationId AS ReservationId,
    ((SUM(IFNULL(a.AmenityCost, 0)) + rt.BasePrice + IF(rr.AdultNum > rt.StdOccupancy,
        (rr.AdultNum - rt.StdOccupancy) * rt.PersonCost,
        0) + IF((rr.ChildNum > rt.StdOccupancy)
            AND rr.AdultNum = 0,
        (rr.ChildNum - rt.StdOccupancy) * rt.PersonCost,
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
GROUP BY rr.ReservationId , rr.RoomId
ORDER BY ISNULL(re.ReservationId) , re.ReservationId;

-- Result:
/*
RoomNumber,ReservationId,TotalCost
308,1,299.98
203,2,999.95
305,3,349.98
201,4,199.99
307,5,524.97
302,6,924.95
202,7,349.98
301,9,799.96
207,10,174.99
401,11,1199.97
206,12,599.96
208,12,599.96
304,13,184.99
205,14,699.96
204,15,184.99
401,16,1259.97
303,17,199.99
305,18,349.98
208,19,149.99
203,20,399.98
401,21,1199.97
206,22,449.97
301,22,599.97
302,23,699.96
306,NULL,NULL
*/


SELECT 
    ro.RoomNum AS RoomNumber,
    (rr.AdultNum + rr.ChildNum) AS TotalGuests,
    re.StartDate AS CheckInDate,
    re.EndDate AS CheckOutDate
FROM
    Reservation AS re
        INNER JOIN
    ReservationRoom AS rr ON re.ReservationId = rr.ReservationId
        INNER JOIN
    Room AS ro ON rr.RoomId = ro.RoomId
WHERE
    (rr.AdultNum + rr.ChildNum) >= 3
        AND ((re.StartDate BETWEEN '2023-04-01' AND '2023-04-30')
        OR (re.EndDate BETWEEN '2023-04-01' AND '2023-04-30'));
        
-- Result:
/*
RoomNumber,TotalGuests,CheckInDate,CheckOutDate
*/


SELECT 
    CONCAT(g.FirstName, ' ', g.LastName) AS Guest,
    COUNT(re.ReservationId) AS NumReservations
FROM
    Guest AS g
        INNER JOIN
    Reservation re ON g.GuestId = re.GuestId
GROUP BY re.GuestId
ORDER BY NumReservations DESC , g.LastName;

-- Result:
/*
Guest,NumReservations
"Bettyann Seery",3
"Mack Simmer",3
"Duane Cullison",2
"Walter Halaway",2
"Aurore Lipton",2
"Rami Mansieh",2
"Maritza Tilton",2
"Wilfred Vise",2
"Karie Yang",2
"Zachary Luechtefeld",1
"Joleen Tison",1
*/


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
    
    -- Result:
/*
GuestName,Address,Phone#
"Duane Cullison","9662 Foxrun Lane",(308)494-0198
*/
	
