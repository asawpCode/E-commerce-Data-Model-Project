--TABELE
--CREATE TABLE Utilizatori
CREATE TABLE Utilizatori (
    UserID INT PRIMARY KEY,
    Nume VARCHAR(50),
    Prenume VARCHAR(50),
    Email VARCHAR(100) UNIQUE,
    Parola VARCHAR(50)
);

--CREATE TABLE Produse

CREATE TABLE Produse (
    ProdusID INT PRIMARY KEY,
    NumeProdus VARCHAR(100),
    Descriere CLOB,
    Pret DECIMAL(10,2),
    Stoc INT
);

--CREATE TABLE Reviewuri
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

--CREATE TABLE Comenzi
CREATE TABLE Detaliicomanda (
    DetaliuID INT PRIMARY KEY,
    ComandaID INT,
    ProdusID INT,
    Cantitate INT,
    PretUnitar DECIMAL(10,2),
    FOREIGN KEY (ComandaID) REFERENCES Comenzi(ComandaID),
    FOREIGN KEY (ProdusID) REFERENCES Produse(ProdusID)
);

--CREATE TABLE DETALIICOMANDA
DROP TABLE DETALIICOMANDA;
DROP TABLE REVIEWURI;
DROP TABLE COMENZI;
DROP TABLE UTILIZATORI;
DROP TABLE PRODUSE;

--Comnezi tabele

--Adauga o coloana noua numita "UltimulLogin" de tip DATE in tabela "Utilizatori".
ALTER TABLE Utilizatori
ADD (UltimulLogin DATE);

--Aceasta modificare adauga informatii despre ultima autentificare a utilizatorilor.
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



--Inserare inregistrari in tabele

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



--Modifica si sterge inregistrari

UPDATE Detaliicomanda
SET Cantitate = 2
WHERE DetaliuID = 4;

DELETE FROM Detaliicomanda
WHERE DetaliuID = 4;
