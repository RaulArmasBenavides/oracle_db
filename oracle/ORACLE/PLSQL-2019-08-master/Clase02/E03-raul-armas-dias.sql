create or replace function scott.fn_dias_mes
(P_mes in varchar2 ) return number
is 
dias number;
begin 
case P_mes
 when 'ENERO' then dias:=31;
 when 'FEBRERO' then dias:=28;
 when 'MARZO' then dias:=31;
 when 'ABRIL' then dias:=30;
 when 'MAYO' then dias:=31;
 when 'JUNIO' then dias:=30;
 when 'JULIO' then dias:=31;
 when 'AGOSTO' then dias:=31;
 when 'SETIEMBRE' then dias:=30;
 when 'OCTUBRE' then dias:=31;
 when 'NOVIEMBRE' then dias:=30;
 when 'DICIEMBRE' then dias:=31;
 else  dias := 0;
end case;
return dias;
end;
/


select scott.fn_dias_mes('ENERO') from dual 


