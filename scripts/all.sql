//TABELE
//CREATE TABLE Utilizatori
CREATE TABLE Utilizatori (
    UserID INT PRIMARY KEY,
    Nume VARCHAR(50),
    Prenume VARCHAR(50),
    Email VARCHAR(100) UNIQUE,
    Parola VARCHAR(50)
);

//CREATE TABLE Produse

CREATE TABLE Produse (
    ProdusID INT PRIMARY KEY,
    NumeProdus VARCHAR(100),
    Descriere CLOB,
    Pret DECIMAL(10,2),
    Stoc INT
);

//CREATE TABLE Reviewuri
CREATE TABLE Reviewuri (
    ReviewID INT PRIMARY KEY,
    UserID INT,
    ProdusID INT,
    Nota INT,
    Comentariu CLOB,
    DataReview DATE,
    FOREIGN KEY (UserID) REFERENCES Utilizatori(UserID),
    FOREIGN KEY (ProdusID) REFERENCES Produse(ProdusID)
);

CREATE TABLE Comenzi (
    ComandaID INT PRIMARY KEY,
    UserID INT,
    DataComanda DATE,
    FOREIGN KEY (UserID) REFERENCES Utilizatori(UserID)
);

////CREATE TABLE Comenzi
CREATE TABLE Detaliicomanda (
    DetaliuID INT PRIMARY KEY,
    ComandaID INT,
    ProdusID INT,
    Cantitate INT,
    PretUnitar DECIMAL(10,2),
    FOREIGN KEY (ComandaID) REFERENCES Comenzi(ComandaID),
    FOREIGN KEY (ProdusID) REFERENCES Produse(ProdusID)
);

//CREATE TABLE DETALIICOMANDA
DROP TABLE DETALIICOMANDA;
DROP TABLE REVIEWURI;
DROP TABLE COMENZI;
DROP TABLE UTILIZATORI;
DROP TABLE PRODUSE;

//Comnezi tabele

//Adauga o coloana noua numita "UltimulLogin" de tip DATE in tabela "Utilizatori".
ALTER TABLE Utilizatori
ADD (UltimulLogin DATE);

//Aceasta modificare adauga informatii despre ultima autentificare a utilizatorilor.
ALTER TABLE Utilizatori
DROP COLUMN UltimulLogin;



DROP TABLE DETALIICOMANDA;
DROP TABLE REVIEWURI;


CREATE TABLE Detaliicomanda (
    DetaliuID INT PRIMARY KEY,
    ComandaID INT,
    ProdusID INT,
    Cantitate INT,
    PretUnitar DECIMAL(10,2),
    FOREIGN KEY (ComandaID) REFERENCES Comenzi(ComandaID),
    FOREIGN KEY (ProdusID) REFERENCES Produse(ProdusID)
);

CREATE TABLE Detaliicomanda (
    DetaliuID INT PRIMARY KEY,
    ComandaID INT,
    ProdusID INT,
    Cantitate INT,
    PretUnitar DECIMAL(10,2),
    FOREIGN KEY (ComandaID) REFERENCES Comenzi(ComandaID),
    FOREIGN KEY (ProdusID) REFERENCES Produse(ProdusID)
);




INSERT ALL
    INTO Utilizatori (UserID, Nume, Prenume, Email, Parola) VALUES (1, 'Nume1', 'Prenume1', 'email1@example.com', 'parola1')
    INTO Utilizatori (UserID, Nume, Prenume, Email, Parola) VALUES (2, 'Nume2', 'Prenume2', 'email2@example.com', 'parola2')
    INTO Utilizatori (UserID, Nume, Prenume, Email, Parola) VALUES (3, 'Nume3', 'Prenume3', 'email3@example.com', 'parola3')
    INTO Utilizatori (UserID, Nume, Prenume, Email, Parola) VALUES (4, 'Nume4', 'Prenume4', 'email4@example.com', 'parola4')
    INTO Utilizatori (UserID, Nume, Prenume, Email, Parola) VALUES (5, 'Nume5', 'Prenume5', 'email5@example.com', 'parola5')
    INTO Utilizatori (UserID, Nume, Prenume, Email, Parola) VALUES (6, 'Nume6', 'Prenume6', 'email6@example.com', 'parola6')
    INTO Utilizatori (UserID, Nume, Prenume, Email, Parola) VALUES (7, 'Nume7', 'Prenume7', 'email7@example.com', 'parola7')
    INTO Utilizatori (UserID, Nume, Prenume, Email, Parola) VALUES (8, 'Nume8', 'Prenume8', 'email8@example.com', 'parola8')
