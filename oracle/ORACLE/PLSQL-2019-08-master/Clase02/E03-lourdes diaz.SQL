create or replace function scott.fn_cantidad_dias_mes
( p_mes in number ) return varchar2
is
  v_cantidad number;
begin
  -- Proceso
  case p_mes
    when 1 then v_cantidad := 31;
    when 2 then v_cantidad := 28;
    when 3 then v_cantidad := 31;
    when 4 then v_cantidad := 30;
    when 5 then v_cantidad := 31;
    when 6 then v_cantidad := 30;
    when 7 then v_cantidad := 31;
    when 8 then v_cantidad := 31;
    when 9 then v_cantidad := 30;
    when 10 then v_cantidad := 31;
    when 11 then v_cantidad := 30;
    when 12 then v_cantidad := 31;
    else v_cantidad := 0;
  end case;
  -- Reporte
  return v_cantidad;
end;
/  


select scott.fn_cantidad_dias_mes( 3 ) from dual;
