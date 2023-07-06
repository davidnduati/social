CREATE PROCEDURE createfollowers
  @userid INT,
  @followeruserid INT
AS
BEGIN
  INSERT INTO followers (userid, followeruserid)
  VALUES (@userid, @followeruserid);
END

exec createfollowers @userid = 1 

CREATE PROCEDURE deletefollowers
  @userid INT,
  @followeruserid INT
AS
BEGIN
  DELETE FROM followers
  WHERE followeruserid = @followeruserid;
END 


create view getallfollowers
select 