SELECT * FROM dual;



//Inserare inregistrari in tabele

INSERT ALL
    INTO Produse (ProdusID, NumeProdus, Descriere, Pret, Stoc) VALUES (1, 'Laptop', 'Lenovo Legion 5', 5500.00, 20)
    INTO Produse (ProdusID, NumeProdus, Descriere, Pret, Stoc) VALUES (2, 'Smartphone', 'Iphone 15 MAX', 800.00, 30)
    INTO Produse (ProdusID, NumeProdus, Descriere, Pret, Stoc) VALUES (3, 'Televizor LED', 'Televizor LED UHD', 1200.00, 15)
    INTO Produse (ProdusID, NumeProdus, Descriere, Pret, Stoc) VALUES (4, 'Adidasi', 'Nike SB Dunk', 600.00, 50)
    INTO Produse (ProdusID, NumeProdus, Descriere, Pret, Stoc) VALUES (5, 'Casti Bluetooth', 'Casti JBL', 100.00, 40)
    INTO Produse (ProdusID, NumeProdus, Descriere, Pret, Stoc) VALUES (6, 'Jacheta de Piele', 'Jacheta Piele', 200.00, 25)
    INTO Produse (ProdusID, NumeProdus, Descriere, Pret, Stoc) VALUES (7, 'Aparat Foto DSLR', 'Aparat foto DSLR SONY', 1200.00, 10)
    INTO Produse (ProdusID, NumeProdus, Descriere, Pret, Stoc) VALUES (8, 'Ceas Inteligent', 'Ceas fitness', 150.00, 35)
SELECT * FROM dual;



INSERT ALL
    INTO Reviewuri (ReviewID, UserID, ProdusID, Nota, Comentariu, DataReview) VALUES (1, 1, 2, 4, 'Un telefon excelent!', TO_DATE('2024-01-20', 'YYYY-MM-DD'))
    INTO Reviewuri (ReviewID, UserID, ProdusID, Nota, Comentariu, DataReview) VALUES (2, 3, 5, 5, 'nice', TO_DATE('2024-01-22', 'YYYY-MM-DD'))
    INTO Reviewuri (ReviewID, UserID, ProdusID, Nota, Comentariu, DataReview) VALUES (3, 5, 7, 4, 'merge', TO_DATE('2024-01-25', 'YYYY-MM-DD'))
    INTO Reviewuri (ReviewID, UserID, ProdusID, Nota, Comentariu, DataReview) VALUES (4, 2, 5, 3, 'tine mult bateria', TO_DATE('2024-01-28', 'YYYY-MM-DD'))
    INTO Reviewuri (ReviewID, UserID, ProdusID, Nota, Comentariu, DataReview) VALUES (5, 4, 1, 5, 'FOARTE BUN!', TO_DATE('2024-01-30', 'YYYY-MM-DD'))
SELECT * FROM dual;




INSERT ALL
    INTO Comenzi (ComandaID, UserID, DataComanda) VALUES (1, 1, TO_DATE('2024-01-20', 'YYYY-MM-DD'))
    INTO Comenzi (ComandaID, UserID, DataComanda) VALUES (2, 3, TO_DATE('2024-01-22', 'YYYY-MM-DD'))
    INTO Comenzi (ComandaID, UserID, DataComanda) VALUES (3, 5, TO_DATE('2024-01-25', 'YYYY-MM-DD'))
    INTO Comenzi (ComandaID, UserID, DataComanda) VALUES (4, 2, TO_DATE('2024-01-28', 'YYYY-MM-DD'))
    INTO Comenzi (ComandaID, UserID, DataComanda) VALUES (5, 4, TO_DATE('2024-01-30', 'YYYY-MM-DD'))
SELECT * FROM dual;



//Modifica si sterge inregistrari

UPDATE Detaliicomanda
SET Cantitate = 2
WHERE DetaliuID = 4;

