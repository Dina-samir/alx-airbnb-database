-- query to find all properties where the average rating is greater than 4.0 using a subquery.
SELECT * 
FROM (
    SELECT 
        AVG(rating) AS avg_rating,
        property_id
    FROM public.reviews
    GROUP BY property_id
) AS sub_query
WHERE avg_rating > 4;


-- another way		   
select avg(rating), property_id from public.reviews 
group by property_id
having avg(rating) > 4


--  correlated subquery to find users who have made more than 3 bookings.
SELECT u.user_id, u.first_name, u.last_name
FROM users u
WHERE (
    SELECT COUNT(*)
    FROM bookings b
    WHERE b.user_id = u.user_id
) > 3;

