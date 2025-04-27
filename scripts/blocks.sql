--BLOCKS


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