DELETE FROM Detaliicomanda
WHERE DetaliuID = 4;


// Actualizeaza cantitatea inregistrarii cu DetaliuID 4 la 2 in tabela "Detaliicomanda".
UPDATE Detaliicomanda
SET Cantitate = 2
WHERE DetaliuID = 4;

// Sterge inregistrarea cu DetaliuID 4 din tabela "Detaliicomanda".
DELETE FROM Detaliicomanda
WHERE DetaliuID = 4;

// Selecteaza toate inregistrarile din tabela "Produse" unde Pretul este mai mare de 1000.
SELECT * FROM Produse
WHERE Pret > 1000;

// Selecteaza numele utilizatorului (U.Nume), comentariul recenziei (R.Comentariu) si numele produsului (P.NumeProdus).
// Se face join intre Utilizatori (U), Reviewuri (R) si Produse (P) pe baza cheilor straine.
SELECT U.Nume, R.Comentariu, P.NumeProdus
FROM Utilizatori U
JOIN Reviewuri R ON U.UserID = R.UserID
JOIN Produse P ON R.ProdusID = P.ProdusID;

// Selecteaza numele utilizatorului (U.Nume) si numarul de comenzi plasate de fiecare utilizator (COUNT(C.ComandaID)).
// Se foloseste LEFT JOIN pentru a include toti utilizatorii, indiferent daca au comenzi sau nu.
SELECT U.Nume, COUNT(C.ComandaID) AS NumarComenzi
FROM Utilizatori U
LEFT JOIN Comenzi C ON U.UserID = C.UserID
GROUP BY U.Nume;

// Calculeaza suma totala a preturilor din tabela "Produse".
SELECT SUM(Pret) AS SumaPreturi
FROM Produse;

// Selecteaza numele produsului si lungimea descrierii corespunzatoare din tabela "Produse".
SELECT NumeProdus, LENGTH(Descriere) AS LungimeDescriere
FROM Produse;

// Selecteaza data curenta (SYSDATE) din dual.
SELECT SYSDATE AS DataCurenta
FROM dual;

// Selecteaza numele produsului si pretul formatat ca un sir de caractere intr-un anumit format.
SELECT NumeProdus, TO_CHAR(Pret, '9999.99') AS PretFormatat
FROM Produse;

// Selecteaza numele produsului si o clasificare a pretului pe baza unei instructiuni CASE.
SELECT NumeProdus,
       CASE
          WHEN Pret < 500 THEN 'Ieftin'
          WHEN Pret BETWEEN 500 AND 1000 THEN 'Mediu'
          ELSE 'Scump'
       END AS ClasificarePret
FROM Produse;

// Selecteaza numele produsului si pretul din tabela "Produse"
// pentru produsele cu un pret mai mare decat media preturilor din aceeasi tabela.
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


// Creaza o vedere numita "VizualizareUtilizatori" care afiseaza doar anumite coloane din tabela "Utilizatori".
CREATE VIEW VizualizareUtilizatori AS
SELECT UserID, Nume, Email
FROM Utilizatori;

// Creaza o vedere numita "VizualizareComenziUtilizatori" care afiseaza informatii despre comenzi si utilizatori.
// Se face join intre Utilizatori (U) si Comenzi (C) pe baza cheilor straine.
CREATE VIEW VizualizareComenziUtilizatori AS
SELECT U.Nume, C.ComandaID, C.DataComanda
FROM Utilizatori U
JOIN Comenzi C ON U.UserID = C.UserID;

// Selecteaza toate inregistrarile din vedere "VizualizareUtilizatori".
SELECT * FROM VizualizareUtilizatori;

// Selecteaza toate inregistrarile din vedere "VizualizareComenziUtilizatori".
SELECT * FROM VizualizareComenziUtilizatori;

// Creaza o vedere numita "VizualizareRecenzii" care afiseaza informatii despre recenzii si produse.
// Se face join intre Utilizatori (U), Reviewuri (R) si Produse (P) pe baza cheilor straine.
CREATE VIEW VizualizareRecenzii AS
SELECT U.Nume AS NumeUtilizator, P.NumeProdus, R.Nota, R.Comentariu, R.DataReview
FROM Utilizatori U
JOIN Reviewuri R ON U.UserID = R.UserID
JOIN Produse P ON R.ProdusID = P.ProdusID;

