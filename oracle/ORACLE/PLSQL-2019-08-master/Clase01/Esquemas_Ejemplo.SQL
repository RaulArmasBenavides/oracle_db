-- Cargar SQL*Plus

C:\Users\Gustavo>sqlplus /nolog

SQL*Plus: Release 12.1.0.2.0 Production on Sßb Ago 24 19:13:54 2019

Copyright (c) 1982, 2014, Oracle.  All rights reserved.

SQL> show user
USER es ""

-- SCOTT

SQL> conn scott/tiger
ERROR:
ORA-28000: the account is locked

SQL> conn system/oracle
Conectado.

SQL> alter user scott
  2  account unlock
  3  identified by tiger;

Usuario modificado.

SQL> conn scott/tiger
Conectado.

SQL> column table_name format a30

SQL> select * from cat;

TABLE_NAME                     TABLE_TYPE
------------------------------ -----------
SALGRADE                       TABLE
BONUS                          TABLE
EMP                            TABLE
DEPT                           TABLE

SQL> select * from dept;

    DEPTNO DNAME          LOC
---------- -------------- -------------
        10 ACCOUNTING     NEW YORK
        20 RESEARCH       DALLAS
        30 SALES          CHICAGO
        40 OPERATIONS     BOSTON



		
-- HR

SQL> CONN hr/hr
ERROR:
ORA-28000: the account is locked

Advertencia: íYa no estß conectado a ORACLE!

SQL> conn system/oracle
Conectado.
SQL> alter user hr
  2  identified by hr
  3  account unlock;

Usuario modificado.

SQL> conn hr/hr
Conectado.

SQL> select * from cat;

TABLE_NAME                     TABLE_TYPE
------------------------------ -----------
COUNTRIES                      TABLE
JOB_HISTORY                    TABLE
EMPLOYEES                      TABLE
JOBS                           TABLE
DEPARTMENTS                    TABLE
LOCATIONS                      TABLE
REGIONS                        TABLE
LOCATIONS_SEQ                  SEQUENCE
DEPARTMENTS_SEQ                SEQUENCE
EMPLOYEES_SEQ                  SEQUENCE
EMP_DETAILS_VIEW               VIEW

11 filas seleccionadas.



SQL> select * from departments;

DEPARTMENT_ID DEPARTMENT_NAME                MANAGER_ID LOCATION_ID
------------- ------------------------------ ---------- -----------
           10 Administration                        200        1700
           20 Marketing                             201        1800
           30 Purchasing                            114        1700
           40 Human Resources                       203        2400
           50 Shipping                              121        1500
           60 IT                                    103        1400
           70 Public Relations                      204        2700
           80 Sales                                 145        2500
           90 Executive                             100        1700
          100 Finance                               108        1700
          110 Accounting                            205        1700
. . . . .
. . . . .
. . . . .



-- VENTAS

SQL> conn system/oracle
Conectado.

SQL> @C:\EGCC\databases\Ventas\Oracle\Modelo\Modelo.SQL


SQL> SELECT * FROM CAT;

TABLE_NAME                     TABLE_TYPE
------------------------------ -----------
EMPLEADO                       TABLE
SQ_EMPLEADO                    SEQUENCE
USUARIO                        TABLE
CATEGORIA                      TABLE
SQ_CATEGORIA                   SEQUENCE
PRODUCTO                       TABLE
SQ_PRODUCTO                    SEQUENCE
VENTA                          TABLE
SQ_VENTA                       SEQUENCE
DETALLE                        TABLE
SQ_DETALLE                     SEQUENCE
TIPO_PAGO                      TABLE
PAGO                           TABLE
SQ_PAGO                        SEQUENCE		  
		  


-- EUREKA

SQL> conn system/oracle
Conectado.

SQL> @C:\EGCC\databases\EurekaBank\Oracle\Modelo\Crea_BD.sql

SQL> @C:\EGCC\databases\EurekaBank\Oracle\Modelo\Carga_Datos.sql

SQL> SELECT * FROM CAT;

TABLE_NAME                     TABLE_TYPE
------------------------------ -----------
CONTADOR                       TABLE
CARGOMANTENIMIENTO             TABLE
COSTOMOVIMIENTO                TABLE
INTERESMENSUAL                 TABLE
PARAMETRO                      TABLE
MOVIMIENTO                     TABLE
TIPOMOVIMIENTO                 TABLE
CUENTA                         TABLE
CLIENTE                        TABLE
MONEDA                         TABLE
ASIGNADO                       TABLE
EMPLEADO                       TABLE
SUCURSAL                       TABLE

13 filas seleccionadas.

SQL> SELECT * FROM CLIENTE;

CHR_C VCH_CLIEPATERNO           VCH_CLIEMATERNO           VCH_CLIENOMBRE                 CHR_CLIE VCH_CLIECIUDAD
----- ------------------------- ------------------------- ------------------------------ -------- ----------------------------
00001 CORONEL                   CASTILLO                  ERIC GUSTAVO                   06914897 LIMA
00002 VALENCIA                  MORALES                   PEDRO HUGO                     01576173 LIMA
00003 MARCELO                   VILLALOBOS                RICARDO                        10762367 LIMA
00004 ROMERO                    CASTILLO                  CARLOS ALBERTO                 06531983 LIMA
00005 ARANDA                    LUNA                      ALAN ALBERTO                   10875611 LIMA
00006 AYALA                     PAZ                       JORGE LUIS                     10679245 LIMA
00007 CHAVEZ                    CANALES                   EDGAR RAFAEL                   10145693 LIMA
00008 FLORES                    CHAFLOQUE                 ROSA LIZET                     10773456 LIMA
00009 FLORES                    SHUTE                     CRISTIAN RAFAEL                10346723 LIMA
00010 GONZALES                  GARCIA                    GABRIEL ALEJANDRO              10192376 LIMA
00011 LAY                       VALLEJOS                  JUAN CARLOS                    10942287 LIMA
00012 MONTALVO                  SOTO                      DEYSI LIDIA                    10612376 LIMA
00013 RICALDE                   RAMIREZ                   ROSARIO ESMERALDA              10761324 LIMA
00014 RODRIGUEZ                 RAMOS                     ENRIQUE MANUEL                 10773345 LIMA
00015 ROJAS                     OSCANOA                   FELIX NINO                     10238943 LIMA
00016 TEJADA                    DEL AGUILA                TANIA LORENA                   10446791 LIMA
00017 VALDEVIESO                LEYVA                     ROXANA                         10452682 LIMA
00018 VALENTIN                  COTRINA                   JUAN DIEGO                     10398247 LIMA
00019 YAURICASA                 BAUTISTA                  YESABETH                       10934584 LIMA
00020 ZEGARRA                   GARCIA                    FERNANDO MOISES                10772365 LIMA

20 filas seleccionadas.



-- EDUCA

SQL> conn system/oracle
Conectado.

SQL> @C:\EGCC\databases\EDUCA\Oracle\ModeloOracle.sql

SQL> select * from cat;

TABLE_NAME                     TABLE_TYPE
------------------------------ -----------
ALUMNO                         TABLE
CURSO                          TABLE
MATRICULA                      TABLE
PAGO                           TABLE

































