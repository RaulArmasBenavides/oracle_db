create or replace function scott.fn_mayor_v1_2
( p_n1 number , p_n2 number, p_n3 number) return number
is 
  mayor number;
begin
  -- Proceso
  if(p_n1>p_n2) then 
   mayor:=p_n1;
  else 
    mayor:=p_n2;
  end if;
  if( p_n3>mayor) then
    mayor:=p_n3;
  end if;
  -- Reporte
  return mayor;
end;
/

select scott.fn_mayor_v1_2(250,200,300) from dual;
-------------------------

declare 
n1 NUMBER :=1000;
n2 NUMBER :=5000;
n3 NUMBER :=2000;
n4 number;
begin
n4:= scott.fn_mayor_v1(n1,n2,n3);
DBMS_OUTPUT.PUT_LINE(' mayor es : ' || n4);
end;
/