// Creaza o vedere numita "VizualizareProduseDisponibile" care afiseaza doar produsele cu stocul mai mare de 0.
CREATE VIEW VizualizareProduseDisponibile AS
SELECT * FROM Produse
WHERE Stoc > 0;

// Selecteaza toate inregistrarile din vedere "VizualizareRecenzii".
SELECT * FROM VizualizareRecenzii;

// Selecteaza toate inregistrarile din vedere "VizualizareProduseDisponibile".
SELECT * FROM VizualizareProduseDisponibile;



SET SERVEROUTPUT ON;

-- Declaratie PL/SQL care foloseste structuri de control IF, CASE, WHILE si FOR.
DECLARE
   v_Number INTEGER := 10;
   v_Counter INTEGER := 1;
BEGIN
   -- Verifica daca numarul este pozitiv sau negativ.
   IF v_Number > 0 THEN
      DBMS_OUTPUT.PUT_LINE('The number is positive.');
   ELSE
      DBMS_OUTPUT.PUT_LINE('The number is negative or zero.');
   END IF;

  -- Utilizeaza structura de control CASE pentru evaluarea valorii counter.
   CASE v_Counter
      WHEN 1 THEN
         DBMS_OUTPUT.PUT_LINE('The counter is 1.');
      WHEN 2 THEN
         DBMS_OUTPUT.PUT_LINE('The counter is 2.');
      ELSE
         DBMS_OUTPUT.PUT_LINE('The counter is neither 1 nor 2.');
   END CASE;

   -- Utilizeaza bucla WHILE pentru a itera si afisa mesaje.
   WHILE v_Counter <= v_Number LOOP
      DBMS_OUTPUT.PUT_LINE('Iteration ' || v_Counter);
      v_Counter := v_Counter + 1;
   END LOOP;

   -- Utilizeaza bucla FOR pentru a itera si afisa mesaje.
   FOR i IN 1..5 LOOP
      DBMS_OUTPUT.PUT_LINE('Iteration ' || i);
   END LOOP;
END;
/

-- Declaratie PL/SQL care verifica stocul disponibil pentru a plasa o comanda.
DECLARE
   v_ProductID INTEGER := 1; 
   v_QuantityToOrder INTEGER := 5; 
   v_AvailableStock INTEGER;

BEGIN
   -- Extrage valoarea stocului pentru un anumit produs.
   SELECT Stoc INTO v_AvailableStock FROM Produse WHERE ProdusID = v_ProductID;

   -- Verifica daca stocul este suficient pentru a plasa comanda.
   IF v_AvailableStock >= v_QuantityToOrder THEN
      DBMS_OUTPUT.PUT_LINE('Comanda poate fi plasata. Stoc disponibil: ' || v_AvailableStock);
   ELSE
      DBMS_OUTPUT.PUT_LINE('Comanda nu poate fi plasata. Stoc insuficient.');
   END IF;
END;
/

-- Declaratie PL/SQL care utilizeaza o bucla FOR pentru a afisa recenziile unui produs.
DECLARE
   v_ProductID INTEGER := 2; 
BEGIN
   -- Itereaza prin recenziile pentru un anumit produs si le afiseaza.
   FOR recenzie IN (SELECT * FROM Reviewuri WHERE ProdusID = v_ProductID) LOOP
      DBMS_OUTPUT.PUT_LINE('Recenzie de la UserID ' || recenzie.UserID || ':');
      DBMS_OUTPUT.PUT_LINE('Nota: ' || recenzie.Nota);
      DBMS_OUTPUT.PUT_LINE('Comentariu: ' || recenzie.Comentariu);
      DBMS_OUTPUT.PUT_LINE('Data Review: ' || TO_CHAR(recenzie.DataReview, 'DD-MON-YYYY'));
      DBMS_OUTPUT.PUT_LINE('-------------------------');
   END LOOP;
END;
/


-- Utilizeaza o bucla FOR pentru a itera si afisa toate produsele din tabelul Produse.

BEGIN
   FOR produs IN (SELECT * FROM Produse) LOOP
      DBMS_OUTPUT.PUT_LINE('Produs: ' || produs.NumeProdus);
   END LOOP;
