-- query to find the total number of bookings made by each user, using the COUNT function and GROUP BY clause.
SELECT count(*),  b.user_id 
FROM public.bookings b 
INNER JOIN public.users u
	ON b.user_id=u.user_id
	GROUP BY b.user_id;
	
-- window function (RANK) to rank properties based on the total number of bookings they have received.	
select 
	property_id, 
	total_booking, 
	RANK() over (order by total_booking DESC) as booking_rank,
	ROW_NUMBER() over (order by total_booking DESC) as booking_row_number
from (
	select 
		count(*) as total_booking, 
	    property_id 
	from public.bookings 
	group by property_id
    ) as booking_counts;

