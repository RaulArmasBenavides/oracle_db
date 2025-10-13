--fn_mcd: Maximo comun divisor de 2 números.

create or replace function scott.fn_mcd
( a number,b number ) return number 
is 
begin 
  if(b=0) then
    return a;
  else
    return scott.fn_mcd(b, mod (a , b));
  end if; 
end;
/
 
select scott.fn_mcd(15,20) from dual;
 


--fn_mcm: Minimo comun multiplo de 2 números.

create or replace function SCOTT.MCM
( p_num1 number, p_num2 number ) return number
is
  mayor number := 0;
  i number := 1;
begin
  mayor := p_num2;
  if(p_num1 > p_num2) then
    mayor := p_num1;
  end if;
  while((mod ((mayor*i), p_num2) <> 0 ) or (mod((mayor*i), p_num1) <> 0)) loop
    i := i+1;
  end loop;
  return(i*mayor);
end;
/

select scott.MCM(2,4) from dual;
select scott.MCM(5,3) from dual;
select scott.MCM(15,20) from dual;
select scott.MCM(20,15) from dual;
