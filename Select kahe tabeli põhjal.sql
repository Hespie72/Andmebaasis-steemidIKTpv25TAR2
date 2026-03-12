CREATE DATABASE select2tabeliAbd;
Use select2tabeliAbd;
--laps/loom tabelid
CREATE TABLE laps(
    lapsID int not null PRIMARY KEY Identity(1,1),
    nimi varchar(40) not null,
    pikkus smallint,
    synniaasta int null,
    synnilinn varchar(15)
    )
Insert Into laps(nimi, pikkus, synniaasta, synnilinn)
values ('Kirill', 156, 2005, 'Tallinn'),('Oleg', 183, 2009, 'Tallinn'), ('Vlad', 186, 2008, 'Tartu'), ('Denis', 176, 2010, 'Tartu'), ('Nikita', 158, 2002, 'Tallinn')
select * from laps;
CREATE TABLE loom(

    loomID int not null PRIMARY KEY IDENTITY(1,1),
    nimi varchar(40) not null,
    kaal smallint,
    lapsID int,
    FOREIGN KEY (lapsID) REFERENCES laps(lapsID)  --вставляем название таблицы и на что ссылается
)

Insert Into loom(nimi, kaal, lapsID)
values ('kass Vasili', 5, 3),
('kass Barsik', 6, 2), 
('koer Sharik', 12, 4), 
('koer Bobik', 10, 1)
select * from loom

--Alias-mimede kasutamine
SELECT l.nimi, l.kaal from loom as l;

--sisemine ühendamine
SELECT * FROM laps,loom; --nii ei tohi kirjutada, sest 1 tabeli kirjed korrutakse 2.tabeli kirjaga

--õige päring
SELECT * FROM laps, loom
where loom.lapsID=laps.lapsID
--sama päring alia-nimedega
SELECT * FROM laps as lp, loom as l
where l.lapsID=lp.lapsID

--kitsendame päringu
SELECT lp.nimi as lapsenimi, l.nimi as loomnimi, l.kaal, lp.synnilinn
FROM laps as lp, loom as l
where l.lapsID=lp.lapsID

--INNER JOIN ühendamine 
SELECT * FROM laps INNER JOIN loom
ON loom.lapsID=laps.lapsID

--ALIAS-NIMEDEGA
SELECT lp.nimi as lapsenimi, l.nimi as loomnimi, l.kaal, lp.synnilinn
FROM laps as lp INNER JOIN loom as l
ON l.lapsID=lp.lapsID

--LEFT JOIN
SELECT lp.nimi AS lapsenimi, l.nimi AS loomanimi, l.kaal, lp.synnilinn
FROM laps AS lp LEFT JOIN loom AS l
ON l.lapsID = lp.lapsID;


--RIGHT JOIN
SELECT lp.nimi AS lapsenimi, l.nimi AS loomanimi, l.kaal, lp.synnilinn
FROM laps AS lp RIGHT JOIN loom AS l
ON l.lapsID = lp.lapsID;

--CROSS JOIN
SELECT lp.nimi AS lapsenimi, l.nimi AS loomanimi, l.kaal, lp.synnilinn
FROM laps AS lp cross join loom AS l

--creaete table varjupaik
CREATE TABLE varjupaik(
	varjupaikID int not null PRIMARY KEY identity(1,1),
	koht varchar(50) not null,
	firma varchar(30))
ALTER TABLE loom add varjupaikID int;
ALTER TABLE loom add constraint fk_varjupaik
foreign key(varjupaikID) references varjupaik(varjupaikID);

INSERT INTO varjupaik(koht, firma)
Values ('Paljassaare', 'Varjupaikade MTÜ');
select * from varjupaik;
update loom set varjupaikID=1;
select * from loom


--select 3 /mitme tabelite põhjal
SELECT lp.nimi as lapsenimi, l.nimi as loomanimi, v.koht
FROM laps as lp, loom as l, varjupaik as v
where l.lapsID=lp.lapsID and l.varjupaikID=v.varjupaikID;

--sama inner joiniga
SELECT lp.nimi as lapsenimi, l.nimi as loomanimi, v.koht
FROM (laps as lp inner join loom as l
ON l.lapsID=lp.lapsID) inner join varjupaik as v
ON l.varjupaikID=v.varjupaikID;
