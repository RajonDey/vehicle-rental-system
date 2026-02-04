-- Query 1: JOIN
-- Retrieve booking info with customer name and vehicle name
SELECT 
    bookings.booking_id,
    customers.customer_name,
    vehicles.vehicle_name,
    bookings.booking_date
FROM bookings
INNER JOIN customers
    ON bookings.customer_id = customers.customer_id
INNER JOIN vehicles
    ON bookings.vehicle_id = vehicles.vehicle_id;

-- Query 2: EXISTS
-- Find all vehicles that have never been booked
SELECT 
    vehicle_id,
    vehicle_name
FROM vehicles
WHERE NOT EXISTS (
    SELECT *
    FROM bookings
    WHERE bookings.vehicle_id = vehicles.vehicle_id
);

-- Query 3: WHERE
-- Retrieve all available vehicles of a specific type (e.g., cars)
SELECT 
    vehicle_id,
    vehicle_name,
    vehicle_type,
    availability_status
FROM vehicles
WHERE vehicle_type = 'Car'
AND availability_status = 'Available';


-- Query 4: GROUP BY and HAVING
-- Find total bookings per vehicle with more than 2 bookings
SELECT 
    vehicles.vehicle_id,
    vehicles.vehicle_name,
    COUNT(bookings.booking_id) AS total_bookings
FROM vehicles
INNER JOIN bookings
    ON vehicles.vehicle_id = bookings.vehicle_id
GROUP BY 
    vehicles.vehicle_id,
    vehicles.vehicle_name
HAVING COUNT(bookings.booking_id) > 2;

