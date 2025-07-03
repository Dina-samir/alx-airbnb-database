# Index Performance Report

## 🎯 Objective
To improve query performance in the `alx-airbnb-database` by identifying high-usage columns and creating indexes on them.

---

## 🧪 Tested Tables
- `users`
- `bookings`
- `properties`
- `reviews`

---

## ✅ Indexes Created

```sql
-- Users table
CREATE INDEX IF NOT EXISTS idx_users_user_id ON users(user_id);

-- Bookings table
CREATE INDEX IF NOT EXISTS idx_bookings_user_id ON bookings(user_id);
CREATE INDEX IF NOT EXISTS idx_bookings_property_id ON bookings(property_id);
CREATE INDEX IF NOT EXISTS idx_bookings_start_date ON bookings(start_date);

-- Properties table
CREATE INDEX IF NOT EXISTS idx_properties_property_id ON properties(property_id);

-- Reviews table
CREATE INDEX IF NOT EXISTS idx_reviews_property_id ON reviews(property_id);
```

## 📊 Performance Comparison
1. Query: Get all bookings for a user

<!-- SELECT * FROM bookings WHERE user_id = 'abc123'; -->

✅ Performance:
- The query was faster after indexing (even though PostgreSQL used a sequential scan).
- Time dropped from 0.860 ms → 0.023 ms.
- PostgreSQL optimizer chose the most efficient path based on table size and cost.


2. Query: Join properties and reviews

<!-- SELECT p.name, r.rating
FROM properties p
JOIN reviews r ON p.property_id = r.property_id; -->

✅ Performance:
- PostgreSQL optimized the join by selecting the smaller table (reviews) to hash.
- Time dropped from 0.54 ms →  0.16 ms.
- The join direction was flipped to improve speed and memory efficiency.


## 📝 Notes

- EXPLAIN ANALYZE was used to measure performance improvements.
- Indexes improve read performance significantly on large datasets.
- Be cautious with over-indexing: too many indexes can slow down inserts/updates.