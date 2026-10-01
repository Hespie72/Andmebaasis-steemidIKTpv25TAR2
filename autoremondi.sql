create database autoremondiAbdulov
use autoremondiAbdulov

-- Created by Redgate Data Modeler (https://datamodeler.redgate-platform.com)
-- Last modification date: 2026-10-01 09:46:13.806

-- tables
-- Table: amet
CREATE TABLE amet (
    ametID int  NOT NULL IDENTITY,
    nimetus varchar(30)  NOT NULL,
    kirjeldus text  NOT NULL,
    CONSTRAINT amet_pk PRIMARY KEY  (ametID)
);

-- Table: ametimaaratus
CREATE TABLE ametimaaratus (
    ametimaaratusID int  NOT NULL IDENTITY,
    tootajaID int  NOT NULL,
    ametID int  NOT NULL,
    alguskuupaev date  NOT NULL,
    CONSTRAINT ametimaaratus_pk PRIMARY KEY  (ametimaaratusID)
);

-- Table: arve
CREATE TABLE arve (
    arveID int  NOT NULL IDENTITY,
    remonditooID int  NOT NULL,
    kuupaev date  NOT NULL,
    maksmiseTahtaeg date  NOT NULL,
    status varchar(50)  NOT NULL,
    CONSTRAINT arve_pk PRIMARY KEY  (arveID)
);

-- Table: arveRida
CREATE TABLE arveRida (
    arveridaID int  NOT NULL IDENTITY,
    arveID int  NOT NULL,
    varuosaremondisID int  NOT NULL,
    kirjeldus text  NOT NULL,
    kogus int  NOT NULL,
    uhikuhind money  NOT NULL,
    CONSTRAINT arveRida_pk PRIMARY KEY  (arveridaID)
);

-- Table: auto
CREATE TABLE auto (
    RegNumber char(7)  NOT NULL,
    mark varchar(75)  NOT NULL,
    mudel varchar(50)  NOT NULL,
    valmistamisaasta int  NOT NULL,
    labisoit int  NOT NULL,
    CONSTRAINT auto_pk PRIMARY KEY  (RegNumber)
);

-- Table: kategooria
CREATE TABLE kategooria (
    kategooriaID int  NOT NULL IDENTITY,
    kategooria varchar(50)  NOT NULL,
    kirjeldus text  NOT NULL,
    kestvus int  NOT NULL,
    CONSTRAINT kategooria_pk PRIMARY KEY  (kategooriaID)
);

-- Table: kliendiauto
CREATE TABLE kliendiauto (
    klientiautoID int  NOT NULL IDENTITY,
    klientID int  NOT NULL,
    RegNumber char(7)  NOT NULL,
    kuupaev date  NOT NULL,
    CONSTRAINT kliendiauto_pk PRIMARY KEY  (klientiautoID)
);

-- Table: klient
CREATE TABLE klient (
    klientID int  NOT NULL IDENTITY,
    nimi varchar(30)  NULL,
    tel varchar(12)  NOT NULL,
    epost varchar(75)  NOT NULL,
    CONSTRAINT klient_pk PRIMARY KEY  (klientID)
);

-- Table: ladu
CREATE TABLE ladu (
    laduID int  NOT NULL IDENTITY,
    nimetus varchar(50)  NOT NULL,
    aadress varchar(50)  NOT NULL,
    CONSTRAINT ladu_pk PRIMARY KEY  (laduID)
);

-- Table: laduVaruosa
CREATE TABLE laduVaruosa (
    laduvaruosaID int  NOT NULL IDENTITY,
    varuosaID int  NOT NULL,
    laduID int  NOT NULL,
    kogus int  NOT NULL,
    CONSTRAINT laduVaruosa_pk PRIMARY KEY  (laduvaruosaID)
);

-- Table: remonditoo
CREATE TABLE remonditoo (
    remonditooID int  NOT NULL IDENTITY,
    kuupaev date  NOT NULL,
    kategooria varchar(50)  NOT NULL,
    kirjeldus text  NOT NULL,
    RegNumber char(7)  NOT NULL,
    CONSTRAINT remonditoo_pk PRIMARY KEY  (remonditooID)
);

-- Table: tarneVaruosa
CREATE TABLE tarneVaruosa (
    tarnevaruosaID int  NOT NULL IDENTITY,
    tarnijaID int  NOT NULL,
    varuosaID int  NOT NULL,
    kogus int  NOT NULL,
    CONSTRAINT tarneVaruosa_pk PRIMARY KEY  (tarnevaruosaID)
);

-- Table: tarnija
CREATE TABLE tarnija (
    tarnijaID int  NOT NULL IDENTITY,
    nimetus varchar(50)  NOT NULL,
    kontakt varchar(12)  NOT NULL,
    aadress varchar(75)  NOT NULL,
    CONSTRAINT tarnija_pk PRIMARY KEY  (tarnijaID)
);

-- Table: tootaja
CREATE TABLE tootaja (
    tootajaID int  NOT NULL IDENTITY,
    nimi varchar(30)  NULL,
    isikukood varchar(11)  NOT NULL,
    tel varchar(12)  NOT NULL,
    aadress varchar(100)  NOT NULL DEFAULT 'Tallinn',
    CONSTRAINT tootaja_pk PRIMARY KEY  (tootajaID)
);

-- Table: tootajaremondis
CREATE TABLE tootajaremondis (
    tootajaremondiID int  NOT NULL IDENTITY,
    remonditooID int  NOT NULL,
    tootajaID int  NOT NULL,
    status varchar(50)  NOT NULL,
    CONSTRAINT tootajaremondis_pk PRIMARY KEY  (tootajaremondiID)
);

-- Table: varuosa
CREATE TABLE varuosa (
    varuosaID int  NOT NULL IDENTITY,
    nimetus varchar(50)  NOT NULL,
    tooja varchar(50)  NOT NULL,
    hind money  NOT NULL,
    CONSTRAINT varuosa_pk PRIMARY KEY  (varuosaID)
);

-- Table: varuosaRemondis
CREATE TABLE varuosaRemondis (
    varuosaremondisID int  NOT NULL IDENTITY,
    laduvaruosaID int  NOT NULL,
    remonditooID int  NOT NULL,
    kogus int  NOT NULL,
    CONSTRAINT varuosaRemondis_pk PRIMARY KEY  (varuosaremondisID)
);

-- foreign keys
-- Reference: Table_6_klient (table: kliendiauto)
ALTER TABLE kliendiauto ADD CONSTRAINT Table_6_klient
    FOREIGN KEY (klientID)
    REFERENCES klient (klientID);

-- Reference: Tableauto (table: kliendiauto)
ALTER TABLE kliendiauto ADD CONSTRAINT Tableauto
    FOREIGN KEY (RegNumber)
    REFERENCES auto (RegNumber);

-- Reference: ametimaaratus_amet (table: ametimaaratus)
ALTER TABLE ametimaaratus ADD CONSTRAINT ametimaaratus_amet
    FOREIGN KEY (ametID)
    REFERENCES amet (ametID);

-- Reference: ametimaaratus_tootaja (table: ametimaaratus)
ALTER TABLE ametimaaratus ADD CONSTRAINT ametimaaratus_tootaja
    FOREIGN KEY (tootajaID)
    REFERENCES tootaja (tootajaID);

-- Reference: arveRida_arve (table: arveRida)
ALTER TABLE arveRida ADD CONSTRAINT arveRida_arve
    FOREIGN KEY (arveID)
    REFERENCES arve (arveID);

-- Reference: arveRida_varuosaRemondis (table: arveRida)
ALTER TABLE arveRida ADD CONSTRAINT arveRida_varuosaRemondis
    FOREIGN KEY (varuosaremondisID)
    REFERENCES varuosaRemondis (varuosaremondisID);

-- Reference: arve_remonditoo (table: arve)
ALTER TABLE arve ADD CONSTRAINT arve_remonditoo
    FOREIGN KEY (remonditooID)
    REFERENCES remonditoo (remonditooID);

-- Reference: laduVaruosa_ladu (table: laduVaruosa)
ALTER TABLE laduVaruosa ADD CONSTRAINT laduVaruosa_ladu
    FOREIGN KEY (laduID)
    REFERENCES ladu (laduID);

-- Reference: laduVaruosa_varuosa (table: laduVaruosa)
ALTER TABLE laduVaruosa ADD CONSTRAINT laduVaruosa_varuosa
    FOREIGN KEY (varuosaID)
    REFERENCES varuosa (varuosaID);

-- Reference: remonditoo_auto (table: remonditoo)
ALTER TABLE remonditoo ADD CONSTRAINT remonditoo_auto
    FOREIGN KEY (RegNumber)
    REFERENCES auto (RegNumber);

-- Reference: tarneVaruosa_tarnija (table: tarneVaruosa)
ALTER TABLE tarneVaruosa ADD CONSTRAINT tarneVaruosa_tarnija
    FOREIGN KEY (tarnijaID)
    REFERENCES tarnija (tarnijaID);

-- Reference: tarneVaruosa_varuosa (table: tarneVaruosa)
ALTER TABLE tarneVaruosa ADD CONSTRAINT tarneVaruosa_varuosa
    FOREIGN KEY (varuosaID)
    REFERENCES varuosa (varuosaID);

-- Reference: tootajaremondis_remonditoo (table: tootajaremondis)
ALTER TABLE tootajaremondis ADD CONSTRAINT tootajaremondis_remonditoo
    FOREIGN KEY (remonditooID)
    REFERENCES remonditoo (remonditooID);

-- Reference: tootajaremondis_tootaja (table: tootajaremondis)
ALTER TABLE tootajaremondis ADD CONSTRAINT tootajaremondis_tootaja
    FOREIGN KEY (tootajaID)
    REFERENCES tootaja (tootajaID);

-- Reference: varuosaRemondis_laduVaruosa (table: varuosaRemondis)
ALTER TABLE varuosaRemondis ADD CONSTRAINT varuosaRemondis_laduVaruosa
    FOREIGN KEY (laduvaruosaID)
    REFERENCES laduVaruosa (laduvaruosaID);

-- Reference: varuosaRemondis_remonditoo (table: varuosaRemondis)
ALTER TABLE varuosaRemondis ADD CONSTRAINT varuosaRemondis_remonditoo
    FOREIGN KEY (remonditooID)
    REFERENCES remonditoo (remonditooID);

-- End of file.

-- KLIENDID
INSERT INTO klient (nimi, tel, epost) VALUES
('Jaan Tamm', '55512345', 'jaan.tamm@email.ee'),
('Mati Saar', '55623456', 'mati.saar@email.ee'),
('Karl Kask', '55734567', 'karl.kask@email.ee'),
('Andres Mägi', '55845678', 'andres.magi@email.ee'),
('Peeter Pärn', '55956789', 'peeter.parn@email.ee');


-- AUTOD
INSERT INTO auto (RegNumber, mark, mudel, valmistamisaasta, labisoit) VALUES
('123ABC', 'Toyota', 'Corolla', 2018, 85000),
('456DEF', 'BMW', '320i', 2020, 62000),
('789GHI', 'Volkswagen', 'Golf', 2017, 110000),
('321JKL', 'Audi', 'A4', 2019, 74000),
('654MNO', 'Ford', 'Focus', 2016, 125000);


-- KLIENDI AUTOD
INSERT INTO kliendiauto (klientID, RegNumber, kuupaev) VALUES
(1, '123ABC', '2025-01-10'),
(1, '456DEF', '2025-02-15'),
(2, '789GHI', '2025-03-20'),
(3, '321JKL', '2025-04-05'),
(4, '654MNO', '2025-05-12');


-- AMETID
INSERT INTO amet (nimetus, kirjeldus) VALUES
('Meister', 'Korraldab ja juhib remonditöid'),
('Mehaanik', 'Teostab autode remonti ja hooldust'),
('Diagnostik', 'Teostab autode diagnostikat'),
('Vastuvõtja', 'Võtab klientidelt autosid vastu ja vormistab remonditöid');


-- TÖÖTAJAD
INSERT INTO tootaja (nimi, isikukood, tel, aadress) VALUES
('Tõnu Mets', '39001010001', '5012345', 'Tallinn'),
('Rasmus Kask', '39102020002', '5023456', 'Tallinn'),
('Siim Saar', '39203030003', '5034567', 'Tartu'),
('Marko Tamm', '39304040004', '5045678', 'Pärnu'),
('Kristjan Mägi', '39405050005', '5056789', 'Tallinn');


-- AMETIMÄÄRATLUSED / AMETIKOHTADE AJALUGU
INSERT INTO ametimaaratus (tootajaID, ametID, alguskuupaev) VALUES
(1, 1, '2023-01-10'),
(2, 2, '2023-02-15'),
(3, 3, '2023-03-20'),
(4, 4, '2023-04-05'),
(5, 2, '2023-05-12'),
(5, 1, '2025-01-01');


-- TÖÖDE KATEGOORIAD
INSERT INTO kategooria (kategooria, kirjeldus, kestvus) VALUES
('Õlivahetus', 'Mootoriõli ja õlifiltri vahetamine', 60),
('Pidurite remont', 'Pidurite kontroll ja remont', 120),
('Rehvide vahetus', 'Rehvide vahetamine ja tasakaalustamine', 90),
('Mootori remont', 'Mootori kontroll ja remont', 240),
('Diagnostika', 'Auto rikete ja süsteemide diagnostika', 45);


-- LAOD
INSERT INTO ladu (nimetus, aadress) VALUES
('Pealadu', 'Tallinn, Kadaka tee 10'),
('Varuosade ladu', 'Tallinn, Mustamäe tee 20');


-- TARNIJAD
INSERT INTO tarnija (nimetus, kontakt, aadress) VALUES
('AutoVaruosad OÜ', '6001234', 'Tallinn, Peterburi tee 50'),
('Fixus Eesti', '6012345', 'Tallinn, Laki tee 12'),
('Baltic Parts OÜ', '6023456', 'Tartu, Ringtee 15'),
('CarParts OÜ', '6034567', 'Pärnu, Riia 40');


-- VARUOSAD
INSERT INTO varuosa (nimetus, tooja, hind) VALUES
('Õlifilter', 'Bosch', 12.50),
('Piduriklotsid', 'ATE', 45.00),
('Piduriketas', 'Brembo', 75.00),
('Mootoriõli 5W-30', 'Castrol', 38.00),
('Õhufilter', 'Mann', 18.00),
('Süüteküünal', 'NGK', 9.50),
('Rehv 205/55 R16', 'Michelin', 95.00),
('Aku', 'Varta', 110.00);


-- VARUOSADE LAOSEIS
INSERT INTO laduVaruosa (varuosaID, laduID, kogus) VALUES
(1, 1, 50),
(2, 1, 30),
(3, 1, 20),
(4, 1, 40),
(5, 2, 35),
(6, 2, 60),
(7, 2, 25),
(8, 2, 15);


-- REMONDITÖÖD
INSERT INTO remonditoo 
(kuupaev, kategooria, kirjeldus, RegNumber) VALUES
('2025-06-01', 'Õlivahetus', 
 'Mootoriõli ja õlifiltri vahetamine', '123ABC'),

('2025-06-03', 'Pidurite remont', 
 'Esipiduriklotside ja piduriketaste vahetamine', '456DEF'),

('2025-06-05', 'Diagnostika', 
 'Mootori ja elektroonika diagnostika', '789GHI'),

('2025-06-08', 'Rehvide vahetus', 
 'Kõigi rehvide vahetamine ja tasakaalustamine', '321JKL'),

('2025-06-10', 'Mootori remont', 
 'Mootori kontroll ja vajalike osade vahetamine', '654MNO');


-- TÖÖTAJAD REMONDITÖÖDEL
INSERT INTO tootajaremondis 
(remonditooID, tootajaID, status) VALUES
(1, 2, 'Lõpetatud'),
(2, 2, 'Lõpetatud'),
(2, 1, 'Lõpetatud'),
(3, 3, 'Lõpetatud'),
(4, 2, 'Töös'),
(4, 5, 'Töös'),
(5, 2, 'Töös'),
(5, 1, 'Töös');


-- REMONDITÖÖDEL KASUTATUD VARUOSAD
INSERT INTO varuosaRemondis 
(laduvaruosaID, remonditooID, kogus) VALUES
(1, 1, 1),
(4, 1, 1),
(2, 2, 1),
(3, 2, 2),
(5, 3, 1),
(7, 4, 4),
(6, 5, 4);


-- ARVED
INSERT INTO arve 
(remonditooID, kuupaev, maksmiseTahtaeg, status) VALUES
(1, '2025-06-01', '2025-06-15', 'Makstud'),
(2, '2025-06-03', '2025-06-17', 'Makstud'),
(3, '2025-06-05', '2025-06-19', 'Maksmata'),
(4, '2025-06-08', '2025-06-22', 'Maksmata'),
(5, '2025-06-10', '2025-06-24', 'Maksmata');


-- ARVETE READ
INSERT INTO arveRida 
(arveID, varuosaremondisID, kirjeldus, kogus, uhikuhind) VALUES
(1, 1, 'Õlifilter', 1, 12.50),
(1, 4, 'Mootoriõli 5W-30', 1, 38.00),
(2, 2, 'Piduriklotsid', 1, 45.00),
(2, 3, 'Piduriketas', 2, 75.00),
(3, 5, 'Õhufilter', 1, 18.00),
(4, 6, 'Rehv 205/55 R16', 4, 95.00),
(5, 7, 'Süüteküünal', 4, 9.50);


-- TARNIJATE PAKUTAVAD VARUOSAD
INSERT INTO tarneVaruosa 
(tarnijaID, varuosaID, kogus) VALUES
(1, 1, 100),
(1, 4, 50),
(1, 2, 50),
(2, 2, 60),
(2, 3, 40),
(2, 7, 50),
(3, 5, 80),
(3, 6, 100),
(3, 8, 30),
(4, 7, 50),
(4, 8, 40);
