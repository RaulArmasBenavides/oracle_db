
grant select on scott.emp to educa;

create or replace public synonym s_scott_emp
for scott.emp;

select * from s_scott_emp;


desc s_scott_emp;

