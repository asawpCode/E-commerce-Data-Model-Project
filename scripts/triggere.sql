--TRIGGERE


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
