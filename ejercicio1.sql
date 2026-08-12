
SELECT RID.RESERVA_ID,
       C.NOMBRE,
       C.APELLIDO,
       TP.MONTO_BRUTO,
       TP.DESCUENTO,
       TP.MONTO_FINAL,
       TP.ESTADO 
FROM RESERVA_TEMPORAL RID
JOIN CLIENTE C ON C.CLIENTE_ID = RID.CLIENTE_ID
JOIN TRANSACCION_PAGO TP ON TP.RESERVA_ID = RID.RESERVA_ID
WHERE RID.RESERVA_ID = 1;



SET SERVEROUTPUT ON;

declare
    TYPE BOLETA_CLIENTE IS RECORD(
        nombre_cliente CLIENTE.NOMBRE%TYPE,
        apellido_cliente CLIENTE.APELLIDO%TYPE,
        reserva_id RESERVA_TEMPORAL.RESERVA_ID%TYPE,
        monto_bruto TRANSACCION_PAGO.MONTO_BRUTO%TYPE,
        descuento TRANSACCION_PAGO.DESCUENTO%TYPE,
        monto_final TRANSACCION_PAGO.MONTO_FINAL%TYPE,
        estado TRANSACCION_PAGO.ESTADO%TYPE
    );

    v_boleta boleta_cliente;
begin

    SELECT RID.RESERVA_ID,
       C.NOMBRE,
       C.APELLIDO,
       TP.MONTO_BRUTO,
       TP.DESCUENTO,
       TP.MONTO_FINAL,
       TP.ESTADO
    INTO v_boleta.reserva_id,
         v_boleta.nombre_cliente,
         v_boleta.apellido_cliente,
         v_boleta.monto_bruto,
         v_boleta.descuento,
         v_boleta.monto_final,
         v_boleta.estado 
    FROM RESERVA_TEMPORAL RID
    JOIN CLIENTE C ON C.CLIENTE_ID = RID.CLIENTE_ID
    JOIN TRANSACCION_PAGO TP ON TP.RESERVA_ID = RID.RESERVA_ID  
    WHERE RID.RESERVA_ID = 1;
    DBMS_OUTPUT.PUT_LINE('HOLA');
    DBMS_OUTPUT.PUT_LINE('Cliente: ' || v_boleta.nombre_cliente || ' ' || v_boleta.apellido_cliente);
    DBMS_OUTPUT.PUT_LINE('Reserva: ' || v_boleta.reserva_id);
    DBMS_OUTPUT.PUT_LINE('Monto bruto: ' || v_boleta.monto_bruto);
    DBMS_OUTPUT.PUT_LINE('Descuento: ' || v_boleta.descuento);
    DBMS_OUTPUT.PUT_LINE('Monto final: ' || v_boleta.monto_final);
    DBMS_OUTPUT.PUT_LINE('Estado: ' || v_boleta.estado);
END;