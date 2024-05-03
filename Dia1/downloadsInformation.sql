CREATE DATABASE DownloadsInformation;

USE DownloadsInformation;

CREATE TABLE USERS(
    UserID  INT   PRIMARY KEY   ,
    EmailAddress VARCHAR(255)   NOT NULL UNIQUE,
    FirstName VARCHAR(255)   NOT NULL,
    LastName VARCHAR(255)   NOT NULL
);

INSERT INTO USERS VALUES
(1, 'user1@example.com',"German","Lopez"),
(2, 'user2@example.com',"Martinez","Lopez"),
(3, 'user3@example.com',"Carlos","Villalobos"), 
(4, 'user4@example.com',"Luis","Perez"),
(5, 'user5@example.com',"Ana","Noguera");

CREATE TABLE PRODUCTS(
    ProductID   INT    PRIMARY KEY ,
    Name VARCHAR(255)   NOT NULL
);

INSERT INTO PRODUCTS  VALUES
(1, 'cancion1.mp4'),
(2, 'cancion2.mp4'),
(3, 'pdf1.pdf'), 
(4, 'notas.txt'),
(5, 'pdf2.pdf');
CREATE TABLE DOWNLOADS(
    DownloadID  INT   PRIMARY KEY   ,
    FileName VARCHAR(255)   NOT NULL,
    downloadDate DATETIME   NOT NULL,
    UserID  INT,
    ProductID   INT,
    FOREIGN KEY (UserID) REFERENCES USERS(UserID),
    FOREIGN KEY (ProductID) REFERENCES PRODUCTS(ProductID)
);

INSERT INTO DOWNLOADS  VALUES
(1, 'cancion1.mp4',"2023-04-26",1,1),
(2, 'cancion2.mp4',"2023-04-27",2,2),
(3, 'pdf1.pdf',"2023-04-28",3,3), 
(4, 'notas.txt',"2023-04-29",4,4),
(5, 'pdf2.pdf',"2023-04-30",5,5);
