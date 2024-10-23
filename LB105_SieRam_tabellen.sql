--Augabe 1_1 Erstellung der Datenbank und der Tabellen
--Erstellung der DATABASE
CREATE DATABASE LB105_V31_M1;

--erstellung der Tabelle Mitarbeiter
CREATE TABLE `lb105_v31_m1`.`labormitarbeiter` ( `lmid` INT NULL AUTO_INCREMENT ,
 `nachname` VARCHAR(50) NOT NULL , `vorname` VARCHAR(50) NOT NULL , PRIMARY KEY 
 (`Imid`)) ENGINE = InnoDB; 
 
 --erstellung der Tabelle Versuchstyp
 CREATE TABLE `lb105_v31_m1`.`versuchstyp` ( `vtid` INT NULL AUTO_INCREMENT , `versuchsname`
 VARCHAR(100) NOT NULL , `klasse` VARCHAR(50) NOT NULL , `level` INT NOT NULL ,
 PRIMARY KEY (`vtid`)) ENGINE = InnoDB;
 
 --esrstellung der Tabelle Laborversuch
 CREATE TABLE `lb105_v31_m1`.`laborversuch` ( `lvid` INT NULL AUTO_INCREMENT , `lmid` 
 INT NOT NULL , `vtid` INT NOT NULL , `datum` VARCHAR(10) NOT NULL , `ergebnis`
 VARCHAR(225) NOT NULL , `bemerkung` VARCHAR(225) NOT NULL , PRIMARY KEY (`lvid`),
 INDEX (`lmid`), INDEX (`vtid`)) ENGINE = InnoDB;
 
 
 --Aufgabe 1_2 a
 --lmid wird in Labormitarbeiter zu einem PRIMARY KEY gemacht(wurde schon bei der Erstellung gemacht, aber falls man es noch nicht gemacht hat)
 ALTER TABLE `labormitarbeiter` ADD PRIMARY KEY( `lmid`);
 --lvid wird in Laborversuch zu einem PRIMARY KEY gemacht
 ALTER TABLE `laborversuch` ADD PRIMARY KEY( `lvid`);
 --vtid wird in Versuchstyp zu einem PRIMARY KEY gemacht
 ALTER TABLE `versuchstyp` ADD PRIMARY KEY( `vtid`);
 
--Aufgabe 1_2 b
-- im phpMyAdmin, geht man dann auf Designer, dann auf erzeuge verknüpfung und verbindet PK vtid vom Versuchstyp mit dem FK vtid vom Laborversuch

--Aufgabe 1_2 c
-- im phpMyAdmin, geht man dann auf Designer, dann auf erzeuge verknüpfung und verbindet PK lmid vom Labormitarbeiter mit dem FK lmid vom Laborversuch

--Aufgabe 1_2 d
--Es soll checken ob das Datum vor dem Aktuellen Datum ist
ALTER TABLE `laborversuch`
ADD CHECK (datum<=2020-12-17);


--Aufgabe 1_3 a 
--veränderung des Attributs varchar zu Dae bei Datum und bei Bemerkung von varchar zu BLOBLOCK
--Datum änderung
ALTER TABLE `laborversuch` CHANGE `datum` `datum` DATE NOT NULL;
--Bemerkung änderung
ALTER TABLE `laborversuch` CHANGE `bemerkung` `bemerkung` BLOB NOT NULL;

--Aufgabe 1_3 b
--hinzufügung des Attributs geschlecht (char 1) in die Relation Labormitarbeiter
ALTER TABLE `labormitarbeiter` ADD `geschlecht` CHAR(1) NOT NULL AFTER `vorname`;

--Augabe 1_3 c
--entferung des Attributs level in der Relation Versuchstyp
ALTER TABLE `versuchstyp` DROP `level`;


