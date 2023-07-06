---use social


--creating a user
create procedure createuser
@firstname varchar(100),
@lastname varchar(100),
@username varchar(100),
@email varchar(100),
@password varchar(100),
@imageurl varchar(400)

as 
BEGIN
insert into users(firstname,lastname,username,email,password,imageurl)
values 
(@firstname,@lastname,@username,@email,@password,@imageurl)

end

EXEC createuser @firstname = 'dave', @lastname='mwaki', @username='mwakidavis', @email='mwakidavis89@gmail.com', @password= "mwaki123", @imageurl='https://images.unsplash.com/photo-1497316730643-415fac54a2af?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80';

select * from users

-- deleting all data of a user

create procedure deleteuser
@userid int 
as 
begin 
delete from users where userid = @userid
end


-- updating a profile picture

create procedure updateuserprofile
@userid int,
@username varchar(100),
@firstname varchar(100),
@lastname varchar(100)
as
begin
update users
set username= @username,
    firstname = @firstname,
    lastname = @lastname
end


--updating the profile picture
CREATE PROCEDURE updateprofilepic
  @userid INT,
  @imageurl VARCHAR(400)
AS
BEGIN
  UPDATE users
  SET imageurl = @imageurl
  WHERE userid = @userid;
END

-- a trigger to notify when a new users and his/her details which are inserted

CREATE TRIGGER notification_trigger ON users
 AFTER INSERT
  AS
   BEGIN
    DECLARE @firstname VARCHAR(100),
     @lastname VARCHAR(100)
     , @username VARCHAR(100),
      @email VARCHAR(100),
       @password VARCHAR(100),
        @imageurl VARCHAR(100)


        SELECT @firstname = firstname,
       @lastname = lastname,
       @username = username,
       @email = email,
       @password = password,
       @imageurl = imageurl
FROM inserted

end












create trigger notification
on users
after insert

as
begin
declare @firstname,
declare @lastname,
declare @username,
declare@email,
declare@password,
declare@imageurl

select * on inserted from users
end