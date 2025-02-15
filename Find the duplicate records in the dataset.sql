# Problem :
https://platform.stratascratch.com/coding/9849-find-the-duplicate-records-in-the-dataset?code_type=1

Select worker_title, affected_from ,count(*) as n_affected
from title
group by worker_title,affected_from
having count(*)>1