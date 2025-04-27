--COMENZI SELECT

-- Actualizeaza cantitatea inregistrarii cu DetaliuID 4 la 2 in tabela "Detaliicomanda".
UPDATE Detaliicomanda
SET Cantitate = 2
WHERE DetaliuID = 4;

-- Sterge inregistrarea cu DetaliuID 4 din tabela "Detaliicomanda".
DELETE FROM Detaliicomanda
WHERE DetaliuID = 4;

-- Selecteaza toate inregistrarile din tabela "Produse" unde Pretul este mai mare de 1000.
SELECT * FROM Produse
WHERE Pret > 1000;

-- Selecteaza numele utilizatorului (U.Nume), comentariul recenziei (R.Comentariu) si numele produsului (P.NumeProdus).
-- Se face join intre Utilizatori (U), Reviewuri (R) si Produse (P) pe baza cheilor straine.
SELECT U.Nume, R.Comentariu, P.NumeProdus
FROM Utilizatori U
JOIN Reviewuri R ON U.UserID = R.UserID
JOIN Produse P ON R.ProdusID = P.ProdusID;

-- Selecteaza numele utilizatorului (U.Nume) si numarul de comenzi plasate de fiecare utilizator (COUNT(C.ComandaID)).
-- Se foloseste LEFT JOIN pentru a include toti utilizatorii, indiferent daca au comenzi sau nu.
SELECT U.Nume, COUNT(C.ComandaID) AS NumarComenzi
FROM Utilizatori U
LEFT JOIN Comenzi C ON U.UserID = C.UserID
GROUP BY U.Nume;

-- Calculeaza suma totala a preturilor din tabela "Produse".
SELECT SUM(Pret) AS SumaPreturi
FROM Produse;

-- Selecteaza numele produsului si lungimea descrierii corespunzatoare din tabela "Produse".
SELECT NumeProdus, LENGTH(Descriere) AS LungimeDescriere
FROM Produse;

-- Selecteaza data curenta (SYSDATE) din dual.
SELECT SYSDATE AS DataCurenta
FROM dual;

-- Selecteaza numele produsului si pretul formatat ca un sir de caractere intr-un anumit format.
SELECT NumeProdus, TO_CHAR(Pret, '9999.99') AS PretFormatat
FROM Produse;

-- Selecteaza numele produsului si o clasificare a pretului pe baza unei instructiuni CASE.
SELECT NumeProdus,
       CASE
          WHEN Pret < 500 THEN 'Ieftin'
          WHEN Pret BETWEEN 500 AND 1000 THEN 'Mediu'
          ELSE 'Scump'
       END AS ClasificarePret
FROM Produse;

-- Selecteaza numele produsului si pretul din tabela "Produse"
-- pentru produsele cu un pret mai mare decat media preturilor din aceeasi tabela.
SELECT NumeProdus, Pret
FROM Produse
WHERE Pret > (SELECT AVG(Pret) FROM Produse);

-- Selecteaza numele produsului si pretul din tabela "Produse"
-- pentru produsele cu un stoc mai mare de 10 sau un pret mai mic de 100.
SELECT NumeProdus, Pret
FROM Produse
WHERE Stoc > 10
UNION
SELECT NumeProdus, Pret
FROM Produse
WHERE Pret < 100;