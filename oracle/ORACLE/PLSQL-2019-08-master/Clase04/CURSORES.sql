set serveroutput on

-- Ejemplo 1

declare
  cursor c_demo (p_dptno number) is
    select empno, ename, sal from scott.emp;
  v_empno scott.emp.empno%type;
  v_ename scott.emp.ename%type;   
  v_sal   scott.emp.sal%type;   
begin
  open c_demo( 10 );
  
  fetch c_demo into v_empno, v_ename, v_sal;
  
  dbms_output.put_line('EmpNo: ' || v_empno);
  dbms_output.put_line('Ename: ' || v_ename);
  dbms_output.put_line('Sal: ' || v_sal);

  close c_demo;
end;
/



-- Ejemplo 2

declare
  cursor c_demo (p_dptno number) is
    select empno, ename, sal from scott.emp
    where deptno = p_dptno;
  v_empno scott.emp.empno%type;
  v_ename scott.emp.ename%type;   
  v_sal   scott.emp.sal%type;   
begin
  open c_demo( 30 );
  
  fetch c_demo into v_empno, v_ename, v_sal;
  
  dbms_output.put_line('EmpNo: ' || v_empno);
  dbms_output.put_line('Ename: ' || v_ename);
  dbms_output.put_line('Sal: ' || v_sal);

  close c_demo;
end;
/



-- Ejemplo 3

declare
  cursor c_demo (p_deptno number) is
    select * from scott.emp
    where deptno = p_deptno;
  v_rec scott.emp%RowType;
begin
  open c_demo( 10 );
  
  fetch c_demo into v_rec;
  
  dbms_output.put_line('EmpNo: ' || v_rec.empno);
  dbms_output.put_line('Ename: ' || v_rec.ename);
  dbms_output.put_line('Sal: ' || v_rec.sal);
  dbms_output.put_line('Dept: ' || v_rec.deptno);

  close c_demo;
end;
/



-- Ejemplo 4

declare
  cursor c_demo (p_deptno number) is
    select * from scott.emp
    where deptno = p_deptno;
begin

  for r in c_demo(20) loop
    dbms_output.put_line('EmpNo: ' || r.empno);
    dbms_output.put_line('Ename: ' || r.ename);
    dbms_output.put_line('Sal: ' || r.sal);
    dbms_output.put_line('Dept: ' || r.deptno);
    dbms_output.put_line('-------------------------------');
  end loop;

end;
/



-- ATRIBUTOS DE LOS CURSORES


-- Ejemplo 5

declare
  cursor c_demo (p_deptno number) is
    select * from scott.emp
    where deptno = p_deptno;
  v_rec scott.emp%RowType;
begin
  open c_demo( 10 );
  
  LOOP
    fetch c_demo into v_rec;
  
    EXIT WHEN C_DEMO%NOTFOUND;
    
    dbms_output.put_line('EmpNo: ' || v_rec.empno);
    dbms_output.put_line('Ename: ' || v_rec.ename);
    dbms_output.put_line('Sal: ' || v_rec.sal);
    dbms_output.put_line('Dept: ' || v_rec.deptno);
    dbms_output.put_line('-------------------------------');
    
  END LOOP;
  
  close c_demo;
end;
/



-- Ejemplo 6


declare
  cursor c_demo (p_deptno number) is
    select * from scott.emp
    where deptno = p_deptno;
  v_rec scott.emp%RowType;
begin
  open c_demo( 10 );
  fetch c_demo into v_rec;
  
  WHILE C_DEMO%FOUND LOOP
    
    dbms_output.put_line('EmpNo: ' || v_rec.empno);
    dbms_output.put_line('Ename: ' || v_rec.ename);
    dbms_output.put_line('Sal: ' || v_rec.sal);
    dbms_output.put_line('Dept: ' || v_rec.deptno);
    dbms_output.put_line('-------------------------------');
    
    fetch c_demo into v_rec;
    
  END LOOP;
  
  close c_demo;
end;
/


-- Ejemplo 7

begin
 
  FOR R IN (select * from scott.emp where deptno = 10) LOOP
    
    dbms_output.put_line('EmpNo: ' || R.empno);
    dbms_output.put_line('Ename: ' || R.ename);
    dbms_output.put_line('Sal: ' || R.sal);
    dbms_output.put_line('Dept: ' || R.deptno);
    dbms_output.put_line('-------------------------------');
    
  END LOOP;

end;
/



--Ejemplo 8

Begin

  update emp 
    set sal = 100 
    where empno = 7839; 
  if sql%notfound then 
    dbms_output.put_line('no existe'); 
  else 
    dbms_output.put_line('proceso ok'); 
  end if; 

End;
/




