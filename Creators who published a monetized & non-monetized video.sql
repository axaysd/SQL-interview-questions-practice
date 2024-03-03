/*
Q: 1. Creators who published a monetized & non-monetized video?
Which creators published a monetized video 5 mins or longer followed by a non-monetized video that was also 5 mins or longer? Round intermediary calculations to 2 decimals. Output the email of creators sorted the alphabetical order.
Expected Output:

Your answer should match this structure exactly. Keep in mind SQL sorting, grouping, & rounding when answering.
email
BLee3@hotmail.com
MKim7@hotmail.com
WGuzman3@yahoo.com
Source Tables:

Visualize the table definitions prior to formalizing your solution. Click the icon to see into the table's data.
youtube_videos	
video_id	bigint
is_monetized	bigint
video_title	varchar
channel	varchar
user_id	bigint
category	varchar
published_at	timestamp
duration_sec	bigint
youtube_users	
user_id	bigint
username	varchar
first_name	varchar
last_name	varchar
email	varchar
country	varchar
signup_dt	timestamp

*/

--My solution:

WITH
  paid AS
  (SELECT
     user_id,
     video_id,
     published_at,
     round(CAST(duration_sec AS double) / 60, 2) duration_min
   FROM youtube_videos
   WHERE is_monetized = TRUE),
  FREE AS
  (SELECT
     user_id,
     video_id,
     published_at,
     ROUND(CAST(duration_sec AS double) / 60, 2) duration_min
   FROM youtube_videos
   WHERE is_monetized = FALSE)
SELECT DISTINCT usr.email
FROM paid
JOIN FREE ON paid.user_id = free.user_id
AND paid.published_at < free.published_at
JOIN youtube_users usr on paid.user_id = usr.user_id
WHERE paid.duration_min >= 5
AND free.duration_min >= 5
ORDER email ASC;
