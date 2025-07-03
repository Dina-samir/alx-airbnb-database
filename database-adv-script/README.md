# Advanced SQL Scripts for Airbnb Database

This repository contains a series of advanced SQL exercises to improve your skills in query writing, performance tuning, and database optimization. Each task focuses on a specific aspect of SQL, including joins, subqueries, aggregation, indexing, and performance monitoring.

## 📁 Directory: `database-adv-script`

### 0. ✅ Write Complex Queries with Joins
**Objective:** Master SQL joins by writing complex queries using different types of joins.

**Concepts Covered:**
- `INNER JOIN`: Only matched rows from both tables.
- `LEFT JOIN`: All records from the left table, matched rows from the right.
- `FULL OUTER JOIN`: All records from both tables, matched or not.

**File:** `joins_queries.sql`

### 1. ✅ Practice Subqueries
**Objective:** Write both correlated and non-correlated subqueries.

**Concepts Covered:**
- **Non-correlated subquery**: Independent query that can be run standalone.
- **Correlated subquery**: Depends on the outer query; runs per row of outer query.

**File:** `subqueries.sql`

### 2. ✅ Apply Aggregations and Window Functions
**Objective:** Use SQL aggregation and window functions to analyze data.

**Concepts Covered:**
- `COUNT`, `GROUP BY` for aggregation.
- `ROW_NUMBER()`, `RANK()` as examples of window functions for ranking.

**File:** `aggregations_and_window_functions.sql`

### 3. ✅ Implement Indexes for Optimization
**Objective:** Improve query performance by creating indexes on high-usage columns.

**Concepts Covered:**
- `CREATE INDEX` on columns used in `WHERE`, `JOIN`, `ORDER BY`.
- Use of `EXPLAIN` or `ANALYZE` to assess performance impact.

**File:** `index_performance.md`

### 4. ✅ Optimize Complex Queries
**Objective:** Refactor complex queries to reduce execution time.

**Concepts Covered:**
- Query performance analysis with `EXPLAIN`.
- Optimization techniques: indexing, minimizing joins, filtering early.

**Files:** `optimization_report.md`, `perfomance.sql`

### 5. ✅ Partitioning Large Tables
**Objective:** Use partitioning to improve performance on large datasets.

**Concepts Covered:**
- Partitioning strategy (e.g., by `start_date`).
- Performance testing pre- and post-partitioning.

**Files:** `partition_performance.md`, `partitioning.sql`

### 6. ✅ Monitor and Refine Database Performance
**Objective:** Continuously monitor and tune performance using SQL profiling tools.

**Concepts Covered:**
- Performance monitoring with `SHOW PROFILE`, `EXPLAIN ANALYZE`.
- Schema adjustments and indexing for long-term performance.

**File:** `performance_monitoring.md`

---

## 📌 Tips and Concepts
- **Use JOINs** to combine rows from multiple tables based on a related column.
- **Subqueries** can help encapsulate logic and filter data dynamically.
- **Indexes** greatly improve lookup performance but may slow down inserts/updates.
- **Window functions** enable advanced analytics like running totals and ranking.
- **Partitioning** is effective on very large tables with range-based queries.
- **Query planning** with `EXPLAIN` helps understand execution costs and bottlenecks.

---

## 🗃️ Repository
**GitHub Repository:** `alx-airbnb-database`  
**Directory:** `database-adv-script`

Contributions by **Dina Samir**
