-- Problem :
-- https://platform.stratascratch.com/coding/10172-best-selling-item?code_type=3



-- select * from online_retail;
with online_retail_upd as (
Select * , substring(cast(invoicedate as CHAR),6,2) as month ,
unitprice*quantity as paid
from online_retail
),
intermediate_data as (
Select month ,description, sum(paid) as total_paid
from online_retail_upd
group by month,description
),
final_ans as(
Select a.month as month, a.description as description, a.total_paid as total_paid from (Select month,description,total_paid, RANK() over (PARTITION BY month order by total_paid desc) as rnk
from intermediate_data) a
where a.rnk=1
order by a.month
)
select * from final_ans