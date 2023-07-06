CREATE PROCEDURE loginfunctionality
  @username varchar(100),
  @password varchar(100)
AS
BEGIN
  IF EXISTS (SELECT 1 FROM users WHERE username = @username)
  BEGIN
    IF EXISTS (SELECT 1 FROM users WHERE username = @username AND password = @password)
    BEGIN
      PRINT 'Login successful'
    END
    ELSE
    BEGIN
      PRINT 'Incorrect password'
    END
  END
  ELSE
  BEGIN
    PRINT 'Username does not exist'
  END
END



EXEC loginfunctionality @username = 'mwakidavis', @password = 'mwaki123';


-- in the posts type to add media type


alter table posts
add contentimageurl varchar(300),
contentvideourl varchar(300);

alter table posts
add mediatype varchar(100)

alter table comments
add contentimageurl varchar(300),
contentvideourl varchar(300),
mediattype varchar(100);

--for searching
CREATE PROCEDURE searchuser
  @username varchar(100)
AS
BEGIN
  SELECT username
  FROM users
  WHERE username LIKE '%' + @username + '%'
END

EXEC searchuser @username = 'mwakidavis';

use social