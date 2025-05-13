
DROP TABLE IF EXISTS bookings CASCADE;

-- Step 1: Create the partitioned parent table
CREATE TABLE bookings (
    id SERIAL PRIMARY KEY,
    user_id INT,
    property_id INT,
    start_date DATE NOT NULL,
    end_date DATE,
    status VARCHAR(50),
    amount DECIMAL(10,2)
) PARTITION BY RANGE (start_date);

-- Step 2: Create partitions by year
CREATE TABLE bookings_2022 PARTITION OF bookings
    FOR VALUES FROM ('2022-01-01') TO ('2023-01-01');

CREATE TABLE bookings_2023 PARTITION OF bookings
    FOR VALUES FROM ('2023-01-01') TO ('2024-01-01');

CREATE TABLE bookings_2024 PARTITION OF bookings
    FOR VALUES FROM ('2024-01-01') TO ('2025-01-01');

-- Optional: Add indexes to the partitions
CREATE INDEX ON bookings_2022 (start_date);
CREATE INDEX ON bookings_2023 (start_date);
CREATE INDEX ON bookings_2024 (start_date);

-- Step 3: Run EXPLAIN ANALYZE to test performance
EXPLAIN ANALYZE
SELECT * FROM bookings
WHERE start_date BETWEEN '2023-06-01' AND '2023-06-30';
