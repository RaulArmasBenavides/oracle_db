/*
Función que retorna el nombre del día de la semana.
1: Lunes y 7: Domingo
*/

create or replace function scott.fn_dia_semana
( p_dia in number ) return varchar2
is
  v_nombre varchar2(50);
begin
  -- Proceso
  case p_dia
    when 1 then v_nombre := 'Lunes';
    when 2 then v_nombre := 'Martes';
    when 3 then v_nombre := 'Miercoles';
    when 4 then v_nombre := 'Jueves';
    when 5 then v_nombre := 'Viernes';
    when 6 then v_nombre := 'Sabado';
    when 7 then v_nombre := 'Domingo';
    else v_nombre := 'No existe';
  end case;
  -- Reporte
  return v_nombre;
end;
/

select scott.fn_dia_semana( 2 ) from dual;