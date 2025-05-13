-- Create index on users.id
CREATE INDEX IF NOT EXISTS idx_users_id ON users(id);

-- Create index on bookings.user_id
CREATE INDEX IF NOT EXISTS idx_bookings_user_id ON bookings(user_id);

-- Create index on bookings.property_id
CREATE INDEX IF NOT EXISTS idx_bookings_property_id ON bookings(property_id);

-- Create index on properties.id
CREATE INDEX IF NOT EXISTS idx_properties_id ON properties(id);

-- Create index on bookings.created_at
CREATE INDEX IF NOT EXISTS idx_bookings_created_at ON bookings(created_at);

-- Measure performance with EXPLAIN ANALYZE after indexes are applied
EXPLAIN ANALYZE
SELECT u.name, COUNT(b.id)
FROM users u
JOIN bookings b ON u.id = b.user_id
GROUP BY u.name;

 Indexes for Optimization

EXPLAIN ANALYZE
SELECT u.name, COUNT(b.id) AS total_bookings
FROM users u
JOIN bookings b ON u.id = b.user_id
GROUP BY u.name;

-- Measure performance of an ORDER BY query before indexing
EXPLAIN ANALYZE
SELECT * FROM bookings
ORDER BY created_at DESC;

-- =========================================
-- CREATE INDEXES TO OPTIMIZE QUERIES
-- =========================================

-- Index on primary key of users
CREATE INDEX IF NOT EXISTS idx_users_id ON users(id);

-- Index on user_id for faster joins
CREATE INDEX IF NOT EXISTS idx_bookings_user_id ON bookings(user_id);

-- Index on property_id for joins
CREATE INDEX IF NOT EXISTS idx_bookings_property_id ON bookings(property_id);

-- Index on created_at for ordering and filtering
CREATE INDEX IF NOT EXISTS idx_bookings_created_at ON bookings(created_at);

-- Index on properties.id (frequently joined)
CREATE INDEX IF NOT EXISTS idx_properties_id ON properties(id);

-- =========================================
-- PERFORMANCE ANALYSIS AFTER INDEXING
-- =========================================

-- Rerun the same JOIN query to compare performance
EXPLAIN ANALYZE
SELECT u.name, COUNT(b.id) AS total_bookings
FROM users u
JOIN bookings b ON u.id = b.user_id
GROUP BY u.name;

-- Rerun the ORDER BY query to compare performance
EXPLAIN ANALYZE
SELECT * FROM bookings
ORDER BY created_at DESC;
