-- EXCEPTII

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