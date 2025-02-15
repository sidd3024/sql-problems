# Problem :
https://platform.stratascratch.com/coding/2026-bottom-2-companies-by-mobile-usage?code_type=3

Select b.customer_id,b.event_count
from
(Select a.customer_id as customer_id, a.event_count as event_count, RANK() over (order by a.event_count asc ) as rankings
from(
Select customer_id,count(event_id) as event_count
from fact_events where client_id='mobile'
group by customer_id
order by event_count asc
)a
)b
where b.rankings<=2