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
