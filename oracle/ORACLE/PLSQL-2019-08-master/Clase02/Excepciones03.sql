

create or replace procedure scott.sp_divide
( 
  p_n1 in number, 
  p_n2 in number, 
  p_rpta out number,
  p_code out number,
  p_message out varchar2
)
is
begin
  p_code := 1;
  p_message := 'Proceso ok.';
  p_rpta := p_n1 / p_n2;
exception
  when zero_divide then
    p_code := -1;
    p_message := 'No se puede dividir por cero.';
end;
/

declare
  v_rpta number;
  v_code number;
  v_message varchar2(1000);
begin
  scott.sp_divide(10, 2, v_rpta, v_code, v_message);
  if v_code = 1 then
    dbms_output.put_line('Rpta: ' || v_rpta);
  else
    dbms_output.put_line( v_message );
  end if;
end;
/


declare
  v_rpta number;
  v_code number;
  v_message varchar2(1000);
begin
  scott.sp_divide(10, 0, v_rpta, v_code, v_message);
  if v_code = 1 then
    dbms_output.put_line('Rpta: ' || v_rpta);
  else
    dbms_output.put_line( v_message );
  end if;
end;
/

