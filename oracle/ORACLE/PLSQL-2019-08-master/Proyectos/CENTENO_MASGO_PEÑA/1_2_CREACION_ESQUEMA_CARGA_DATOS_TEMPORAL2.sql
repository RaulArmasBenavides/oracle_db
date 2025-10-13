--------------------------------------------------------
-- Archivo creado  - domingo-septiembre-15-2019   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table TBL_REPORTE
--------------------------------------------------------

  CREATE GLOBAL TEMPORARY TABLE "INVENTARIO"."TBL_REPORTE" 
   (	"CODIOFIC" NUMBER(38,0), 
	"NOMBOFIC" VARCHAR2(50 BYTE), 
	"MONTO" NUMBER(10,2), 
	"CANTEQUI" NUMBER(38,0)
   ) ON COMMIT PRESERVE ROWS ;
REM INSERTING into INVENTARIO.TBL_REPORTE
SET DEFINE OFF;
Insert into INVENTARIO.TBL_REPORTE (CODIOFIC,NOMBOFIC,MONTO,CANTEQUI) values ('1','INFORMATICA','581,3','2');
Insert into INVENTARIO.TBL_REPORTE (CODIOFIC,NOMBOFIC,MONTO,CANTEQUI) values ('2','PRESUPUESTO','1680,3','2');
Insert into INVENTARIO.TBL_REPORTE (CODIOFIC,NOMBOFIC,MONTO,CANTEQUI) values ('3','ALCALDIA','1730,85','2');
Insert into INVENTARIO.TBL_REPORTE (CODIOFIC,NOMBOFIC,MONTO,CANTEQUI) values ('4','RENTAS','1430,85','2');
Insert into INVENTARIO.TBL_REPORTE (CODIOFIC,NOMBOFIC,MONTO,CANTEQUI) values ('5','TESORERIA','550,3','1');
Insert into INVENTARIO.TBL_REPORTE (CODIOFIC,NOMBOFIC,MONTO,CANTEQUI) values ('6','IMAGEN','0','0');
