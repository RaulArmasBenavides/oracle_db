-- Create table
create table SCOTT.HOS_CUENTA_APERTURA_CAB
(
  num_cuenta                  VARCHAR2(10) not null,
  des_secuencial_cuenta       VARCHAR2(3) not null,
  num_orden_hospitalizacion   VARCHAR2(10),
  ind_origen_cta              VARCHAR2(1),
  cod_tipo_historia           VARCHAR2(2),
  cod_historia_paciente       VARCHAR2(8),
  fec_apertura                DATE,
  fec_cierre                  DATE,
  ind_cancelado               VARCHAR2(1),
  ind_estado                  VARCHAR2(1),
  cod_colegio_medico          VARCHAR2(7),
  cod_cia                     VARCHAR2(5),
  cod_condicion_ss            VARCHAR2(2),
  cod_evaluacion_ss           VARCHAR2(2),
  des_observaciones           VARCHAR2(100),
  aud_ip_maquina              VARCHAR2(15),
  aud_des_nombre_maquina      VARCHAR2(60),
  aud_fec_ultima_modificacion DATE,
  aud_cod_usuario             VARCHAR2(10),
  ind_tipo_atencion           VARCHAR2(1),
  ind_carta_compromiso        VARCHAR2(1),
  ind_cambio_responsable_cta  VARCHAR2(1),
  val_monto_exceso            NUMBER(15,2),
  ind_migra                   VARCHAR2(1),
  tipo_doc_pago_fd            VARCHAR2(2),
  num_serie_fd                VARCHAR2(3),
  num_doc_fd                  VARCHAR2(8),
  cod_trabajador              VARCHAR2(10),
  ind_cta_trans               VARCHAR2(1),
  ind_abre_cta                VARCHAR2(1),
  cod_motivo_atencion         VARCHAR2(3),
  aud_fec_anula_cta           DATE,
  aud_usuario_anula           VARCHAR2(10),
  ind_anulado                 VARCHAR2(1)
)
/*tablespace DATA_DINAMICA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 23M
    next 1M
    minextents 1
    maxextents unlimited
  );
-- Add comments to the columns */
