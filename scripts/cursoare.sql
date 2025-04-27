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