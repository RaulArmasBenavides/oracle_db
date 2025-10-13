create or replace function SCOTT.fnPromedio
( a number, b number, c number, d number ) return number 
is 
  R number; 
begin 
  R := (a + b + c + d)/4; 
  return R; 
end;
/

select SCOTT.fnPromedio(10,10,10,20) promedio from dual;
