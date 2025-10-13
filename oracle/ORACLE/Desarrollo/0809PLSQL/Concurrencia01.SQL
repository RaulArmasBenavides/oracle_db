set serveroutput on

declare
  v_id number(10);
begin
  educa.sp_new_demo('EGCC soy yo!!!', v_id);
  dbms_output.put_line( 'id: ' || v_id );
end;
/

select * from educa.demo;