-- Query 1: JOIN
-- Retrieve booking info with customer name and vehicle name
SELECT 
    b.booking_id,
    c.customer_name,
    v.vehicle_name,
    b.booking_date
FROM 
    bookings b
INNER JOIN 
    customers c ON b.customer_id = c.customer_id
INNER JOIN 
    vehicles v ON b.vehicle_id = v.vehicle_id;

-- Query 2: EXISTS
-- Find all vehicles that have never been booked
SELECT 
    v.vehicle_id,
    v.vehicle_name
FROM 
    vehicles v
WHERE 
    NOT EXISTS (
        SELECT 1 
        FROM bookings b 
        WHERE b.vehicle_id = v.vehicle_id
    );

-- Query 3: WHERE
-- Retrieve all available vehicles of a specific type (e.g. cars)
SELECT 
    vehicle_id,
    vehicle_name,
    vehicle_type,
    availability_status
FROM 
    vehicles
WHERE 
    vehicle_type = 'Car' 
    AND availability_status = 'Available';

-- Query 4: GROUP BY and HAVING
-- Find total bookings per vehicle with more than 2 bookings
SELECT 
    v.vehicle_id,
    v.vehicle_name,
    COUNT(b.booking_id) AS total_bookings
FROM 
    vehicles v
LEFT JOIN 
    bookings b ON v.vehicle_id = b.vehicle_id
GROUP BY 
    v.vehicle_id, v.vehicle_name
HAVING 
    COUNT(b.booking_id) > 2;
