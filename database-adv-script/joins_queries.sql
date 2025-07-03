
-- Write a query using an INNER JOIN to retrieve all bookings and the respective users who made those bookings.
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

-- Write a query using a LEFT JOIN to retrieve all properties and their reviews, including properties that have no reviews.
SELECT *
FROM public.properties AS p
LEFT OUTER JOIN public.reviews AS r
    ON p.property_id = r.property_id ORDER BY p.created_at;

-- Write a query using a FULL OUTER JOIN to retrieve all users and all bookings, even if the user has no booking or a booking is not linked to a user.
SELECT *
FROM public.users AS u
FULL OUTER JOIN public.bookings AS b
    ON u.user_id = b.user_id;
