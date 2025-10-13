
create or replace procedure educa.sp_gen_informa
(p_estado out number)
is
  v_comprometido number(15,2);
  v_recaudado number(15,2);
begin
  -- Acciones iniciales
  p_estado := 1;
  delete from educa.tbl_informe;
  -- Paso 1: llenar datos iniciales
  insert into educa.tbl_informe
  (cur_id, cur_nombre, cur_vacantes, cur_matriculados, 
  imp_proyectado)
  select cur_id, cur_nombre, cur_vacantes, cur_matriculados,
        cur_vacantes * cur_precio
  from educa.curso;
  -- Paso 2: Actualizar otras columnas
  for r in (select cur_id from educa.curso) loop
    -- Comprometido
    select sum(mat_precio) into v_comprometido
    from EDUCA.matricula
    where cur_id = r.cur_id;
    -- Recaudado
    select sum(pag_importe) into v_recaudado
    from EDUCA.pago
    where cur_id = r.cur_id;
    -- Actualizar la tabla
    update educa.tbl_informe
    set imp_comprometido = nvl(v_comprometido,0),
        imp_recaudado = nvl(v_recaudado,0)
    where cur_id = r.cur_id;
  end loop;
  -- Confirmar
  commit;
exception
  when others then
    p_estado := -1;
end;
/

declare
  v_estado number;
begin
  educa.sp_gen_informa(v_estado);
  dbms_output.put_line('Estado: ' || v_estado);
end;
/


