-- 1. Total number of bookings made by each user using COUNT and GROUP BY
SELECT
    u.id AS user_id,
    u.name AS user_name,
    COUNT(b.id) AS total_bookings
FROM users u
LEFT JOIN bookings b ON u.id = b.user_id
GROUP BY u.id, u.name
ORDER BY total_bookings DESC;

-- 2. Use ROW_NUMBER() to rank properties based on the total number of bookings
SELECT
    property_id,
    property_title,
    total_bookings,
    ROW_NUMBER() OVER (ORDER BY total_bookings DESC) AS row_number_rank
FROM (
    SELECT
        p.id AS property_id,
        p.title AS property_title,
        COUNT(b.id) AS total_bookings
    FROM properties p
    LEFT JOIN bookings b ON p.id = b.property_id
    GROUP BY p.id, p.title
) AS property_booking_counts;

-- 3. Use RANK() to handle ties when ranking properties
SELECT
    property_id,
    property_title,
    total_bookings,
    RANK() OVER (ORDER BY total_bookings DESC) AS rank_position
FROM (
    SELECT
        p.id AS property_id,
        p.title AS property_title,
        COUNT(b.id) AS total_bookings
    FROM properties p
    LEFT JOIN bookings b ON p.id = b.property_id
    GROUP BY p.id, p.title
) AS property_booking_counts;
