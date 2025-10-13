create or replace function scott.fn_calcular_prom(
n1 in number,
n2 in number,
n3 in number,
n4 in number)
return number
is re1 number;
begin

select ((n1+n2+n3+n4)/4) 
into re1
from dual;

return re1;
end;
/

select scott.fn_calcular_prom(12,10,11,14) from dual;