/*
Desarrollar una funcion q retorne la cantidad de dias de un mes
*/


create or replace function scott.cantidad_dias_mes 
( p_mes in number ) return number
is
  v_dias number;
begin
--proceso
  case p_mes
  when 1 then v_dias := 30;
  when 2 then v_dias := 29;
  when 3 then v_dias := 31;
  when 4 then v_dias := 30;
  when 5 then v_dias := 31;
  when 6 then v_dias := 30;
  when 7 then v_dias := 31;
  when 8 then v_dias := 30;  
  when 9 then v_dias := 31;
  when 10 then v_dias := 30;
  when 11 then v_dias := 31;
  when 12 then v_dias := 30;
  else v_dias := 0;
end case;  
  return v_dias;
end;
/

select scott.cantidad_dias_mes( 2 ) from dual;




