create or replace procedure            sp_gen_reporte2
(p_estado out number)
is
  v_cantidad integer;
begin
  -- Acciones iniciales
  p_estado := 1;
  delete from inventario.tbl_INFORME;
  -- Paso 1: llenar datos iniciales
  insert into INVENTARIO.TBL_INFORME
  (CODIEMPL  , NOMBEMPL)
  select CODIEMPL,apelempl||' '||apelmate||' '||nombempl
  from INVENTARIO.EMPLEADO;
  -- Paso 2: Actualizar otras columnas
  for r in (select EMPLEADO.CODIEMPL from INVENTARIO.empleado) loop

    -- CANTIDAD EQUIPOS
    SELECT COUNT(MOVIMIENTO.codiequi) INTO V_CANTIDAD
    FROM MOVIMIENTO 
    LEFT JOIN EMPLEADO ON MOVIMIENTO.CODIEMPL=EMPLEADO.CODIEMPL 
--    LEFT JOIN EQUIPO ON MOVIMIENTO.CODIEQUI = EQUIPO.CODIEQUI 
    WHERE EMPLEADO.CODIEMPL = r.CODIEMPL;

    -- ACTUALIZAR
    UPDATE INVENTARIO.TBL_INFORME
    SET CANTIDAD=NVL(V_CANTIDAD,0)
    WHERE TBL_INFORME.CODIEMPL = r.CODIEMPL;

  end loop;
  -- Confirmar
  commit;
exception
  when others then
    p_estado := -1;
end;

--EJECUCION
DECLARE

  V_ESTADO   NUMBER;

BEGIN
  sp_gen_reporte2(V_ESTADO);
  DBMS_OUTPUT.PUT_LINE(V_ESTADO);

END;
/