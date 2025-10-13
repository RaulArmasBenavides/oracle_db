-- Ejemplo 1
-- Hacer un procedimiento que permita calcular.
-- el importe de una venta.
-- Si la venta es el día lunes se aplica un dcto de 5%.
-- Si la venta es el día miercoles se aplica un dcto de 8%.
-- El descuento es sobre el precio de venta.

CREATE OR REPLACE PROCEDURE SCOTT.SP_VENTA
( 
  P_PRECIO IN NUMBER, P_CANT IN NUMBER, P_DIA IN NUMBER,
  P_PORC_DCTO OUT NUMBER, P_DCTO OUT NUMBER, P_IMPORTE OUT NUMBER
)
IS
BEGIN
  -- Inicio
  P_PORC_DCTO := 0;
  -- Descuento
  IF (P_DIA = 1) THEN
    P_PORC_DCTO := 0.05;
  END IF;
  IF (P_DIA = 3) THEN
    P_PORC_DCTO := 0.08;
  END IF;
  -- Proceso final   
  P_DCTO := P_PRECIO*P_PORC_DCTO;
  P_IMPORTE := (P_PRECIO - P_DCTO)*P_CANT;   
END;
/


DECLARE
  V_PORC_DSCTO NUMBER;
  V_DSCTO NUMBER;  
  V_IMPORTE NUMBER;  
BEGIN
  SCOTT.SP_IMPORTE_VENTA_N( 1000,5,1, V_PORC_DSCTO,V_DSCTO,V_IMPORTE );
  DBMS_OUTPUT.PUT_LINE( 'EL PORCENTAJE DE DESCUENTO ES: ' || V_PORC_DSCTO );
  DBMS_OUTPUT.PUT_LINE( 'EL DESCUENTO ES: ' || V_DSCTO );
  DBMS_OUTPUT.PUT_LINE( 'EL IMPORTE ES: ' || V_IMPORTE );  
END;
/
