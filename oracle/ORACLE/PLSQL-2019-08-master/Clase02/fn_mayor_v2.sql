-- Ejercicio 01
-- Encontrar el mayor de 4 numeros

create or replace function scott.fn_mayor_v2
(p_n1 number, p_n2 number, p_n3 number, p_n4 number )
return number
is
  v_mayor number;
begin
  -- Punto de inicio
  if p_n2 > p_n1 then
    v_mayor := p_n2;
  else
    v_mayor := p_n1;
  end if;
  -- Analisis
  if p_n3 > v_mayor then
    v_mayor := p_n3;
  end if;
  if p_n4 > v_mayor then
    v_mayor := p_n4;
  end if;
  -- Reporte
  return v_mayor;
end;
/


select scott.fn_mayor_v2( 14, 19, 32, 28 ) from dual;