END;
/

-- Utilizeaza un cursor explicit, FETCH si o bucla LOOP pentru a itera si afisa produsele din tabelul Produse.

DECLARE
   CURSOR cur_produse IS
      SELECT * FROM Produse;
   v_produs cur_produse%ROWTYPE;
BEGIN
   OPEN cur_produse;
   LOOP
      FETCH cur_produse INTO v_produs;
      EXIT WHEN cur_produse%NOTFOUND;
      DBMS_OUTPUT.PUT_LINE('Produs: ' || v_produs.NumeProdus);
   END LOOP;
   CLOSE cur_produse;
END;
/

-- Defineste o procedura cu cursor si utilizeaza aceasta procedura pentru a afisa produsele cu stoc mai mare sau egal cu o valoare data.

DECLARE
   PROCEDURE afiseaza_produse(p_stoc_min INT) IS
      CURSOR cur_produse(p_stoc_min INT) IS
         SELECT * FROM Produse WHERE Stoc >= p_stoc_min;
      v_produs cur_produse%ROWTYPE;
   BEGIN
      OPEN cur_produse(p_stoc_min);
      LOOP
         FETCH cur_produse INTO v_produs;
         EXIT WHEN cur_produse%NOTFOUND;
         DBMS_OUTPUT.PUT_LINE('Produs: ' || v_produs.NumeProdus || ', Stoc: ' || v_produs.Stoc);
      END LOOP;
      CLOSE cur_produse;
   END;

-- Apelul procedurii pentru afisarea produselor cu stoc mai mare sau egal cu 10.

BEGIN
   afiseaza_produse(10);
END;
/





-- Utilizarea de blocaje si exceptii in PL/SQL

--  Tratarea exceptiilor in cazul in care se incearca selectarea unui utilizator inexistent sau inserarea unui utilizator cu ID duplicat.
DECLARE
   v_UserID INT := 999; 
   v_UserNume Utilizatori.Nume%TYPE;

BEGIN
   -- Se incearca sa se selecteze numele utilizatorului cu ID-ul specificat.
   BEGIN
      SELECT Nume INTO v_UserNume FROM Utilizatori WHERE UserID = v_UserID;
   EXCEPTION
      WHEN NO_DATA_FOUND THEN
         DBMS_OUTPUT.PUT_LINE('Utilizatorul cu ID ' || v_UserID || ' nu exista.');
   END;

   -- Se incearca inserarea unui nou utilizator cu ID duplicat.
   BEGIN
      INSERT INTO Utilizatori (UserID, Nume, Prenume, Email, Parola)
      VALUES (1, 'NumeExist', 'PrenumeExist', 'exist@example.com', 'parola');

   EXCEPTION
      WHEN DUP_VAL_ON_INDEX THEN
         DBMS_OUTPUT.PUT_LINE('Utilizatorul cu ID 1 deja exista. Alegeti alt ID.');
   END;
END;
/


-- Utilizarea exceptiilor definite in procedura care proceseaza comenzi, inclusiv exceptii personalizate pentru stoc insuficient, utilizator inexistent si produs inexistent.
DECLARE
   v_ComandaID INT := 999; 
   v_StocInsuficient EXCEPTION;
   v_UserNotFound EXCEPTION;
   v_ProdusNotFound EXCEPTION;

   -- Initializare si utilizare de exceptii personalizate
   PRAGMA EXCEPTION_INIT(v_StocInsuficient, -20001); 

   PROCEDURE proceseaza_comanda(p_ComandaID INT) IS
      v_StocProdus INT;
   BEGIN
      -- Se incearca sa se obtina stocul produsului asociat comenzii.
      SELECT Stoc INTO v_StocProdus
      FROM Detaliicomanda dc
      JOIN Produse p ON dc.ProdusID = p.ProdusID
      WHERE dc.ComandaID = p_ComandaID;

      -- Daca stocul este insuficient, se declanseaza o exceptie personalizata.
      IF v_StocProdus < 1 THEN
         RAISE_APPLICATION_ERROR(-20001, 'Stoc insuficient pentru procesarea comenzii.');
      END IF;

      DBMS_OUTPUT.PUT_LINE('Comanda procesata cu succes.');
   EXCEPTION
      WHEN NO_DATA_FOUND THEN
         -- Daca nu se gaseste comanda, se declanseaza o exceptie personalizata.
         RAISE_APPLICATION_ERROR(-20002, 'Comanda nu a fost gasita.');
      WHEN v_StocInsuficient THEN
         DBMS_OUTPUT.PUT_LINE(SQLERRM);
      WHEN OTHERS THEN
         -- Alte exceptii neasteptate.
         DBMS_OUTPUT.PUT_LINE('Eroare neasteptata: ' || SQLERRM);
   END;

