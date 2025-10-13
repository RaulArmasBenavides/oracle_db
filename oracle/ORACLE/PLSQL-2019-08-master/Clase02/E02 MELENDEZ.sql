--Ejemplo 1
--Hacer un procedimiento que permita calcular el importe de una venta
--si la venta es el lunes se aplica 5% dscto
--si es miercoles se aplica dscto 8%
--el dscto es sobre precio de vta
CREATE OR REPLACE PROCEDURE SP_DSCTO(
      P_VENTA IN NUMBER,
      P_CANT  IN NUMBER,
      P_DIA   IN VARCHAR2--,
      --DSCTO OUT NUMBER
      )
  IS
    P_CALC NUMBER;
    DSCTO NUMBER;
  BEGIN
    P_CALC     := P_VENTA * P_CANT;
    IF P_DIA    = 'LUNES' THEN
      DSCTO    := ((P_CALC * 5)/100);
    ELSIF P_DIA = 'MIERCOLES' THEN
      DSCTO    := ((P_CALC * 8)/100);
    END IF;
    DBMS_OUTPUT.PUT_LINE (DSCTO);
    --EXCEPTION
    --WHEN NO_DATA_FOUND;
  END;
/

EXECUTE SP_DSCTO(100,2,'MIERCOLES');