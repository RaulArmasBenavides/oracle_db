
select * from SCOTT.emp;

select * from dba_users;


create user siga identified by admin;

create table siga.demo(
    dato varchar2(100)
);

select * from dba_data_files;

select * from dba_users
where username = 'SIGA';




