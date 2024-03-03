/*Question:
Lyft is a popular ride-sharing platform that connects drivers with riders. Users place a car booking request when they need a ride, and while many of these requests get matched with drivers, some don't get any match. You are given the following tables:

users:
user_id (Primary key): An identifier for each user.
user_name: The name of the user.
email: The email address of the user.
bookings:
booking_id (Primary key): An identifier for each booking.
user_id (Foreign key): The ID of the user who made the booking.
driver_id: The ID of the driver assigned for the booking (this can be null if no driver is matched).
booking_time: The timestamp when the booking was placed.
status: The status of the booking (e.g., "Matched", "Unmatched").
Write a SQL query to find the average number of unmatched bookings per user. Your output should contain the following columns: user_id, user_name, email, avg_unmatched_bookings (rounded to the nearest 2 decimal place).*/

--My Solution

SELECT
    u.user_id,
    u.user_name,
    u.email,
    ROUND(AVG(CASE WHEN b.status = 'Unmatched' THEN 1.0 ELSE 0 END), 2) AS avg_unmatched_bookings
FROM
    users u
LEFT JOIN
    bookings b ON u.user_id = b.user_id
GROUP BY
    u.user_id,
    u.user_name,
    u.email;
