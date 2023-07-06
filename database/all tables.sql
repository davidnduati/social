--use social

create table users
(
    userid int identity(1,1) primary key,
    firstname varchar(100),
    lastname varchar(100),
    username varchar(100),
    email varchar(100),
    password varchar(100),
    imageurl varchar(400),
    datecreated datetime
);

select *
from users;

create table posts
(
    postid int identity(1,1) primary key,
    userid int foreign key references users(userid),
    content varchar(600),
    datecreated datetime
);

select *
from posts;

create table comments
(
    commentid int identity(1,1) primary key,
    postid int foreign key references posts(postid),
    userid int foreign key references users(userid),
    content varchar(600),
    datecreated datetime
);

select *
from comments;

create table likes
(
    likesid int identity(1,1) primary key,
    postid int foreign key references posts(postid),
    countlikes int,
    userid int foreign key references users(userid),
    datecreated datetime
);

select *
from likes;

create table followers
(
    followerid int identity(1,1) primary key,
    userid int foreign key references users(userid),
    followeruserid int foreign key references users(userid),
    datecreated datetime
);

select *
from followers;


alter table posts
add contentimageurl varchar(300),
contentvideourl varchar(300);




alter table comments
add contentimageurl varchar(300),
contentvideourl varchar(300);

CREATE TABLE replies (
  replyid INT PRIMARY KEY,
  commentid INT,
  userid INT,
  replytext VARCHAR(255),
  replydate DATETIME,
  FOREIGN KEY (commentid) REFERENCES comments(commentid),
  FOREIGN KEY (userid) REFERENCES users(userid)
);

-- a stored procedure for insertina reply
CREATE PROCEDURE InsertReply
  @commentid INT,
  @userid INT,
  @replytext VARCHAR(255),
  @replydate DATETIME
AS
BEGIN
  INSERT INTO replies (commentid, userid, replytext, replydate)
  VALUES (@commentid, @userid, @replytext, @replydate);
END


EXEC InsertReply @commentid = 1, @userid = 1, @replytext = 'This is a reply', @replydate = GETDATE();
