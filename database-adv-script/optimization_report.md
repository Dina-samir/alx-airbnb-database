# 📝 Query Optimization: Join Bookings, Users, Properties, and Payments

## 📌 Query

```sql
EXPLAIN ANALYZE
SELECT 
    b.booking_id,
    b.start_date,
    b.end_date,
    b.total_price,
    b.status,
    u.first_name,
    u.last_name,
    u.email,
    p.name AS property_title,
    p.location,
    pay.payment_method
FROM bookings b
JOIN users u ON b.user_id = u.user_id
JOIN properties p ON b.property_id = p.property_id
JOIN payments pay ON b.booking_id = pay.booking_id;
'''

- We have run the above query before and after creating indexes
- We see that using idexes reduce processing time

-- Create index on payments.booking_id (used in JOINs)
CREATE INDEX IF NOT EXISTS idx_payments_booking_id ON payments(booking_id)

-- Create index on bookings.property_id (used in JOINs and aggregations)
CREATE INDEX IF NOT EXISTS idx_bookings_property_id ON bookings(property_id);

-- Create index on bookings.user_id (used in WHERE and JOINs)
CREATE INDEX IF NOT EXISTS idx_bookings_user_id ON bookings(user_id);