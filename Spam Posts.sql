# Problem :
https://platform.stratascratch.com/coding/10134-spam-posts?code_type=3

# sTEP 1:# Finding the post that is viewed by the user
# sTEP 2 : fINDING IF 'SPAM' exists in the keyword
Select e.post_date, (e.spam_posts/e.total_posts)*100 as spam_share
from(
Select d.post_date,sum( case when d.is_spam = 'spam' then 1 else 0 end)  as spam_posts,count(*) as total_posts
from(
Select c.post_date as post_date, case when c.post_keywords REGEXP 'spam' then 'spam' else 'Not_spam'
end as is_spam
from(
Select a.post_id as post_id ,a.post_keywords as post_keywords,a.post_date as post_date,b.viewer_id as viewer_id
from facebook_posts a
join facebook_post_views b
on a.post_id=b.post_id
)c
)d
group by d.post_date)e
