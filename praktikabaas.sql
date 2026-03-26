Create database praktiAbdulov
use praktiAbdulov

--loomine tabel
CREATE TABLE firma(
    firmaID INT NOT NULL PRIMARY KEY Identity(1,1),
    firmanimi VARCHAR(20),
    aadress VARCHAR(20),
    telefon VARCHAR(20)
);

--loomine tabel praktikajuhendaja Ise
CREATE TABLE praktikajuhendaja(
praktikajuhendajaID int Primary key identity(1,1),
eesnimi VARCHAR(20),
perekonnanimi VARCHAR(20),
synniaeg date,
telefon varchar(7)
);

--loomine 3 tabeli
CREATE TABLE praktikabaas(
    praktikabaasID INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    firmaID INT,
    praktikatingimused VARCHAR(20),
    arvutiprogramm VARCHAR(20),
    juhendajaID INT,
    FOREIGN KEY (firmaID) REFERENCES firma(firmaID),
    FOREIGN KEY (juhendajaID) REFERENCES praktikajuhendaja(praktikajuhendajaID)
);

INSERT INTO firma (firmanimi, aadress, telefon) VALUES
('TechSoft', 'Tallinn', '5551111'),
('DataPro', 'Tartu', '5552222'),
('NetGroup', 'Narva', '5553333'),
('CodeLab', 'Parnu', '5554444'),
('InfoSys', 'Viljandi', '5555555');

INSERT INTO praktikajuhendaja (eesnimi, perekonnanimi, synniaeg, telefon) VALUES
('Vitalii', 'Abdulov', '2010-04-29', 5123456),
('Mari', 'Kask', '1985-08-23', 5234567),
('Peeter', 'Saar', '1978-11-02', 5345678),
('Kati', 'Lepp', '1990-03-15', 5456789),
('Toomas', 'Kukk', '1982-07-30', 5567890);

INSERT INTO praktikabaas (firmaID, praktikatingimused, arvutiprogramm, juhendajaID) VALUES
(1, 'Hea', 'MS Office', 1),
(2, 'Rahuldav', 'Python', 2),
(3, 'Vaga hea', 'Java', 3),
(4, 'Hea', 'C#', 4),
(5, 'Suureparane', 'SQL', 5);

select * from firma;
select * from praktikajuhendaja;
select * from praktikabaas;

SELECT * FROM firma
WHERE firmanimi LIKE '%a%';

SELECT *
FROM praktikabaas, firma
WHERE firma.firmaID = praktikabaas.firmaID
ORDER BY firmanimi;

SELECT firmanimi, COUNT(praktikabaasID) AS kogus
FROM praktikabaas, firma
WHERE firma.firmaID = praktikabaas.firmaID
GROUP BY firmanimi;

SELECT *
FROM praktikajuhendaja
WHERE MONTH(synniaeg) = 9 
   OR MONTH(synniaeg) = 10 
   OR MONTH(synniaeg) = 11;

SELECT *
FROM praktikajuhendaja
WHERE MONTH(synniaeg) IN (9, 10, 11);

SELECT pj.eesnimi, pj.perekonnanimi, COUNT(pb.praktikabaasID) AS praktikate_arv FROM praktikajuhendaja pj
LEFT JOIN praktikabaas pb ON pj.praktikajuhendajaID = pb.juhendajaID
GROUP BY pj.eesnimi, pj.perekonnanimi;

--loomine uus column
ALTER TABLE praktikajuhendaja
ADD palk DECIMAL(10,2);

--lisa uus info palk
UPDATE praktikajuhendaja SET palk = 1200 WHERE praktikajuhendajaID = 1;
UPDATE praktikajuhendaja SET palk = 1400 WHERE praktikajuhendajaID = 2;
UPDATE praktikajuhendaja SET palk = 1300 WHERE praktikajuhendajaID = 3;
UPDATE praktikajuhendaja SET palk = 1500 WHERE praktikajuhendajaID = 4;
UPDATE praktikajuhendaja SET palk = 1600 WHERE praktikajuhendajaID = 5;

--näide keskmine palk
SELECT AVG(palk) AS keskmine_palk
FROM praktikajuhendaja;

--näide sum palk
SELECT SUM(palk) AS sum_palk
FROM praktikajuhendaja;

--ise päring
SELECT eesnimi, perekonnanimi FROM praktikajuhendaja
Where palk Between 1200 and 1400;
--loomine vaade (3)
CREATE VIEW NäideFirmaPraktika AS
SELECT f.firmanimi, COUNT(p.praktikabaasID) AS kogus
FROM firma f
LEFT JOIN praktikabaas p ON f.firmaID = p.firmaID
GROUP BY f.firmanimi;

Select * from NäideFirmaPraktika
--loomine teise vaade (4)
CREATE VIEW VaadeSugiselSynniaastaJuhendajad AS 
SELECT * from praktikajuhendaja
Where MONTH(synniaeg) = 09 or
	MONTH(synniaeg) = 10 or
	MONTH(synniaeg) = 11;

select * from VaadeSuviSynniaastaJuhendajad

drop VaadeSugiselSynniaastaJuhendajad
