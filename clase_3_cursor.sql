SELECT * FROM PRODUCTORA;
SELECT * FROM EVENTO;
SELECT * FROM RECINTO;
SELECT * FROM RESERVa_TEMPORAL;
SELECT * FROM CLIENTE;
SELECT * FROM TICKEt;
SELECT * FROM TRANSACCION_PAGO;
SELECT * FROM LOCALIDAD_EVENTO;


DECLARE
    CURSOR INFO_EVENTO IS
    SELECT E. NOMBRE, E.DESCRIPCION, R.NOMBRE AS NOMBRE_RECINTO, E.FECHA_EVENTO, E.FECHA_APERTURA, E.ESTADO, P.NOMBRE_FANTASIA AS NOMBRE_PRODUCTORA
    FROM EVENTO E
    JOIN PRODUCTORA P ON E.PRODUCTORA_ID = P.PRODUCTORA_ID
    JOIN RECINTO R ON R.RECINTO_ID = E.RECINTO_ID;

    v_nombre_evento evento.nombre%type;
    v_descripcion_evento evento.DESCRIPCION%TYPE;
    v_recinto_nombre recinto.NOMBRE%TYPE;
    v_fecha_evento evento.FECHA_EVENTO%TYPE;
    v_fecha_apertura evento.FECHA_APERTURA%TYPE;
    v_estado_evento evento.ESTADO%TYPE;
    v_nombre_productora productora.NOMBRE_FANTASIA%TYPE;
BEGIN 
    open INFO_EVENTO;

    LOOP
        FETCH INFO_EVENTO INTO v_nombre_evento, v_descripcion_evento, v_recinto_nombre, v_fecha_evento, v_fecha_apertura, v_estado_evento, v_nombre_productora;

        EXIT WHEN INFO_EVENTO%NOTFOUND;

        DBMS_OUTPUT.PUT_LINE('Evento : ' || v_nombre_evento || ' - Descripcion evento : ' ||  v_descripcion_evento || ' - Nombre del recinto' || v_recinto_nombre || ' - Fecha evento : ' || v_fecha_evento || ' - Fecha apertura: ' ||  v_fecha_apertura ||' - Estado evento : '|| v_estado_evento || ' - Nombre productora : ' ||v_nombre_productora|| ' ');
    END LOOP;

    CLOSE INFO_EVENTO;
END;
