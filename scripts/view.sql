--VIEW URI

-- Creaza o vedere numita "VizualizareUtilizatori" care afiseaza doar anumite coloane din tabela "Utilizatori".
CREATE VIEW VizualizareUtilizatori AS
SELECT UserID, Nume, Email
FROM Utilizatori;

-- Creaza o vedere numita "VizualizareComenziUtilizatori" care afiseaza informatii despre comenzi si utilizatori.
-- Se face join intre Utilizatori (U) si Comenzi (C) pe baza cheilor straine.
CREATE VIEW VizualizareComenziUtilizatori AS
SELECT U.Nume, C.ComandaID, C.DataComanda
FROM Utilizatori U
JOIN Comenzi C ON U.UserID = C.UserID;

-- Selecteaza toate inregistrarile din vedere "VizualizareUtilizatori".
SELECT * FROM VizualizareUtilizatori;

-- Selecteaza toate inregistrarile din vedere "VizualizareComenziUtilizatori".
SELECT * FROM VizualizareComenziUtilizatori;

-- Creaza o vedere numita "VizualizareRecenzii" care afiseaza informatii despre recenzii si produse.
-- Se face join intre Utilizatori (U), Reviewuri (R) si Produse (P) pe baza cheilor straine.
CREATE VIEW VizualizareRecenzii AS
SELECT U.Nume AS NumeUtilizator, P.NumeProdus, R.Nota, R.Comentariu, R.DataReview
FROM Utilizatori U
JOIN Reviewuri R ON U.UserID = R.UserID
JOIN Produse P ON R.ProdusID = P.ProdusID;

-- Creaza o vedere numita "VizualizareProduseDisponibile" care afiseaza doar produsele cu stocul mai mare de 0.
CREATE VIEW VizualizareProduseDisponibile AS
SELECT * FROM Produse
WHERE Stoc > 0;

-- Selecteaza toate inregistrarile din vedere "VizualizareRecenzii".
SELECT * FROM VizualizareRecenzii;

-- Selecteaza toate inregistrarile din vedere "VizualizareProduseDisponibile".
SELECT * FROM VizualizareProduseDisponibile;