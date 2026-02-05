CREATE DATABASE raamatAbdulov
use raamatAbdulov
--tabeli zanr loomine
CREATE TABLE zanr(
zanrID int PRIMARY KEY identity(1,1),
zanrNimetus varchar(50) UNIQUE,
kirjeldus TEXT
);

CREATE TABLE AUTOR(
autorID int PRIMARY KEY identity(1,1),
eesnimi varchar(50),
perenimi varchar(50) not null,
synniaasta int check(synniaasta >1900),
elukoht varchar(30)
);
Select * from AUTOR;
--tabeli täitmine
INSERT INTO AUTOR(eesnimi, perenimi, synniaasta, elukoht)
VALUES ('Eduard', 'Bornhöhe', 1920, 'Tallinn');

--tabeli uuendamine
UPDATE AUTOR set elukoht='Tallinn';

--kustutamine tabelist
DELETE FROM AUTOR Where autorID=1;

CREATE TABLE raamat(
raamatID int PRIMARY KEY identity(1,1),
raamatNimetus varchar(100) UNIQUE,
lk int,
autorID int
Foreign key (autorID) REFERENCES AUTOR(autorID),
zanrID int,
foreign key (zanrID) REFERENCES zanr(zanrID)
);
--drop table raamat;
Select * from autor;
Select * from zanr;

INSERT INTO raamat(raamatNimetus, lk, autorID, zanrID)
VALUES ('Oskar ja asjad', 200, 2, 3)

Select * from raamat;
