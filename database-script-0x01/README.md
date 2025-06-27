# Airbnb Clone – Database Schema

## 🎯 Objective
Define the SQL schema for the Airbnb clone system, based on normalized ERD.

## 📦 Files

- `schema.sql`: Contains all `CREATE TABLE` statements, constraints, and indexes.
- `README.md`: This file with schema overview and instructions.

## 📋 Tables Included

- `users`
- `properties`
- `bookings`
- `payments`
- `reviews`
- `messages`

Each table has appropriate:
- Primary keys
- Foreign key constraints
- CHECK constraints
- ENUMs for controlled values
- Indexes for query performance

## 🧪 Usage

To apply the schema in PostgreSQL:

```bash
psql -U your_user -d your_database -f schema.sql
