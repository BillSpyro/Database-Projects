/*Youtube Application*/

/*Creating a Users Table and creating all of the
columns for the table.*/
CREATE TABLE Users (
  ID bigserial NOT NULL,
  Channel_Name varchar(100) UNIQUE,
  Password varchar(100) NOT NULL,
  Videos bigint,
  Subscribers bigint,
  Email varchar(100) UNIQUE,
  CONSTRAINT PK_User PRIMARY KEY (ID),
  CONSTRAINT Videos_Not_Negative CHECK (Videos >= 0),
  CONSTRAINT Subscribers_Not_Negative CHECK (Subscribers >= 0)
);

/*Creating a Categories Table and creating all of the
columns for the table.*/
CREATE TABLE Categories (
  ID bigserial NOT NULL,
  Name varchar(100) UNIQUE,
  Videos bigint,
  Subscribers bigint,
  Views bigint,
  CONSTRAINT PK_Category PRIMARY KEY (ID),
  CONSTRAINT Videos_Not_Negative CHECK (Videos >= 0),
  CONSTRAINT Subscribers_Not_Negative CHECK (Subscribers >= 0),
  CONSTRAINT Views_Not_Negative CHECK (Views >= 0)
);

/*Creating an Ads Table and creating all of the
columns for the table.*/
CREATE TABLE Ads (
  ID bigserial NOT NULL,
  Name varchar(100) UNIQUE,
  Amount bigint,
  CONSTRAINT PK_Ad PRIMARY KEY (ID),
  CONSTRAINT Amount_Not_Negative CHECK (Amount >= 0)
);

/*Creating a Videos Table and creating all of the
columns for the table.*/
CREATE TABLE Videos (
  ID bigserial NOT NULL,
  Comments bigint,
  Likes bigint,
  Dislikes bigint,
  Views bigint,
  Category_ID bigint NOT NULL,
  Ads boolean NOT NULL,
  Flags bigint,
  Copyrighted boolean NOT NULL,
  User_ID bigint NOT NULL,
  Name varchar(100) NOT NULL,
  CONSTRAINT PK_Video PRIMARY KEY (ID),
  /*The foreign key references ID in the User
  table. Each video must have a user attached
  to it. It is a one to many relationship, one
  user can have many videos, but one video can't
  be uploaded by many users.*/
  CONSTRAINT FK_User FOREIGN KEY (User_ID)
  REFERENCES Users(ID),
  /*The foreign key references ID in the Categories
  table. Each video must have a category attached
  to it. It is a one to many relationship, one
  category can have many videos, but one video can't
  have many categories.*/
  CONSTRAINT FK_Category FOREIGN KEY (Category_ID)
  REFERENCES Categories(ID),
  CONSTRAINT Comments_Not_Negative CHECK (Comments >= 0),
  CONSTRAINT Likes_Not_Negative CHECK (Likes >= 0),
  CONSTRAINT Dislikes_Not_Negative CHECK (Dislikes >= 0),
  CONSTRAINT Views_Not_Negative CHECK (Views >= 0),
  CONSTRAINT Flags_Not_Negative CHECK (Flags >= 0)
);

/*Creating a Join table between Videos and Ads.*/
CREATE TABLE Ads_Videos (
  ID text,
  Ad_ID bigint NOT NULL,
  Video_ID bigint NOT NULL,
  CONSTRAINT PK_Ads_Videos PRIMARY KEY (ID),
  /*The foreign key references ID in the Videos
  table. Each video can have an ad attached
  to it. It is a many to many relationship, many
  videos can have many ads, and many ads can be
  on many videos.*/
  CONSTRAINT FK_Video FOREIGN KEY (Video_ID)
  REFERENCES Videos(ID),
  /*The foreign key references ID in the Ads
  table. Each ad must be attached to a video
  if the video has ads. It is a many to many
  relationship, many videos can have many ads,
  and many ads can be on many videos.*/
  CONSTRAINT FK_Ad FOREIGN KEY (Ad_ID)
  REFERENCES Ads(ID)
);

/*Creating a Comments Table and creating all of the
columns for the table.*/
CREATE TABLE Comments (
  ID bigserial NOT NULL,
  User_ID bigint NOT NULL,
  Video_ID bigint NOT NULL,
  Likes bigint,
  Dislikes bigint,
  Replies bigint,
  Content varchar(1000) NOT NULL,
  CONSTRAINT PK_Comment PRIMARY KEY (ID),
  /*The foreign key references ID in the User
  table. Each comment must have a user attached
  to it. It is a one to many relationship, one
  user can have many comments, but one comment
  can't belong to many users.*/
  CONSTRAINT FK_User FOREIGN KEY (User_ID)
  REFERENCES Users(ID),
  /*The foreign key references ID in the User
  table. Each comment must have a video attached
  to it. It is a one to many relationship, one
  video can have many comments, but one comment
  can't be connect with many videos.*/
  CONSTRAINT FK_Video FOREIGN KEY (Video_ID)
  REFERENCES Videos(ID),
  CONSTRAINT Likes_Not_Negative CHECK (Likes >= 0),
  CONSTRAINT Dislikes_Not_Negative CHECK (Dislikes >= 0),
  CONSTRAINT Replies_Not_Negative CHECK (Replies >= 0)
);

