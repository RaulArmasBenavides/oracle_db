CREATE OR REPLACE function scott.Es_Bisiesto 
(Ano in number) return boolean is
  Result boolean;
 vBandera boolean;
begin
If Ano Mod 4 = 0 Then
  If (Ano Mod 100 = 0) And Not (Ano Mod 400 = 0) Then
     vBandera := False;
  Else
      vBandera := True;
  End If;
Else
    vBandera := False;
End If;
  return(vBandera);
end Es_Bisiesto;
/

create or replace function scott.fn_dias_mes
(P_mes in varchar2 ,P_ano in number) return number
is 
dias number;
begin         
case P_mes
 when 'ENERO' then dias:=31;           
 when 'FEBRERO' then 
  if scott.Es_Bisiesto(P_ano)=true then dias:=29;
  else 
  dias:=28;
  end if;
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


select scott.fn_dias_mes('FEBRERO',2020) from dual 
