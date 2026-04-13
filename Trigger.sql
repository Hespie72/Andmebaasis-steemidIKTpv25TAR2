CREATE DATABASE VitaliiTr
use VitaliiTr
--tabel linnad
CREATE TABLE linnad(
linnId int primary key identity(1,1),
linnanimi varchar(50) unique,
rahvaarv int not null);
--tabel logi
CREATE TABLE logi(
Id int primary key identity(1,1),
kuupaev datetime,
andmed TEXT);
--Insert Triger
CREATE TRIGGER linnaLisamine
ON linnad
FOR INSERT
AS 
INSERT INTO logi(kuupaev, andmed)
SELECT
GETDATE(), inserted.linnanimi
from inserted;
--kontollimiseks tuleb lisada uus linn tabelisse linnad
INSERT INTO linnad(linnanimi, rahvaarv)
VALUES ('Keila', 60000);
SELECT * FROM linnad;
SELECT * FROM logi;

--kustutame triger
DROP TRIGGER linnaLisamine

CREATE TRIGGER linnaLisamine
ON linnad
FOR INSERT
AS 
INSERT INTO logi(kuupaev, andmed)
SELECT
GETDATE(),
CONCAT('Lisatud linn: ', inserted.linnanimi,' | rahvaarv: ', inserted.rahvaarv, ' | id: ', inserted.linnId)
from inserted;
-- DELETE TRIGGER
CREATE TRIGGER linnaKustutamine
ON linnad
FOR DELETE
AS 
INSERT INTO logi(kuupaev, andmed)
SELECT
GETDATE(),
CONCAT('Kustatud linn: ', deleted.linnanimi,' | rahvaarv: ', deleted.rahvaarv, ' | id: ', deleted.linnId)
from deleted;

delete from linnad WHERE linnId=1;
SELECT * FROM linnad
SELECT * FROM logi

--UPDATE TRIGGER
CREATE TRIGGER linnaUuendamine
ON linnad
FOR UPDATE
AS
INSERT INTO logi(kuupaev, andmed)
SELECT
GETDATE(),
CONCAT('vana linna andmed: ', d.linnanimi,' |  ', d.rahvaarv, ' | id: ', d.linnId,
' | uued linna andmed: ', i.linnanimi,' |  ', i.rahvaarv, ' | id: ', i.linnId)
from deleted d INNER JOIN inserted i
ON d.linnId=i.linnId;
DROP TRIGGER linnaUuendamine
--kontrollimiseks uuendamine linna andmed
SELECT * FROM linnad
UPDATE linnad SET linnanimi='Tapa uus', rahvaarv=25000
WHERE linnId=2
SELECT * FROM linnad
SELECT * FROM logi

--lisame kasutajaNimi logi tabelisse

ALTER TABLE logi ADD kasutaja varchar(40);
