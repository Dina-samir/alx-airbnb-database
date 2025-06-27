# 🧠 Database Normalization – Airbnb Clone

## 🎯 Objective
Apply normalization principles to ensure the Airbnb database schema is in **Third Normal Form (3NF)** to eliminate redundancy and ensure data integrity.

---

## 📘 Normalization Overview
Normalization is the process of organizing data to reduce redundancy and improve data integrity. 
It involves dividing a database into two or more tables and defining relationships between them.

### Importance:
Normalization 
- Reduces data redundancy
- Prevents anomalies
- Ensures data consistency. 
- Simplifies data maintenance and improves database performance.

We walk through **1NF → 2NF → 3NF**:

---

## ✅ First Normal Form (1NF)
- Ensure each column contains atomic values, and each record is unique.

## ✅ Second Normal Form (2NF)
- Achieve 1NF.
- All non-key attributes are fully functionally dependent on the primary key.

## ✅ Third Normal Form (3NF)
- Achieve 2NF.
- All attributes are functionally dependent only on the primary key.
- No transitive dependencies (non-key attribute depends on another non-key attribute)

**Analysis:**

### User Table
- All attributes depend only on `user_id` → ✅ 3NF

### Property Table
- `host_id` is a foreign key → not a transitive dependency → ✅ 3NF

### Booking Table
- `status`, `total_price` depend only on `booking_id` → ✅ 3NF

### Payment Table
- `payment_method`, `amount` depend only on `payment_id` → ✅ 3NF

### Review Table
- No transitive dependencies → ✅ 3NF

### Message Table
- `sender_id`, `recipient_id` are foreign keys → ✅ 3NF



## ✅ Conclusion
The Airbnb database schema adheres to **3NF**. It avoids redundancy and ensures efficient data organization and integrity.

