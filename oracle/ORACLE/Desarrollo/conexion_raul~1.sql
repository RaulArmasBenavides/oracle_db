show user 

SELECT * FROM LOCATIONS 


--Bloques anónimos 
--habilitar las salidas 
SET SERVEROUTPUT ON
--Bloque Anónimo 
declare 
sFecha varchar2(50);
begin 
select to_char(sysdate , 'dd/mm/yyyy hh24:mm:ss')
into sFecha from dual;
dbms_output.put_line(' Hoy es :' || sFecha);
end;
/



select * from EDUCA.alumno 



--crear una función 
--EJERCICIO 01
--DESARROLLAR UNA FUNCION PARA CALCULAR EL PROMEDIO
--DE UN ALUMNO DE PL/SQL, SON 4 NOTAS.
CREATE OR REPLACE FUNCTION RAUL.FNPROMEDIO
( NOTA1 AS NUMBER, NOTA2 AS NUMBER, NOTA3 AS NUMBER, NOTA4 AS NUMBER) 
RETURN NUMBER
IS 
    PROMEDIO NUMBER;
BEGIN
    PROMEDIO := (NOTA1 + NOTA2 + NOTA3 + NOTA4)/4;
    RETURN PROMEDIO;
END;
/

SELECT RAUL.FNPROMEDIO (13,14.3,15.6,18.8) as resultado FROM DUAL;




Create sequence sec_factura
Start with 5000
Increment by 5
Maxvalue 10000
Minvalue 2000

Select sec_factura.nextval from dual












