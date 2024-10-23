 --Aufgabe 2_9
--import bereits vorliegende Daten
source Dropbox\schule\BBB\Modul 105 SQL Datenbanken\LB;


--Aufgabe 2_10
--es soll alle Mitarbeiter rausgeben, welche ein Leiter sind
SELECT mitarbeiter.Name, mitarbeiter.Vorname
FROM mitarbeiter
WHERE mitarbeiter.Ist_Leiter like'J'
ORDER BY mitarbeiter.Name;


--Aufgabe 2_11
--Es soll alle Mitarbeiter rausgeben die vor dem 01.01.1980 geboren sind sortiert mit Geburtsdatum und Nachname
SELECT mitarbeiter.Personalnummer, mitarbeiter.Name, mitarbeiter.Vorname
FROM mitarbeiter
WHERE mitarbeiter.Geburtsdatum < ('01.01.1980')
ORDER BY mitarbeiter.Geburtsdatum, mitarbeiter.Name;

--Aufgabe 2_12
--Es soll alle Mirarbeiter mit der Schadensfälle nr 19 und 24
SELECT mitarbeiter.Personalnummer, mitarbeiter.Name, mitarbeiter.Vorname
FROM mitarbeiter, schadensfall
WHERE schadensfall.ID like (19,24)
ORDER BY mitarbeiter.Geburtsdatum, mitarbeiter.Name;

--Aufgabe 2_13
--durchschnitt, höchster und tiefster Schadenssumme
SELECT AVG(<schadenshoehe>) FROM <schadenfall>;
SELECT MAX(<schadenshoehe>) FROM <schadenfall>;
SELECT MIN(<schadenshoehe>) FROM <schadenfall>; 

--Aufgabe 2_14
--Es soll die abteilungen mit der Anzahl der Mitarbeiter sortiert hersausgeben
select Raum, count(*) as c FROM mitarbeiter GROUP BY Raum;

--Aufgabe 2_15
--es soll herausgeben, welche Fahrzeugtypen haben am meisten Schadensfälle

--Aufgabe 2_16
select fh.name, ft.Herstelle_ID count(*) as c FROM fahrzeugherstelle.fh, fahrzeugtyp.ft GROUP BY fh.name;

--Aufgabe 2_17
--es soll herausgeben, welche mitarbeiter haben mehr als 4 Fälle bearbeitet
SELECT mitarbeiter.name, mitarbeiter.vorname, schadenfall. FROM mitarbeiter, schadenfall 
WHERE schadenfall.MitarbeiterID IN 
 (SELECT schadenfall.MitarbeiterID FROM schadenfall 
  GROUP BY schadenfall.MitarbeiterID HAVING COUNT (schadenfall.MitarbeiterID) >4);
  
--Aufgabe 2_17