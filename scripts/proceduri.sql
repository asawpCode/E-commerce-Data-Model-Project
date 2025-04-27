--PROCEDURI


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



-- Defineste o procedura care calculeaza valoarea totala a comenzilor pentru un anumit utilizator.
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

-- Exemplu de utilizare al procedurii pentru a calcula valoarea totala a comenzilor pentru UserID 1.
DECLARE
   v_UserID INT := 1; 
   v_Valoare NUMBER;
BEGIN
   calcul_valoare_comenzi(v_UserID, v_Valoare);

   DBMS_OUTPUT.PUT_LINE('Valoarea totala a comenzilor pentru UserID ' || v_UserID || ': ' || v_Valoare);
END;
/



-- Defineste o procedura care calculeaza media rating-urilor pentru un anumit produs.
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

-- Exemplu de utilizare al procedurii pentru a calcula media rating-ului pentru ProdusID 5.
DECLARE
   v_ProdusID INT := 5; 
   v_MedieRating NUMBER;

BEGIN
   calcul_medie_rating(v_ProdusID, v_MedieRating);

   DBMS_OUTPUT.PUT_LINE('Media rating-ului pentru ProdusID ' || v_ProdusID || ': ' || v_MedieRating);
END;
/