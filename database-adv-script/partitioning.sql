-- Step 1: Rename the original bookings table
ALTER TABLE bookings RENAME TO bookings_old;

-- Step 2: Create a new partitioned bookings table
CREATE TABLE bookings (
    booking_id UUID,
    user_id UUID,
    property_id UUID,
    start_date DATE NOT NULL,
    end_date DATE,
    total_price NUMERIC,
    status VARCHAR(20),
    PRIMARY KEY (booking_id, start_date) ,
	created_at DATE
) PARTITION BY RANGE (start_date);

-- Step 3: Create partitions (monthly or yearly depending on granularity)

-- Monthly partitions for 2025 Q3
CREATE TABLE bookings_2025_07 PARTITION OF bookings
    FOR VALUES FROM ('2025-07-01') TO ('2025-08-01');

CREATE TABLE bookings_2025_08 PARTITION OF bookings
    FOR VALUES FROM ('2025-08-01') TO ('2025-09-01');

CREATE TABLE bookings_2025_09 PARTITION OF bookings
    FOR VALUES FROM ('2025-09-01') TO ('2025-10-01');

-- Step 4: Insert data back from old table
INSERT INTO bookings
SELECT * FROM bookings_old;

-- Optional: Drop old table
-- DROP TABLE bookings_old;
