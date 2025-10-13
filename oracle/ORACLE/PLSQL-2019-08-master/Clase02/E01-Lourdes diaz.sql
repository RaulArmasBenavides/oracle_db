create or replace function scott.fn_mayor_3
(p_n1 number, p_n2 number, p_n3 number)
return number
is
begin
  if ( p_n1 > p_n2 and p_n1 > p_n3  ) then
    return p_n1;
  else
   if (p_n2 > p_n1 and p_n2 > p_n3 ) then
    return p_n2;
   else
    return p_n3;
   end if;
  end if;
end;
/

select  scott.fn_mayor_3 (70,80,100) from dual
