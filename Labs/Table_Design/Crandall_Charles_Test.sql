/*Youtube*/

/*Creating a Users Table and creating all of the
columns for the table*/
CREATE TABLE Users (
  ID bigserial NOT NULL,
  Channel_Name varchar(100) UNIQUE,
  Password varchar(100) NOT NULL,
  Videos bigint NOT NULL,
  Subscribers bigint NOT NULL,
  Email varchar(100) UNIQUE,
  CONSTRAINT PK_User PRIMARY KEY (ID)
);

/*Creating a Categories Table and creating all of the
columns for the table*/
CREATE TABLE Categories (
  ID bigserial NOT NULL,
  Name varchar(100) UNIQUE,
  Videos bigint NOT NULL,
  Subscribers bigint NOT NULL,
  Views bigint NOT NULL,
  CONSTRAINT PK_Category PRIMARY KEY (ID)
);

/*Creating an Ads Table and creating all of the
columns for the table*/
CREATE TABLE Ads (
  ID bigserial NOT NULL,
  Name varchar(100) UNIQUE,
  Amount bigint NOT NULL,
  CONSTRAINT PK_Ad PRIMARY KEY (ID)
);

/*Creating a Videos Table and creating all of the
columns for the table*/
CREATE TABLE Videos (
  ID bigserial NOT NULL,
  Comments varchar(100) NOT NULL,
  Likes bigint NOT NULL,
  Dislikes bigint NOT NULL,
  Views bigint NOT NULL,
  Category_ID bigint NOT NULL,
  Ad_ID bigint NOT NULL,
  Flags int NOT NULL,
  Copyrighted boolean NOT NULL,
  User_ID bigint NOT NULL,
  Name varchar(100) NOT NULL,
  CONSTRAINT PK_Video PRIMARY KEY (ID),
  /*The foreign key references ID in the User
  table. Each video must have a user attached
  to it.*/
  CONSTRAINT FK_User FOREIGN KEY (User_ID)
  REFERENCES Users(ID),
  /*The foreign key references ID in the Categories
  table. Each video must have a category attached
  to it.*/
  CONSTRAINT FK_Category FOREIGN KEY (Category_ID)
  REFERENCES Categories(ID),
  /*The foregin key references ID in the Ads table.
  Each video could or could not have an Ad attached.*/
  CONSTRAINT FK_Ad FOREIGN KEY (Ad_ID)
  REFERENCES Ads(ID)
);

/*Creating a Comments Table and creating all of the
columns for the table*/
CREATE TABLE Comments (
  ID bigserial NOT NULL,
  User_ID bigint NOT NULL,
  Video_ID bigint NOT NULL,
  Likes bigint NOT NULL,
  Dislikes bigint NOT NULL,
  Replies bigint NOT NULL,
  Content varchar(1000) NOT NULL,
  CONSTRAINT PK_Comment PRIMARY KEY (ID),
  /*The foreign key references ID in the User
  table. Each comment must have a user attached
  to it.*/
  CONSTRAINT FK_User FOREIGN KEY (User_ID)
  REFERENCES Users(ID),
  /*The foreign key references ID in the User
  table. Each comment must have a video attached
  to it.*/
  CONSTRAINT FK_Video FOREIGN KEY (Video_ID)
  REFERENCES Videos(ID)
);

/*
CREATE TABLE Premium (

)

CREATE TABLE Billing (

)
*/

INSERT INTO Users (Channel_Name, Password, Videos, Subscribers, Email)
VALUES ('CoolVideo', '******', 106, 8753, 'CoolVideo@gmail.com'),
       ('YoutubeNation', '********', 1204, 1575752, 'YoutubeNation@gmail.com'),
       ('DailyVlog', '*****', 783, 12552, 'DailyVlog@gmail.com'),
       ('Top10', '*********', 24301, 1519515, 'Top10@gmail.com'),
       ('NewsStation', '*********', 50041, 10050105, 'NewsStation@gmail.com'),
       ('SomeDude', '****', 0, 2, 'SomeDude@gmail.com');


INSERT INTO Categories (Name, Videos, Subscribers, Views)
VALUES ('Gaming', 73535, 7889237, 8795927),
       ('News', 465125, 90250553, 436452532),
       ('Vlogs', 8463, 782357, 267826),
       ('Top10s', 980236, 3643945, 2352735),
       ('Events', 39683, 23587, 25728375),
       ('Music', 571274, 8517921, 51257125);

INSERT INTO Ads (Name, Amount)
VALUES ('Raid Shadow Legends', 2),
       ('Dollar Shave Club', 2),
       ('Apple', 5),
       ('Doritos', 9),
       ('Gillette', 4);

INSERT INTO Videos (Comments, Likes, Dislikes, Views, Category_ID, Ad_ID, Flags, Copyrighted, User_ID, Name)
VALUES (501, 604, 104, 1250, 1, 2, 0, FALSE, 1, 'Check this video!'),
       (432, 593, 83, 2503, 5, 4, 1, TRUE, 3, 'Vlog #85'),
       (74013, 9030, 546, 100502, 3, 3, 0, FALSE, 2, 'YoutubeNation Introduction'),
       (42, 10, 2, 140, 2, 4, 0, FALSE, 5, '2/2/2020 News'),
       (5125, 6085, 4039, 60353, 4, 1, 0, FALSE, 4, 'Top 10 Movies of 2019'),
       (7512, 74192, 812, 759123, 4, 1, 1, TRUE, 4, 'Top 10 Games of 2019');

INSERT INTO Comments (User_ID, Video_ID, Likes, Dislikes, Replies, Content)
VALUES (3, 1, 43, 2, 5, 'This video sucks!'),
       (2, 1, 3, 74, 29, 'I found it interesting.'),
       (1, 5, 823, 203, 107, 'I really disagree with this top 10 list.'),
       (3, 3, 741, 104, 7, 'This is really informative.'),
       (4, 5, 6214, 2043, 641, 'I hope you guys liked this list.'),
       (6, 6, 25, 1, 2, 'I love this top 10 list.'),
       (6, 5, 75, 4, 5, 'Why did Joker not make the list?');
