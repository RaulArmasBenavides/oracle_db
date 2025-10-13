
-- =============================================
-- PARTICIPANTE
-- =============================================
-- Trabajo Final Workshoop Oracle PLSQL
-- Alumno: Nelson Chumbipuma
-- =============================================




SET TERMOUT OFF
SET ECHO OFF

-- =============================================
-- CRACIÓN DEL USUARIO
-- =============================================

DECLARE
	N INT;
	COMMAND VARCHAR2(200);
BEGIN
	COMMAND := 'DROP USER pcompras CASCADE';
	SELECT COUNT(*) INTO N
	FROM DBA_USERS
	WHERE USERNAME = 'pcompras';
	IF ( N = 1 ) THEN
		EXECUTE IMMEDIATE COMMAND;
	END IF;
END;
/

CREATE USER pcompras IDENTIFIED BY admin;

GRANT CONNECT, RESOURCE TO pcompras;
GRANT CREATE VIEW TO pcompras;

--GRANT DBA TO pcompras  (DESDE SYSTEM)

-- =============================================
-- CONECTARSE A ORACLE
-- =============================================

CONNECT pcompras/admin



-- =============================================
-- CREACION DE TABLAS 
-- =============================================


-- =============================================
-- CREACION DE TABLA TIPO_PARTICIPANTE
-- =============================================

CREATE TABLE TIPO_PARTICIPANTE
(
	ID                INTEGER NOT NULL ,
	NOMBRE            VARCHAR2(50) NOT NULL ,
	CONSTRAINT PK_TIPO_PARTICIPANTE PRIMARY KEY( ID ) 
);



-- =============================================
-- CREACION DE TABLA TIPO_PERSONA
-- =============================================

CREATE TABLE TIPO_PERSONA
(
	ID                INTEGER NOT NULL ,
	NOMBRE            VARCHAR2(50) NOT NULL ,
	CONSTRAINT PK_TIPO_PERSONA PRIMARY KEY( ID ) 
);




-- =============================================
-- CREACION DE TABLA MODALIDAD
-- =============================================

CREATE TABLE MODALIDAD
(
	ID                INTEGER NOT NULL ,
	NOMBRE            VARCHAR2(50) NOT NULL ,
	CONSTRAINT PK_MODALIDAD PRIMARY KEY( ID ) 
);




-- =============================================
-- CREACION DE TABLA ITEM
-- =============================================

CREATE TABLE ITEM
(
	ID                INTEGER NOT NULL ,
	NOMBRE            VARCHAR2(100) NOT NULL ,
	IDMODALIDAD		  INTEGER NOT NULL ,
	CONSTRAINT PK_ITEM PRIMARY KEY( ID ), 
	CONSTRAINT FK_ITEM_MODALIDAD
		FOREIGN KEY (IDMODALIDAD) REFERENCES MODALIDAD (ID)	
);






-- =============================================
-- CREACION DE TABLA UNIDAD_TERRITORIAL
-- =============================================

CREATE TABLE UNIDAD_TERRITORIAL
(
	ID                INTEGER NOT NULL ,
	NOMBRE            VARCHAR2(100) NOT NULL ,
	CONSTRAINT PK_UNIDAD_TERRITORIAL PRIMARY KEY( ID ) 
);




-- =============================================
-- CREACION DE TABLA COMITE
-- =============================================

CREATE TABLE COMITE
(
	ID                INTEGER NOT NULL ,
	NOMBRE            VARCHAR2(100) NOT NULL ,
	IDUT		      INTEGER NOT NULL ,
	CONSTRAINT PK_COMITE PRIMARY KEY( ID ), 
	CONSTRAINT FK_COMITE_UT
		FOREIGN KEY (IDUT) REFERENCES UNIDAD_TERRITORIAL (ID)	
);




--

-- =============================================
-- CREACION DE TABLA CONVOCATORIA
-- =============================================

CREATE TABLE CONVOCATORIA
(
	ID                INTEGER NOT NULL ,
	ANIO              INTEGER NOT NULL ,
	NOMBRE            VARCHAR2(100) NOT NULL ,
	CONSTRAINT PK_CONVOCATORIA PRIMARY KEY( ID ) 
);




-- =============================================
-- CREACION DE TABLA OFERTA
-- =============================================

