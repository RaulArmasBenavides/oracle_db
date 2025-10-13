

create or replace procedure scott.sp_divide
( p_n1 in number, p_n2 in number, p_rpta out number )
is
begin
  p_rpta := p_n1 / p_n2;
end;
/

declare
  v_rpta number;
begin
  scott.sp_divide(10,0,v_rpta);
  dbms_output.put_line('Rpta: ' || v_rpta);
exception
  when zero_divide then
    dbms_output.put_line('No se puede dividir por cero.');
end;
/

