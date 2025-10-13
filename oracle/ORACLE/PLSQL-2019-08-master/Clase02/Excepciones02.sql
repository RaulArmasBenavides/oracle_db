

create or replace procedure scott.sp_divide
( p_n1 in number, p_n2 in number, p_rpta out number )
is
begin
  p_rpta := p_n1 / p_n2;
exception
  when zero_divide then
    raise_application_error( -20998,'No se puede dividir por cero.');
end;
/

declare
  v_rpta number;
begin
  scott.sp_divide(10,0,v_rpta);
  dbms_output.put_line('Rpta: ' || v_rpta);
end;
/


declare
  v_rpta number;
begin
  scott.sp_divide(10,0,v_rpta);
  dbms_output.put_line('Rpta: ' || v_rpta);
exception
  when others then
    dbms_output.put_line(sqlerrm);
end;
/

