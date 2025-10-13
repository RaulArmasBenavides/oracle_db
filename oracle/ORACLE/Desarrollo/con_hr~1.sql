--consulta de los empleados , donde la fecha de ingreso sea la primera 
SELECT first_name, hire_date
FROM employees
WHERE hire_date in (select min(hire_date)
from employees)

select * from employees 

select * from job_history


select first_name, last_name
from employees a
where exists (select *
from job_history b
where b.employee_id=a.employee_id)


select e.first_name,e.last_name from employees e , job_history j where e.employee_id = j.employee_id





DECLARE
nombre varchar2(15);
depa varchar2(15);
ciudad varchar2(15);
pais varchar2(25);
BEGIN
-- Consulta Principal
SELECT first_name, Department_name, city, country_name
INTO nombre, depa, ciudad, pais
FROM employees e, departments d, locations l, countries c
WHERE e.department_id=d.department_id and
d.location_id=l.location_id and l.country_id=c.country_id and
hire_date =(select min(hire_date) from employees);
-- Muestra Información
dbms_output.put_line ( 'Nombre : '||nombre);
dbms_output.put_line ( 'Departamento : '|| depa);
dbms_output.put_line ( 'Ciudad : '|| ciudad);
dbms_output.put_line ( 'País ' ||pais);
END;




--BUCLES O LOOP
--Bloques anónimos 
--habilitar las salidas 
SET SERVEROUTPUT ON
--Bloque Anónimo 
declare
  cont number;
begin
  cont := 0;
  while cont < 10 loop
    cont := cont + 1;
    if cont = 5 then
      continue;
    end if;
    dbms_output.put_line( cont || '.- y DALE U' );
    exit when ( cont = 8 );
  end loop;
end;
/



declare
  j number := 555;
begin
  dbms_output.put_line( 'j: ' || j );
  for j in 1 .. 10 loop
    if j = 5 then
      continue;
    end if;
    dbms_output.put_line( j || '.- universitario' );
    exit when ( j = 8 );
  end loop;
  dbms_output.put_line( 'j: ' || j );
end;
/






create or replace function hr.fn_mayor_v1( p_n1 number , p_n2 number, p_n3 number) return number
is 
mayor number;
begin
if(p_n1>p_n2) then 
 mayor:=p_n1;
else 
  mayor:=p_n2;
end if;
if( p_n3>mayor) then
mayor:=p_n3;
end if;
return mayor;
end;
/
select scott.fn_mayor_v1(10,20,30) from dual;


/*addasd
asd
asda
sdasd*/ 



