create procedure createlike
@likesid int,
@postid int,
@userid int,
@likey int
as 
begin 
insert into likes(likesid,postid,userid,likey)
values 
(@likesid,@postid,@userid,@likey)
end 

--getting number of like count by one
-- SELECT COUNT(*) - 1 AS count_likey
-- FROM likes
-- WHERE likey = 'countlikes'

-- handle later when dealing with it
SELECT 
    SUM(CASE WHEN likey = 'like' THEN 1 ELSE 0 END) AS count_like,
    SUM(CASE WHEN likey = 'unlike' THEN 1 ELSE 0 END) AS count_unlike
FROM likes;