BEGIN
   -- Se incearca procesarea comenzii cu ID specificat, tratand exceptiile definite.
   BEGIN
      proceseaza_comanda(v_ComandaID);
   EXCEPTION
      WHEN v_UserNotFound THEN
         DBMS_OUTPUT.PUT_LINE('Utilizatorul nu a fost gasit.');
      WHEN v_ProdusNotFound THEN
         DBMS_OUTPUT.PUT_LINE('Produsul nu a fost gasit.');
      WHEN OTHERS THEN
         DBMS_OUTPUT.PUT_LINE('Eroare neasteptata in procesarea comenzii: ' || SQLERRM);
   END;
END;
/



-- Defineste o functie care calculeaza pretul total al unei comenzi pe baza detaliilor comenzii.
CREATE OR REPLACE FUNCTION calcul_pret_total(p_ComandaID INT) RETURN DECIMAL IS
   v_PretTotal DECIMAL(10,2) := 0;

BEGIN
   SELECT SUM(dc.Cantitate * p.Pret)
   INTO v_PretTotal
   FROM Detaliicomanda dc
   JOIN Produse p ON dc.ProdusID = p.ProdusID
   WHERE dc.ComandaID = p_ComandaID;

   RETURN v_PretTotal;
END;
/

-- Exemplu de utilizare al functiei pentru a calcula pretul total al comenzii cu ID-ul 1.
DECLARE
   v_PretTotal DECIMAL(10,2);
BEGIN
   v_PretTotal := calcul_pret_total(1);

   DBMS_OUTPUT.PUT_LINE('Pretul total al comenzii este: ' || v_PretTotal);
END;
/



-- Defineste o functie care verifica disponibilitatea unui produs in stoc.
CREATE OR REPLACE FUNCTION verifica_disponibilitate(p_ProdusID INT, p_Cantitate INT) RETURN BOOLEAN IS
   v_StocProdus INT;

BEGIN
   SELECT Stoc INTO v_StocProdus
   FROM Produse
   WHERE ProdusID = p_ProdusID;

   RETURN (v_StocProdus >= p_Cantitate);
END;
/

-- Exemplu de utilizare al functiei pentru a verifica disponibilitatea a 3 bucati din produsul cu ID-ul 2.
DECLARE
   v_Disponibilitate BOOLEAN;
BEGIN
   v_Disponibilitate := verifica_disponibilitate(2, 3);

   IF v_Disponibilitate THEN
      DBMS_OUTPUT.PUT_LINE('Produsul este disponibil in stoc.');
   ELSE
      DBMS_OUTPUT.PUT_LINE('Stoc insuficient pentru acest produs.');
   END IF;
END;
/



// Defineste o procedura care calculeaza valoarea totala a comenzilor pentru un anumit utilizator.
CREATE OR REPLACE PROCEDURE calcul_valoare_comenzi(p_UserID INT, p_Valoare OUT NUMBER) IS
   v_TotalValoare NUMBER := 0;
   v_ComandaID INT;
   v_PretTotalProduse NUMBER;

   CURSOR ComenziCursor IS
      SELECT c.ComandaID, NVL(SUM(d.Cantitate * d.PretUnitar), 0) AS PretTotalProduse
      FROM Comenzi c
      LEFT JOIN Detaliicomanda d ON c.ComandaID = d.ComandaID
      WHERE c.UserID = p_UserID
      GROUP BY c.ComandaID;

   NoOrdersException EXCEPTION;
   PRAGMA EXCEPTION_INIT(NoOrdersException, -20001);

