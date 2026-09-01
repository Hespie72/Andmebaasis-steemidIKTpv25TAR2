--connect to DB - (localdb)\MSSQLLocalDB

use kordamineIKT25
create TABLE opilane(
opilane int PRIMARY KEY identity(1,1),
nimi varchar(50),
isikukood char(11) not null,
ryhmId int)

create TABLE ryhm(
ryhmId int Primary Key identity(1,1),
ryhmNimi char(10) Unique,
opilasteArv int)

--tabeli kustutamine
DROP TABLE ...;

--valisvõti - FK
ALTER TABLE opilane ADD Foreign key (ryhmId) REFERENCES ryhm(ryhmId);


--õiguste määramine varem tehtud kasutajale
GRANT SELECT TO Vitalii; --saab vaadata kõik tabeleid
GRANT INSERT ON opilane TO Vitalii; --saab lisada ainult tabelisse opilane

DENY DELETE TO Vitalii;


--User Vitalii
Select * from opilane, ryhm
Where opilane.ryhmId=ryhm.ryhmId;

DELETE FROM opilane;

INSERT INTO opilane Values ('Nikita','12325232387',1);
