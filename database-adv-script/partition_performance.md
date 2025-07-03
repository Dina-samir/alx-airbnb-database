# Booking Table Partitioning Report

## 🧾 Objective

Partition the `bookings` table by `start_date` to improve performance on time-based queries.

## ⚙️ Partitioning Strategy

- **Type**: Range Partitioning
- **Column**: `start_date`
- **Granularity**: Monthly
- **Partitions**: 2025-07, 2025-08, 2025-09

## 🧪 Performance Test

**Query Tested:**

```sql
EXPLAIN ANALYZE
SELECT * FROM bookings WHERE start_date BETWEEN '2025-07-01' AND '2025-07-31';
```

## 🔁 Before Partitioning

    - Execution Time: 2.842 ms

    - Plan: Full table scan on bookings

## ✅ After Partitioning

    - Execution Time: 0.191 ms

    - Plan: Index/scan on only bookings_2025_07 partition

## ✅ Observations

    - Query performance improved significantly for date-based queries.

    - PostgreSQL scans only relevant partitions based on start_date.

    - Useful for dashboards, reports, and large-scale analytics.

## 📌 Recommendation

- Use range partitioning on start_date for all large, time-series tables in the system.