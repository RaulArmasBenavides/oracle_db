create or replace function scott.fnPromedio
( a number, b number, c number, d number ) 
return number 
is 
  e number; 
begin 
  e := (a + b + c + d)/4; 
  return e; 
end; 
/