create or replace function scott.fnPromedio
( n1 number, n2 number, n3 number, n4 number) 
return number 
is 
  prom number; 
begin 
  prom := (n1 + n2 + n3 + n4)/4;  
  return prom; 
end; 
/

 select scott.fnPromedio(10.6,15,12,18) promedio from dual; 