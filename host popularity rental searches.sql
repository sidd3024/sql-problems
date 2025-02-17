-- Problem :
-- https://platform.stratascratch.com/coding/9632-host-popularity-rental-prices?code_type=3

with host_data as(
Select CONCAT(price,room_type,host_Since,zipcode,number_of_reviews) as host_id,
price,
number_of_reviews
from airbnb_host_searches),
-- Select * from host_data
review_type as (
Select host_id,case when sum(number_of_reviews)=0 then 'New'
when sum(number_of_reviews)>=1 and sum(number_of_reviews)<=5 then 'Rising'
when sum(number_of_reviews) >=6 and sum(number_of_reviews)<=15 then 'Trending Up'
when sum(number_of_reviews) >=16 and sum(number_of_reviews)<=40 then 'Popular'
else 'Hot' end as host_popularity,
price
 from host_data
 group by host_id
)
-- Select * from review_type
select host_popularity,min(price) as min_price,avg(price) as avg_price,max(price) as max_price from review_type
group by host_popularity
order by min_price