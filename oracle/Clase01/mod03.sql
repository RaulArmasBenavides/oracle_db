-- Habilitar las salidas

set serveroutput on

-- Bloque Anónimo

-- Ejemplo 01

declare
  v_msg varchar2(1000);
begin
  v_msg := 'Bienvenidos al mundo oscuro de la programación.';
  dbms_output.put_line(v_msg);
end;
/


-- Ejemplo 2

Declare 
  sFecha Varchar2(50); 
Begin 
  select to_char(sysdate,'dd/mm/yyyy hh24:mm:ss') 
  into sFecha from dual; 
  dbms_output.put_line( 'Hoy es: ' || sFecha ); 
End;
/
 
-- FUNCION

create or replace function SCOTT.fnSuma
( a number, b number ) return number 
is 
  c number; 
begin 
  c := a + b; 
  return c; 
end; 
/

GRANT EXECUTE ON SCOTT.FNSUMA TO HR;

SELECT SCOTT.fnSuma(15,18) SUMA FROM DUAL;

SELECT 8*98 FROM DUAL;

SELECT * FROM DUAL;

DECLARE
  A NUMBER := 45;
  B NUMBER := 88;
  C NUMBER;
BEGIN
  C := SCOTT.FNSUMA(A,B);
  DBMS_OUTPUT.PUT_LINE( 'C: ' || C );
END;
/
 
-- Ejercicio 01
-- Desarrollar una función para calcular el promedio
-- de un alumno de PL/SQL, son 4 notas.



-- PROCEDIMIENTO

create or replace procedure SCOTT.prSuma
( a number, b number ) 
is 
  c number( 12,2 ); 
begin 
  c := a + b; 
  dbms_output.put_line( c ); 
end; 
/


CALL SCOTT.prSuma( 54, 67 );


begin  
  SCOTT.prSuma(15,16); 
end;
/

create or replace function scott.mayusculas
( dato varchar2 ) return varchar2
as
  rpta varchar2(20000);
begin
  rpta := upper( dato );
  return rpta;
end;
/


select scott.mayusculas( 'gustavo' ) from dual;


create or replace function scott.fn101
(p_deptno scott.dept.deptno%type)  
return scott.dept.dname%type  
is 
  v_dname scott.dept.dname%type; 
begin 
  select dname into v_dname from scott.dept 
  where deptno = p_deptno; 
  return(v_dname); 
end; 
/


select scott.fn101(10) from dual;


create or replace function scott.fn1011
(p_deptno scott.dept.deptno%type)  
return scott.dept%rowtype  
is 
  v_rec scott.dept%rowtype; 
begin 
  select * into v_rec from scott.dept 
  where deptno = p_deptno; 
  return(v_rec); 
end; 
/

declare
  v_rec scott.dept%rowtype;
begin
  v_rec := scott.fn1011(10);
  dbms_output.put_line( v_rec.deptno );
  dbms_output.put_line( v_rec.dname );
end;
/
