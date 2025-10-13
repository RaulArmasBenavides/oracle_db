--PAQUETE DE FUNCIONES UTILES
CREATE OR REPLACE PACKAGE inventario.PKG_UTIL IS

TYPE T_ARRAY_STRING IS TABLE OF VARCHAR2(1000)INDEX BY BINARY_INTEGER;

FUNCTION SPLIT(P_DATA VARCHAR2, P_DELIMITADOR VARCHAR2 ) 
RETURN T_ARRAY_STRING;

END;
/

-- CUERPO DEL PAQUETE
CREATE OR REPLACE PACKAGE BODY inventario.PKG_UTIL IS
FUNCTION SPLIT(P_DATA VARCHAR2, P_DELIMITADOR VARCHAR2 ) RETURN T_ARRAY_STRING
IS
    I        NUMBER   := 0;
    POS      NUMBER   := 0;
    V_DATA   CLOB     := P_DATA;
    STRINGS  T_ARRAY_STRING;
BEGIN

  V_DATA := TRIM( V_DATA );
  POS := INSTR( V_DATA, P_DELIMITADOR, 1, 1 );
  WHILE ( POS != 0) LOOP
      I := I + 1;
      STRINGS(i) := SUBSTR( V_DATA, 1, POS - 1 );
      V_DATA :=  SUBSTR( V_DATA, POS + 1, LENGTH(V_DATA) );
      pos := instr(V_DATA, P_DELIMITADOR, 1, 1);
      IF POS = 0 THEN
          STRINGS( I + 1 ) := V_DATA;
      END IF;    
  END LOOP;
  IF I = 0 AND LENGTH( V_DATA ) > 0 THEN
    STRINGS( I + 1 ) := V_DATA;
  END IF;
  RETURN strings;
END SPLIT;

END;
/

create or replace procedure INVENTARIO.USP_MOVIMIENTO
(  p_datos varchar2, p_oficina_origen integer, p_oficina_destino integer, P_EMPLEADO INTEGER)
as
  V_ARREGLO inventario.PKG_UTIL.T_ARRAY_STRING;
  V_CONT INTEGER := 1;
  v_msg varchar2(1000);
  v_excep1 Exception;
  V_EQUI INTEGER;
begin
    FOR FILA IN 1 .. V_ARREGLO.COUNT LOOP
        select 	CODIEQUI INTO V_EQUI
        from inventario.equipo
        WHERE CODIEQUI = V_ARREGLO(FILA)
        for update; 
    END LOOP;
  
  select 	COUNT(*) INTO V_CONT
	from inventario.MOVIMIENTO;
  -- OBTENER FILAS CADENA
  V_ARREGLO := inventario.PKG_UTIL.SPLIT(P_DATOS,'|');
  FOR FILA IN 1 .. V_ARREGLO.COUNT LOOP
    INSERT INTO INVENTARIO.MOVIMIENTO(CODIMOVI,TIPOMOVI,FECHMOVI,CODIOFICORIG,CODIOFICDEST,OBSEUBIC,ESTAMOVI,CODIEQUI,CODIEMPL)
    VALUES (V_CONT,'B','20190915',p_oficina_origen,p_oficina_destino,'TRASLADO',1, V_ARREGLO(FILA),P_EMPLEADO);
    v_cont := v_cont + 1;
    DBMS_OUTPUT.PUT_LINE( V_ARREGLO(FILA) );
  END LOOP;
	-- Confirmar la Tx
	commit;
exception
  when others then
    v_msg := sqlerrm; -- capturar mensaje de error
    rollback; -- cancelar transacción
    raise_application_error(-20001,v_msg);
end;
/


EXEC INVENTARIO.USP_MOVIMIENTO('1|2|3|4',2,1,1);
