-- ----------------------------------------
-- CONNECT
-- ----------------------------------------
/*
	CONNECT usuario/clave[@ip_equipo_remoto:puerto/servicio]
*/

SQL> connect system/oracle
Conectado.


SQL> connect system/oracle@172.17.2.192:1521/orcl
Conectado.


SQL> connect system/oraclx
ERROR:
ORA-01017: invalid username/password; logon denied


Advertencia: Ya no está conectado a ORACLE!


-- ----------------------------------------
-- DISCONNECT
-- ----------------------------------------
/*
	DISCONNECT 
*/

SQL> connect system/oracle
Conectado.

SQL> SHOW USER
USER es "SYSTEM"

SQL> DISCONNECT
Desconectado de Oracle Database 12c Enterprise Edition Release 12.1.0.2.0 - 64bit Production
With the Partitioning, OLAP, Advanced Analytics and Real Application Testing options

SQL> SHOW USER
USER es ""



