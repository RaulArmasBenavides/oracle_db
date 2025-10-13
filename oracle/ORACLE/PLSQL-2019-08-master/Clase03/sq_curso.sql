-- SECUENCIA
-- Genera valores únicos y correlativos

create sequence educa.sq_curso;

select educa.sq_curso.nextval from dual;

create table educa.demo(
  id number primary key,
  dato varchar2(100)
);

create sequence educa.sq_demo;

insert into educa.demo( id, dato )
values( educa.sq_demo.nextval, 'Hoy es un gran día' );

insert into educa.demo( id, dato )
values( educa.sq_demo.nextval, 'Hoy día soy muy feliz' );

select * from educa.demo;

commit;