--Aufgabe 1_4 a
--Ausfüllung der Relation Labormitarbeiter mit folgenden Daten
--Niceman, Bob, m.
INSERT INTO `labormitarbeiter` (`lmid`, `nachname`, `vorname`, `geschlecht`) VALUES (NULL, 'Niceman', 'Bob', 'm');
--Cleverwoman, Alice, f.
INSERT INTO `labormitarbeiter` (`lmid`, `nachname`, `vorname`, `geschlecht`) VALUES (NULL, 'Clerverwoman', 'Alice', 'f');

--Aufgabe 1_4 b
--Ausfüllung der Relation Versuchstyp mit folgenden Daten
--Tierverusch, Klasse 1.
INSERT INTO `versuchstyp` (`vtid`, `versuchsname`, `klasse`) VALUES (NULL, 'Tierversuch', 'Klasse 1');
--Virenresisenz, Klasse 3.
INSERT INTO `versuchstyp` (`vtid`, `versuchsname`, `klasse`) VALUES (NULL, 'Virenresistenz', 'Klasse 3');

--Aufgabe 1_4 c
--Ausfüllung der Relation Laborversuch mit folgenden Daten
--Versuch mit Alice 
INSERT INTO `laborversuch` (`lvid`, `lmid`, `vtid`, `datum`, `ergebnis`, `bemerkung`) VALUES (NULL, '3',
 '', '2018-05-01', 'am 1018-05-01 wurde von Alice ein Tierversuch mit dem Ergebnis \"hat nicht geklappt\" durchgeführt');
--Es gab eine Fehlermeldung, da ich ich in das Blob von bemerkung nichts einfügen konnte, da ich es nicht hatte
--Versuch mit Bob
INSERT INTO `laborversuch` (`lvid`, `lmid`, `vtid`, `datum`, `ergebnis`, `bemerkung`) VALUES (NULL, '3', '',
 '2018-03-29', 'am 1018-03-029 wurde von Alice ein Virenresistenz mit dem Ergebnis \"positiv\" durchgeführt');
--Es gab eine Fehlermeldung, da ich ich in das Blob von bemerkung nichts einfügen konnte, da ich es nicht hatte


--Aufgabe 1_5
--mann muss virtuel bedingung basierend auf 1_2 d
--


--Aufgabe 1_6 
-- machen Sie eine Transaktion für den datum wechsel
--wechsel datum 
BEGIN;
UPDATE laborversuch`
SET datum = 2018-03-29,
WHERE
    datum = 2018-05-01;

UPDATE laborversuch`
SET datum = 2018-05-01,
WHERE
    datum = 2018-03-29;
COMMIT;
ROLLBACK;


--Aufgabe 1_7
--Erstlleung von Hanspeter mit allen Rechte mit dem Passqoer Hörnlisalat
CREATE USER 'Hanspeter'@'localhost' IDENTIFIED VIA mysql_native_password USING '***';GRANT ALL PRIVILEGES ON
 *.* TO 'Hanspeter'@'localhost' REQUIRE NONE WITH GRANT OPTION MAX_QUERIES_PER_HOUR 0 MAX_CONNECTIONS_PER_HOUR
 0 MAX_UPDATES_PER_HOUR 0 MAX_USER_CONNECTIONS 0;
 
--Erstellung von DBKnecht mit Leserechte auf Labormitarbeiter und Versuchstyp mit dem Passwort EsLebeDerKnecht
CREATE USER 'DBKnecht'@'localhost' IDENTIFIED VIA mysql_native_password USING '***';GRANT SELECT, CREATE VIEW ON
 *.* TO 'DBKnecht'@'localhost' REQUIRE NONE WITH MAX_QUERIES_PER_HOUR 0 MAX_CONNECTIONS_PER_HOUR 0 
 MAX_UPDATES_PER_HOUR 0 MAX_USER_CONNECTIONS 0;
 
 --Aufgabe 1_8
 --Löschung aller Drei Relationen
DROP TABLE laborversuch;
DROP TABLE labormitarbeiter;
DROP TABLE versuchstyp;





