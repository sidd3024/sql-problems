# Problem :
https://platform.stratascratch.com/coding/514-marketing-campaign-success-advanced?code_type=3

-- # First in app purchase

with first_purchase_user as (
Select a.* from (
Select user_id, created_at, product_id, RANK() OVER (PARTITION BY user_id order by created_at asc) as ranks
from marketing_campaign
)a
where a.ranks=1
)
Select count(distinct b3.b2_user_id) from (
Select b2.user_id as b2_user_id, b2.created_at as b2_created_at , b2.product_id as b2_product_id, b1.user_id, b1.product_id, b1.created_at from first_purchase_user b1
right join  marketing_campaign b2
on b1.user_id=b2.user_id and b1.created_at=b2.created_at and b1.product_id=b2.product_id
where b1.product_id is Null and b1.user_id is Null
)b3
left join first_purchase_user b4
on b3.b2_user_id = b4.user_id and b3.b2_product_id=b4.product_id
where b4.user_id is Null and b4.product_id is Null 
