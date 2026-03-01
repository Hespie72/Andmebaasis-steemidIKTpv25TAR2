CREATE DATABASE Vit;
USE Vit;

CREATE TABLE Users (
UserID INT IDENTITY(1,1) PRIMARY KEY,
FirstName NVARCHAR(50) NOT NULL,
LastName NVARCHAR(50) NOT NULL,
Email NVARCHAR(100) UNIQUE NOT NULL
);

INSERT INTO Users (FirstName, LastName, Email)
VALUES 
('Ivan', 'Petrov', 'ivan@mail.com'),
('Anna', 'Smirnova', 'anna@mail.com'),
('Pavel', 'Ivanov', 'pavel@mail.com');



SELECT * FROM Users;



INSERT INTO Users (FirstName, LastName, Email)
VALUES ('Maria', 'Kuznetsova', 'maria@mail.com');

SELECT * FROM Users;

CREATE TABLE Orders (
OrderID INT IDENTITY(1,1) NOT NULL,
UserID INT NOT NULL,
OrderDate DATE NOT NULL,
FOREIGN KEY (UserID) REFERENCES Users(UserID)
);
