# 📊 Performance Monitoring Report

## 🎯 Objective

Continuously monitor and refine database performance by analyzing query execution plans and applying necessary schema adjustments such as indexing and partitioning.

---

## 🔍 Monitoring Tools Used

- `EXPLAIN ANALYZE`: To inspect the query plan and execution time.
- Manual log timing on PostgreSQL queries.

---

## ⚙️ Queries Monitored

### 1️⃣ Bookings With User, Property, and Payment Details

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
    p.name AS property_name,
    pay.payment_method
FROM bookings b
JOIN users u ON b.user_id = u.user_id
JOIN properties p ON b.property_id = p.property_id
JOIN payments pay ON b.booking_id = pay.booking_id;
```

#### 🔴 Issue
- Execution plan showed sequential scans and nested hash joins on large tables.
- No indexes on foreign key columns used in JOINs.

#### ✅ Solution

Added indexes to improve lookup speed:
```sql
CREATE INDEX IF NOT EXISTS idx_bookings_user_id ON bookings(user_id);
CREATE INDEX IF NOT EXISTS idx_bookings_property_id ON bookings(property_id);
CREATE INDEX IF NOT EXISTS idx_payments_booking_id ON payments(booking_id);
```

#### 🟢 Improvement

| Case     | Execution Time |
| -------- | -------------- |
| ❌ Before | 3.720 ms       |
| ✅ After  | 1.240 ms ✅     |


2### ️⃣ Filtering Bookings by Date
```sql
EXPLAIN ANALYZE
SELECT * FROM bookings
WHERE start_date BETWEEN '2025-07-01' AND '2025-07-31';
```

#### 🔴 Issue
- Full table scan on bookings table
- Poor performance as data grows

#### ✅ Solution

Applied partitioning on start_date using RANGE partitioning strategy:
-- Booking table partitioned into:
-- bookings_2025_07, bookings_2025_08, bookings_2025_09


#### 🟢 Improvement
| Case     | Execution Time |
| -------- | -------------- |
| ❌ Before | 2.842 ms       |
| ✅ After  | 0.191 ms ✅     |


#### 🧠 Lessons Learned
- Partitioning greatly improves date-based queries on large datasets.
- Indexes on foreign key columns are essential for fast JOIN operations.
- Regular profiling using EXPLAIN ANALYZE helps uncover slow parts of your schema.
	
	

##📌 Recommendations
- Monitor query plans after every schema or data volume change.
- Automate index creation for frequently joined columns.
- Consider partitioning for other large tables like payments.