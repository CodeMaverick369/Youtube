CREATE DATABASE youtube_analysis;

USE youtube_analysis;


CREATE TABLE youtube_videos (
    video_id INT PRIMARY KEY,
    title VARCHAR(255),
    upload_date DATE,
    views INT,
    likes INT,
    dislikes INT,
    comments INT,
    duration_seconds INT,
    category VARCHAR(100)
);
   
#-1 Which videos have the highest number of views?
   select title, views 
   from youtube_videos
   order by views desc
   limit 10;

#-2 Which categories have the most videos?
	  select category,count(views) AS Total_videos
      from youtube_videos
      group by category
      order by Total_videos desc;


#-3 What is the average number of likes per category?
   select category, avg(likes) as avg_likes
   from youtube_videos
   group by category;

#-4 What is the average duration of videos in each category?
  select category, avg(duration_seconds) as AVG_Duration
  from youtube_videos
  group by category;

#-5 Which videos have the highest like-to-dislike ratio?
select title, max(likes),max(dislikes),
from youtube_videos
group by title
order by title asc;

SELECT title, likes, dislikes, (likes * 0.01 / NULLIF(dislikes, 1)) AS ratio
FROM youtube_videos
ORDER BY ratio DESC;


#-6 Which videos have the most comments?
 
 select title, max(comments) as most_comments
 from youtube_videos
 group by title
 order by most_comments desc;

#-7 What is the total number of views per category?

select category, sum(views) as total_views
from youtube_videos
group by category
order by total_views desc;

#-8Which videos have the highest engagement (likes + comments)?

select title, max(likes) + max(comments) as engage
from youtube_videos
group by title
order by  engage desc
limit 10;

#-9How many videos were uploaded each year?
select year(upload_date) as year, count(title) as Total_videos
from youtube_videos
group by year
order by year;

#-10 What is the average number of dislikes per category?
select category , avg(dislikes) as AVG_dislikes
from youtube_videos
group by category;