BEGIN
   OPEN ComenziCursor;

   LOOP
      FETCH ComenziCursor INTO v_ComandaID, v_PretTotalProduse;

      EXIT WHEN ComenziCursor%NOTFOUND;

      DBMS_OUTPUT.PUT_LINE('ComandaID: ' || v_ComandaID || ', Valoare totala: ' || v_PretTotalProduse);

      v_TotalValoare := v_TotalValoare + v_PretTotalProduse;
   END LOOP;

   CLOSE ComenziCursor;

   IF v_TotalValoare = 0 THEN
      RAISE NoOrdersException;
   END IF;

   p_Valoare := v_TotalValoare;

EXCEPTION
   WHEN NoOrdersException THEN
      DBMS_OUTPUT.PUT_LINE('Nu s-au gasit comenzi pentru utilizatorul cu UserID ' || p_UserID);
   WHEN OTHERS THEN
      DBMS_OUTPUT.PUT_LINE('A aparut o eroare: ' || SQLERRM);
END;
/

// Exemplu de utilizare al procedurii pentru a calcula valoarea totala a comenzilor pentru UserID 1.
DECLARE
   v_UserID INT := 1; 
   v_Valoare NUMBER;
BEGIN
   calcul_valoare_comenzi(v_UserID, v_Valoare);

   DBMS_OUTPUT.PUT_LINE('Valoarea totala a comenzilor pentru UserID ' || v_UserID || ': ' || v_Valoare);
END;
/



// Defineste o procedura care calculeaza media rating-urilor pentru un anumit produs.
CREATE OR REPLACE PROCEDURE calcul_medie_rating(
    p_ProdusID INT,
    p_MedieRating OUT NUMBER
) IS
    v_TotalRating NUMBER := 0;
    v_NumReviews NUMBER := 0;
    v_ReviewRating NUMBER;

    CURSOR RatingsCursor IS
        SELECT Nota
        FROM Reviewuri
        WHERE ProdusID = p_ProdusID;

    NoReviewsException EXCEPTION;
    PRAGMA EXCEPTION_INIT(NoReviewsException, -20001);

BEGIN
    OPEN RatingsCursor;

    LOOP
        FETCH RatingsCursor INTO v_ReviewRating;

        EXIT WHEN RatingsCursor%NOTFOUND;

        DBMS_OUTPUT.PUT_LINE('Rating: ' || v_ReviewRating);

        v_TotalRating := v_TotalRating + v_ReviewRating;
        v_NumReviews := v_NumReviews + 1;
    END LOOP;

    CLOSE RatingsCursor;

    IF v_NumReviews = 0 THEN
        RAISE NoReviewsException;
    END IF;

    p_MedieRating := v_TotalRating / v_NumReviews;

EXCEPTION
    WHEN NoReviewsException THEN
        DBMS_OUTPUT.PUT_LINE('Nu exista review-uri pentru produsul cu ProdusID ' || p_ProdusID);
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('A aparut o eroare: ' || SQLERRM);
END;
/

// Exemplu de utilizare al procedurii pentru a calcula media rating-ului pentru ProdusID 5.
DECLARE
   v_ProdusID INT := 5; 
   v_MedieRating NUMBER;

BEGIN
   calcul_medie_rating(v_ProdusID, v_MedieRating);

   DBMS_OUTPUT.PUT_LINE('Media rating-ului pentru ProdusID ' || v_ProdusID || ': ' || v_MedieRating);
END;
/


ALTER TABLE COMENZI ADD (Status VARCHAR2(50));


CREATE OR REPLACE TRIGGER update_order_status
BEFORE INSERT ON COMENZI
FOR EACH ROW
BEGIN
    :NEW.Status := 'Comanda plasata'; 
END;
/




INSERT INTO COMENZI (ComandaID, UserID, DataComanda)
VALUES (1, 101, TO_DATE('2024-01-31', 'YYYY-MM-DD'));

SELECT * FROM COMENZI WHERE ComandaID = 1;









CREATE OR REPLACE TRIGGER update_review_date
BEFORE INSERT ON Reviewuri
FOR EACH ROW
BEGIN
    :NEW.DataReview := SYSDATE; 
END;
/






INSERT INTO Reviewuri (ReviewID, UserID, ProdusID, Nota, Comentariu)
VALUES (6, 3, 4, 5, 'Excelent produs, recomand!');

SELECT * FROM Reviewuri WHERE ReviewID = 6;
