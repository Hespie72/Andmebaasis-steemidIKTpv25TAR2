--lisamine 3.kirjet korraga
INSERT INTO opilane(eesnimi, perenimi, synniaeg, kas_opib)
VALUES ('Vitalii', 'Sid', '2010-04-29', 0),
('Vitalii', 'Lavrov', '2010-04-29', 0),
('Vitalii', 'Nikitin', '2010-04-29', 0);
Select * from opilane;
--muudame tabeli ja lisame piirangu
ALTER TABLE opilane Alter column perenimi varchar(30) UNIQUE;
