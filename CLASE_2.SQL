SET serveroutput ON;

DECLARE
    TYPE asientos_cine IS VARRAY(6) OF VARCHAR2(3);

    v_asientos asientos_cine := asientos_cine('A1','A2','A3','A4','A5','B');
begin
    DBMS_OUTPUT.PUT_LINE('Se le asigno el asiento N° ' || V_ASIENTOS(2));
END;
/
