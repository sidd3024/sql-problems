--  Problem :
--  https://platform.stratascratch.com/coding/9814-counting-instances-in-text?code_type=3




-- select * from google_file_store;
with word_count as (
Select "word",
case when contents REGEXP "bull" then 1 
else 0 end as bull,
case when contents REGEXP "bear" then 1
else 0 end as bear
from google_file_store
),
-- Select * from word_count
words_agg as(
Select word , sum(bull) as bull, sum(bear) as bear
from word_count
group by word
),
final_ans as(
Select "bull" as word , bull as nentry
from words_agg 
union all
Select "bear" as word , bear as nentry
from words_agg )
select * from final_ans