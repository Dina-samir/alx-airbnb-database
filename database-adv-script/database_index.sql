-- Create index on users.user_id (frequently used in JOINs)
CREATE INDEX IF NOT EXISTS idx_users_user_id ON users(user_id);

-- Create index on bookings.user_id (used in WHERE and JOINs)
CREATE INDEX IF NOT EXISTS idx_bookings_user_id ON bookings(user_id);

-- Create index on bookings.property_id (used in JOINs and aggregations)
CREATE INDEX IF NOT EXISTS idx_bookings_property_id ON bookings(property_id);

-- Create index on bookings.start_date (useful for filtering date ranges)
CREATE INDEX IF NOT EXISTS idx_bookings_start_date ON bookings(start_date);

-- Create index on properties.property_id (used in JOINs)
CREATE INDEX IF NOT EXISTS idx_properties_property_id ON properties(property_id);

-- Create index on reviews.property_id (used in JOINs)
CREATE INDEX IF NOT EXISTS idx_reviews_property_id ON reviews(property_id);
