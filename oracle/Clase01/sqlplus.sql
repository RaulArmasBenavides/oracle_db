
-- Cargar SQL*Plus sin conexión

> sqlplus /nolog

C:\Users\Gustavo>sqlplus /nolog

SQL*Plus: Release 12.1.0.2.0 Production on Sßb Ago 24 17:27:09 2019

Copyright (c) 1982, 2014, Oracle.  All rights reserved.

SQL> show user
USER es ""

-- Cargar SQL*Plus con inicio de sesión

> sqlplus usuario/clave

C:\Users\Gustavo>sqlplus system/oracle

SQL*Plus: Release 12.1.0.2.0 Production on Sßb Ago 24 17:28:58 2019

Copyright (c) 1982, 2014, Oracle.  All rights reserved.

Hora de última Conexión Correcta: Sáb Ago 24 2019 17:05:05 -05:00

Conectado a:
Oracle Database 12c Enterprise Edition Release 12.1.0.2.0 - 64bit Production
With the Partitioning, OLAP, Advanced Analytics and Real Application Testing options

SQL> show user
USER es "SYSTEM"

La conexión local con SQL*Plus no hace uso del listener.


-- Conexión remota con SQL*Plus

> sqlplus usuario/clave@ip_equipo_remoto:1521/servicio



SQL> show parameter name

NAME                                 TYPE        VALUE
------------------------------------ ----------- -----------
cell_offloadgroup_name               string
db_file_name_convert                 string
db_name                              string      orcl
db_unique_name                       string      orcl
global_names                         boolean     FALSE
instance_name                        string      orcl
lock_name_space                      string
log_file_name_convert                string
pdb_file_name_convert                string
processor_group_name                 string
service_names                        string      orcl


C:\Users\Gustavo>sqlplus system/oracle@localhost:1521/orcl

SQL*Plus: Release 12.1.0.2.0 Production on Sáb Ago 24 17:38:30 2019

Copyright (c) 1982, 2014, Oracle.  All rights reserved.

Hora de última Conexión Correcta: Sáb Ago 24 2019 17:31:31 -05:00

Conectado a:
Oracle Database 12c Enterprise Edition Release 12.1.0.2.0 - 64bit Production
With the Partitioning, OLAP, Advanced Analytics and Real Application Testing options



C:\Users\Gustavo>sqlplus system/oracle@172.17.2.192:1521/orcl

SQL*Plus: Release 12.1.0.2.0 Production on Sßb Ago 24 17:43:38 2019

Copyright (c) 1982, 2014, Oracle.  All rights reserved.

Hora de ┌ltima Conexi¾n Correcta: Sßb Ago 24 2019 17:38:47 -05:00

Conectado a:
Oracle Database 12c Enterprise Edition Release 12.1.0.2.0 - 64bit Production
With the Partitioning, OLAP, Advanced Analytics and Real Application Testing options

SQL> show user
USER es "SYSTEM"



