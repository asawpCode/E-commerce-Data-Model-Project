--PACHETE


-- Crearea pachetului
CREATE OR REPLACE PACKAGE MarketplacePackage AS
    -- Definirea procedurii pentru plasarea unei comenzi
    PROCEDURE plaseaza_comanda(
        p_UserID INT,
        p_ProdusID INT,
        p_Cantitate INT
    );

    -- Definirea functiei pentru calculul valorii totale a comenzilor unui utilizator
    FUNCTION calcul_valoare_comenzi(
        p_UserID INT
    ) RETURN NUMBER;
END MarketplacePackage;
/


-- Implementarea pachetului
CREATE OR REPLACE PACKAGE BODY MarketplacePackage AS
    -- Implementarea procedurii pentru plasarea unei comenzi
    PROCEDURE plaseaza_comanda(
        p_UserID INT,
        p_ProdusID INT,
        p_Cantitate INT
    ) IS
    BEGIN
        -- Inserarea unei noi inregistrari in tabelul DETALIICOMANDA utilizand secvente si valori din alte tabele
        INSERT INTO DETALIICOMANDA (DETALIUID, COMANDAID, PRODUSID, CANTITATE, PRETUNITAR)
        VALUES (DETALIICOMANDA_SEQ.NEXTVAL, COMENZI_SEQ.CURRVAL, p_ProdusID, p_Cantitate, (SELECT Pret FROM Produse WHERE ProdusID = p_ProdusID));
    END;

    -- Implementarea functiei pentru calculul valorii totale a comenzilor unui utilizator
    FUNCTION calcul_valoare_comenzi(
        p_UserID INT
    ) RETURN NUMBER IS
        v_Valoare NUMBER := 0;
    BEGIN
        -- Calculul sumei valorilor comenzilor pentru un utilizator specific
        SELECT NVL(SUM(C.CANTITATE * C.PRETUNITAR), 0)
        INTO v_Valoare
        FROM COMENZI CO
        LEFT JOIN DETALIICOMANDA C ON CO.COMANDAID = C.COMANDAID
        WHERE CO.USERID = p_UserID;

        RETURN v_Valoare;
    END;
END MarketplacePackage;
/


-- Exemplu de utilizare a functiei din pachet
DECLARE
    total_value NUMBER;
BEGIN
    -- Apelarea functiei din pachet pentru calculul valorii totale a comenzilor pentru un utilizator
    total_value := MARKETPLACEPACKAGE.calcul_valoare_comenzi(1);
    DBMS_OUTPUT.PUT_LINE('Total Order Value for User 1: ' || total_value);
END;
/