/*Inserting relevant data into the Users table. The
data is about their channel for example, the channel name,
the password, how many videos they have, how many
subscribers they have, and their email address that
is connected.*/
INSERT INTO Users (Channel_Name, Password, Videos, Subscribers, Email)
VALUES ('CoolVideo', '******', 106, 8753, 'CoolVideo@gmail.com'),
       ('YoutubeNation', '********', 1204, 1575752, 'YoutubeNation@gmail.com'),
       ('DailyVlog', '*****', 783, 12552, 'DailyVlog@gmail.com'),
       ('Top10', '*********', 24301, 1519515, 'Top10@gmail.com'),
       ('NewsStation', '*********', 50041, 10050105, 'NewsStation@gmail.com'),
       ('SomeDude', '****', 0, 2, 'SomeDude@gmail.com'),
       ('NewUser', '******', 0, 0, 'NewUser@gmail.com');

/*Inserting relevant data into the Categories table. The
data is about the many categories for example, the
category name, how many videos the category has, how many
subscribers the category has, and how many views the
category has.*/
INSERT INTO Categories (Name, Videos, Subscribers, Views)
VALUES ('Gaming', 73535, 7889237, 8795927),
       ('News', 465125, 90250553, 436452532),
       ('Vlogs', 8463, 782357, 267826),
       ('Top10s', 980236, 3643945, 2352735),
       ('Events', 39683, 23587, 25728375),
       ('Music', 571274, 8517921, 51257125);

/*Inserting relevant data into the Ads table. The data is
about the ads for example, the name of the ad and how
many different ads that that particular ad has.*/
INSERT INTO Ads (Name, Amount)
VALUES ('Raid Shadow Legends', 2),
       ('Dollar Shave Club', 2),
       ('Apple', 5),
       ('Doritos', 9),
       ('Gillette', 4);

/*Inserting relevant data into the Videos table. The data is
about the videos for example, the amount of comments, likes,
dislikes, and views the video has, the category that the
video is associated with, if the video has ads or not, how
many flags the video has, if the video is copyrighted or not,
the user that the video is associated with, and the name of
the video.*/
INSERT INTO Videos (Comments, Likes, Dislikes, Views, Category_ID, Ads, Flags, Copyrighted, User_ID, Name)
VALUES (501, 604, 104, 1250, 1, TRUE, 0, FALSE, 1, 'Check this video!'),
       (432, 593, 83, 2503, 3, TRUE, 1, TRUE, 3, 'Vlog #85'),
       (74013, 9030, 546, 100502, 5, TRUE, 0, FALSE, 2, 'YoutubeNation Introduction'),
       (42, 10, 2, 140, 2, TRUE, 0, FALSE, 5, '2/2/2020 News'),
       (5125, 6085, 4039, 60353, 4, FALSE, 0, FALSE, 4, 'Top 10 Movies of 2019'),
       (7512, 74192, 812, 759123, 4, TRUE, 1, TRUE, 4, 'Top 10 Games of 2019'),
       (0, 0, 0, 0, 1, FALSE, 0, FALSE, 7, 'My First Video');

/*Inserting relevant data into the Ads_Videos join table. The
data is about the join table between Ads and Videos for example,
The ID that is specific to the relationship, and the specific ad
that is connected to the specific video.*/
INSERT INTO Ads_Videos (ID, Ad_ID, Video_ID)
VALUES ('1_1', 1, 1),
       ('1_6', 1, 6),
       ('2_1', 2, 1),
       ('2_4', 2, 4),
       ('3_3', 3, 3),
       ('5_2', 5, 2);

/*Inserting relevant data into the Comments table. The data is
about the comments for example, the user that the comment is
associated with, the video that the comment is associated with,
how many likes, dislikes, and replies the comment has, and the
content of text that will be displayed as the comment.*/
INSERT INTO Comments (User_ID, Video_ID, Likes, Dislikes, Replies, Content)
VALUES (3, 1, 43, 2, 5, 'This video sucks!'),
       (2, 1, 3, 74, 29, 'I found it interesting.'),
       (1, 5, 823, 203, 107, 'I really disagree with this top 10 list.'),
       (3, 3, 741, 104, 7, 'This is really informative.'),
       (4, 5, 6214, 2043, 641, 'I hope you guys liked this list.'),
       (6, 6, 25, 1, 2, 'I love this top 10 list.'),
       (6, 5, 75, 4, 5, 'Why did Joker not make the list?');
