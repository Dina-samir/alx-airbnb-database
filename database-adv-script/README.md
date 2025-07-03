
# SQL Join Queries

This project contains examples of SQL queries demonstrating different types of joins between tables in a PostgreSQL database.

## Files

### `join_queries.sql`
This file includes three SQL queries, each illustrating a different type of join:

1. **INNER JOIN**
   - Retrieves all bookings and the respective users who made those bookings.
   - Only returns records where a matching user exists for each booking.
   - Query:
     ```sql
     SELECT 
         b.property_id,
         b.start_date,
         b.end_date,
         b.total_price,
         b.status,
         u.first_name,
         u.last_name,
         u.phone_number
     FROM public.bookings AS b
     INNER JOIN public.users AS u
         ON b.user_id = u.user_id;
     ```

2. **LEFT JOIN**
   - Retrieves all properties and their reviews.
   - Includes properties even if they don't have any associated reviews.
   - Query:
     ```sql
     SELECT *
     FROM public.properties AS p
     LEFT OUTER JOIN public.reviews AS r
         ON p.property_id = r.property_id;
     ```

3. **FULL OUTER JOIN**
   - Retrieves all users and all bookings.
   - Includes users with no bookings and bookings not linked to any user.
   - Query:
     ```sql
     SELECT *
     FROM public.users AS u
     FULL OUTER JOIN public.bookings AS b
         ON u.user_id = b.user_id;
     ```

## Usage

You can run the queries in `join_queries.sql` using any SQL interface connected to your PostgreSQL database, such as:
- `psql` command-line tool
- pgAdmin
- DBeaver or any SQL client

Make sure your schema (`public`) and table structures match those referenced in the queries.

