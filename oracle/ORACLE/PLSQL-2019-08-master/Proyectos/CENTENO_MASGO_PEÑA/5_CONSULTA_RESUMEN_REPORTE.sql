create or replace procedure INVENTARIO.sp_gen_reporte
(p_estado out number)
is
  v_cantidad integer;
  v_monto number(10,2);
begin
  -- Acciones iniciales
  p_estado := 1;
  delete from inventario.tbl_reporte;
  -- Paso 1: llenar datos iniciales
  insert into INVENTARIO.TBL_REPORTE
  (CODIOFIC, NOMBOFIC)
  select CODIOFIC, NOMBOFIC
  from INVENTARIO.OFICINA;
  -- Paso 2: Actualizar otras columnas
  for r in (select OFICINA.CODIOFIC from INVENTARIO.OFICINA) loop
    -- IMPORTE TOTAL
    SELECT SUM(EQUIPO.PRECEQUI) INTO V_MONTO
    FROM MOVIMIENTO 
    LEFT JOIN OFICINA ON MOVIMIENTO.CODIOFICDEST=OFICINA.CODIOFIC 
    LEFT JOIN EQUIPO ON MOVIMIENTO.CODIEQUI = EQUIPO.CODIEQUI
    WHERE OFICINA.CODIOFIC = r.CODIOFIC;
    
    -- CANTIDAD EQUIPOS
    SELECT COUNT(EQUIPO.PRECEQUI) INTO V_CANTIDAD
    FROM MOVIMIENTO 
    LEFT JOIN OFICINA ON MOVIMIENTO.CODIOFICDEST=OFICINA.CODIOFIC 
    LEFT JOIN EQUIPO ON MOVIMIENTO.CODIEQUI = EQUIPO.CODIEQUI 
    WHERE OFICINA.CODIOFIC = r.CODIOFIC;
    
    -- ACTUALIZAR
    UPDATE INVENTARIO.TBL_REPORTE
    SET MONTO = NVL(V_MONTO,0),
      CANTEQUI=NVL(V_CANTIDAD,0)
    WHERE TBL_REPORTE.CODIOFIC = r.CODIOFIC;

  end loop;
  -- Confirmar
  commit;
exception
  when others then
    p_estado := -1;
end;
/

--EJECUCION
DECLARE

  V_ESTADO   NUMBER;

BEGIN
  sp_gen_reporte(V_ESTADO);
  DBMS_OUTPUT.PUT_LINE(V_ESTADO);

END;
/