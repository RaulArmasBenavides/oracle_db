-- Roosveth
-- Funciones
create or replace function SCOTT.fnpromedio
( a number, b number, c number, d number ) return number 
is 
  e number(12,2); 
begin 
  e := (a + b+c+d)/4.0; 
  return e; 
end;
/

Select SCott.fnpromedio(4,6,8,11) from dual;