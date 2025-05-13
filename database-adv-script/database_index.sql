-
CREATE INDEX idx_users_id ON users(id);

-- Create index on bookings.user_id (frequent JOIN/WHERE)
CREATE INDEX idx_bookings_user_id ON bookings(user_id);

-- Create index on bookings.property_id (used in JOINs)
CREATE INDEX idx_bookings_property_id ON bookings(property_id);

-- Create index on properties.id (used in JOINs and primary lookups)
CREATE INDEX idx_properties_id ON properties(id);

-- Create index on bookings.created_at (useful for date range queries)
CREATE INDEX idx_bookings_created_at ON bookings(created_at);
