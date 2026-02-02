--lisamine 3.kirjet korraga
INSERT INTO opilane(eesnimi, perenimi, synniaeg, kas_opib)
VALUES ('Vitalii', 'Sid', '2010-04-29', 0),
('Vitalii', 'Lavrov', '2010-04-29', 0),
('Vitalii', 'Nikitin', '2010-04-29', 0);
SELECT * from opilane;
--ühe kirja kustutamine
DELETE FROM opilane WHERE opilaneID=6; 
Select * from opilane;
--muudame tabeli ja lisame piirangu
ALTER TABLE opilane Alter column perenimi varchar(30) UNIQUE;
kirje uuendamine
SELECT * FROM opilane
UPDATE opilane SET aadress='Tallinn'
--WHERE opilaneID=4
SELECT * FROM opilane;