CREATE TABLE OFERTA
(
	ID                INTEGER NOT NULL ,
	IDCONVOCATORIA    INTEGER NOT NULL ,
	IDCOMITE          INTEGER NOT NULL ,
	IDITEM            INTEGER NOT NULL ,
	VALOR_REFERENCIAL NUMBER(10,2) NOT NULL ,
	CONSTRAINT PK_OFERTA PRIMARY KEY( ID ),
	CONSTRAINT FK_OFERTA_CONVOCATORIA
		FOREIGN KEY (IDCONVOCATORIA) REFERENCES CONVOCATORIA (ID),
	CONSTRAINT FK_OFERTA_COMITE
		FOREIGN KEY (IDCOMITE) REFERENCES COMITE (ID),
	CONSTRAINT FK_OFERTA_ITEM
		FOREIGN KEY (IDITEM) REFERENCES ITEM (ID)		
);






-- =============================================
-- CREACION DE TABLA PARTICIPANTE
-- =============================================


CREATE TABLE PARTICIPANTE
(
  ID                     VARCHAR2(15) NOT NULL ,
  NOMBRE_PARTICIPANTE    VARCHAR2(100) NOT NULL ,
  CORREO_PARTICIPANTE    VARCHAR2(100) NOT NULL ,
  CONTRASEÑA             VARCHAR2(100) NOT NULL ,
  IDTIPOPARTICIPANTE     INTEGER NOT NULL ,
  IDTIPOPERSONA          INTEGER NOT NULL ,
  NOMBRE                 VARCHAR2(100) NOT NULL ,
  TELEFONO               VARCHAR2(20) NOT NULL ,
  CORREO                 VARCHAR2(100) NOT NULL ,
  RUC                    NUMBER(11),
  DNI                    NUMBER(8) ,
  DNI_RL                 NUMBER(8) ,
  REPRESENTANTE_LEGAL    VARCHAR2(100) ,
  CONSTRAINT PK_PARTICIPANTE PRIMARY KEY( ID ),
  CONSTRAINT FK_PARTICIPANTE_TIPPAR
    FOREIGN KEY (IDTIPOPARTICIPANTE) REFERENCES TIPO_PARTICIPANTE (ID),
  CONSTRAINT FK_PARTICIPANTE_TIPPER
    FOREIGN KEY (IDTIPOPERSONA) REFERENCES TIPO_PERSONA (ID)    
);






-- =============================================
-- CREACION DE TABLA INTEGRANTE_CONSORCIO
-- =============================================


CREATE TABLE INTEGRANTE_CONSORCIO
(
	ID                      INTEGER NOT NULL ,
	IDPARTICIPANTE     	    VARCHAR2(15) NOT NULL ,
	IDTIPOPERSONA           INTEGER NOT NULL ,
    NOMBRE_INTEGRANTE	    VARCHAR2(100) NOT NULL ,	
	RUC					    NUMBER(11) NOT NULL,
	DNI					    NUMBER(8) ,
	DNI_RL				    NUMBER(8) ,	
	REPRESENTANTE_LEGAL     VARCHAR2(100) ,
	REPRESENTANTE_CONSORCIO VARCHAR2(1),
	CONSTRAINT INTEGRANTE_CONSORCIO PRIMARY KEY( ID ),
	CONSTRAINT FK_INTEGRANTE_PARTICIPANTE
		FOREIGN KEY (IDPARTICIPANTE) REFERENCES PARTICIPANTE (ID),
	CONSTRAINT FK_INTEGRANTE_TIPOPERSONA
		FOREIGN KEY (IDTIPOPERSONA) REFERENCES TIPO_PERSONA (ID)		
);




-- =============================================
-- CREACION DE POSTULACION
-- =============================================

CREATE TABLE POSTULACION
(
	ID                INTEGER NOT NULL ,
	IDPARTICIPANTE    VARCHAR2(15) NOT NULL ,
	IDOFERTA		  INTEGER NOT NULL ,
	CONSTRAINT PK_POSTULACION PRIMARY KEY( ID ), 
	CONSTRAINT FK_POSTULACION_PARTICIPANTE
		FOREIGN KEY (IDPARTICIPANTE) REFERENCES PARTICIPANTE (ID),
	CONSTRAINT FK_POSTULACION_OFERTA
		FOREIGN KEY (IDOFERTA) REFERENCES OFERTA (ID)		
);








-- =============================================
-- HABILITAR SALIDAS
-- =============================================

SET TERMOUT ON
SET ECHO ON
SHOW USER
SET LINESIZE 400
SET PAGESIZE 5000
SELECT * FROM CAT;
SELECT SEQUENCE_NAME, LAST_NUMBER FROM USER_SEQUENCES;
