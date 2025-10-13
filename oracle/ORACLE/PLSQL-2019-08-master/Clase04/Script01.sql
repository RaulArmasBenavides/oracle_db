
-- Caso 1

create public database link lnk_demo01 
connect to remoto identified by secreto 
using '172.17.2.193:1521/ORCL';


select * from scott.emp@lnk_demo01;

-- Caso 2

create public database link lnk_demo02
connect to remoto identified by secreto 
using '(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=172.17.2.193)(PORT=1521))(CONNECT_DATA=(SERVER=DEDICATED)(SERVICE_NAME=ORCL)))';

select * from scott.emp@lnk_demo02;



-- Caso 3

create public database link lnk_demo03
connect to remoto identified by secreto 
using 'remoto';

select * from scott.emp@lnk_demo03;


