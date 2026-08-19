SET SERVEROUTPUT ON;



DECLARE

  CURSOR c_analisis_ventas IS

    SELECT

      t.codigo_ticket,

      t.fecha_emision,

      t.precio_pagado,

      t.estado AS estado_ticket,

      p.metodo_pago,

      p.descuento,

      p.monto_bruto,

      p.estado AS estado_pago,

      cb.banco

    FROM TICKET t

    JOIN TRANSACCION_PAGO p ON t.transaccion_id = p.transaccion_id

    LEFT JOIN CONVENIO_BANCO cb ON p.convenio_banco_id = cb.convenio_banco_id

    WHERE TO_CHAR(t.fecha_emision, 'DY', 'NLS_DATE_LANGUAGE=SPANISH') IN ('SÁB', 'DOM', 'LUN');



  v_reg c_analisis_ventas%ROWTYPE;



BEGIN

  

  OPEN c_analisis_ventas;



  LOOP

    FETCH c_analisis_ventas INTO v_reg;

    EXIT WHEN c_analisis_ventas%NOTFOUND;



    DBMS_OUTPUT.PUT_LINE('Ticket: ' || v_reg.codigo_ticket);

    DBMS_OUTPUT.PUT_LINE('Fecha: ' || TO_CHAR(v_reg.fecha_emision, 'DD-MM-YYYY HH24:MI'));

    DBMS_OUTPUT.PUT_LINE('Estado Ticket: ' || v_reg.estado_ticket);

    DBMS_OUTPUT.PUT_LINE('Método Pago: ' || v_reg.metodo_pago);

    DBMS_OUTPUT.PUT_LINE('Banco: ' || NVL(v_reg.banco, 'Sin Convenio'));

    DBMS_OUTPUT.PUT_LINE('Descuento: $' || v_reg.descuento);

    DBMS_OUTPUT.PUT_LINE('Precio Final: $' || v_reg.precio_pagado);

    DBMS_OUTPUT.PUT_LINE('--------------------------------------------------------------------');

  END LOOP;

  CLOSE c_analisis_ventas;



END;

/
