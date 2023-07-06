--use social


--all about posts
select * from posts

--procedure for creating a post
create procedure createpost
@userid int,
 @contenturl varchar(300)
 as 
begin
insert into posts(userid,contenturl)
values 
(@userid,@contenturl)
 end 

 exec createpost @userid = 1, @contenturl='https://www.youtube.com/watch?v=CWPV0xLUWrA'

--procedure for deleting a post
 create procedure deletepost
 @postid int 
as 
begin 
delete from posts where postid = @postid;
end

exec deletepost @postid = 1

--a view to select all post

CREATE VIEW vw_posts AS
SELECT *
FROM posts

SELECT * FROM vw_posts