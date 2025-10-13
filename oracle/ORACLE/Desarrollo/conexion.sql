show user 
select * from EDUCA.alumno;




	DECLARE
	   dummy NUMBER;
	BEGIN
	   SELECT  INTO dummy FROM dual;
	EXCEPTION
	   WHEN OTHERS THEN
	      raise_application_error(-20001,'Se ha producido el error - '||SQLCODE||' -ERROR- '||SQLERRM);
	END;
