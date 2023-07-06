create procedure createcomment
@postid int,
@userid int,
@contenturl varchar(400)
AS
BEGIN
insert into comments(postid,userid,contenturl)
VALUES
(@postid,@userid,@contenturl)
END

EXEC createcomment @postid = 10, @userid = 1, @contenturl = 'https://example.com/content';

create procedure deletecomment
@commentid INT
AS
BEGIN
delete from comments where commentid = @commentid
END

select * from comments



use social

