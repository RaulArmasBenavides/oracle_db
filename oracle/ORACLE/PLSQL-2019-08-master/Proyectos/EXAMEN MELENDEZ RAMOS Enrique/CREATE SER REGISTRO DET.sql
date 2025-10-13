-- Create table
create table SCOTT.SER_REGISTRO_ORDEN_DET
(
  cod_servicio_registro         VARCHAR2(4) not null,
  num_reg_orden_servicio        VARCHAR2(12) not null,
  cod_tarifario                 VARCHAR2(10) not null,
  des_version_tarifario         VARCHAR2(2) not null,
  des_secuencial                VARCHAR2(2) not null,
  cod_tipo_doc_fac_caja         VARCHAR2(2),
  des_num_doc_fac_caja          VARCHAR2(8),
  num_serie                     VARCHAR2(8),
  cod_tecnologo                 VARCHAR2(6),
  tip_placa                     VARCHAR2(2),
  tip_placa_danada              VARCHAR2(2),
  val_num_placas_estimadas      NUMBER(5),
  val_placas_malogradas         NUMBER(5),
  ind_estado_informe            VARCHAR2(1),
  cod_sub_servicio              VARCHAR2(2),
  val_cantidad                  NUMBER(5) not null,
  ind_estado                    VARCHAR2(1) not null,
  ind_origen_cancelacion        VARCHAR2(1),
  ind_protocolo                 VARCHAR2(1),
  ind_transferencia_cta_cte     VARCHAR2(1),
  num_acto_medico               VARCHAR2(11),
  val_cantidad_unit_desdoblada  VARCHAR2(2),
  aud_ip_maquina                VARCHAR2(15),
  aud_des_nombre_maquina        VARCHAR2(50),
  aud_fec_registro              DATE default sysdate,
  aud_usuario_registra          VARCHAR2(20),
  ind_transfe_hospitalizacion   VARCHAR2(1),
  ind_transferencia_protocolo   VARCHAR2(1),
  ind_transferencia_sis         VARCHAR2(1),
  cod_responsable_cta_real      VARCHAR2(7),
  cod_responsable_cta_aceptado  VARCHAR2(7),
  ind_modalidad_ingreso_res_cta VARCHAR2(1),
  aud_ip_maquina_mod            VARCHAR2(15),
  aud_des_nombre_maquina_mod    VARCHAR2(50),
  aud_fec_modificacion          DATE,
  aud_usuario_reg_mod           VARCHAR2(20),
  ind_transfe_cuenta            VARCHAR2(1),
  cod_grupo_marcador            VARCHAR2(2),
  cod_tecnologo_laboratorio     VARCHAR2(6),
  fec_recepcion_tecnologo       DATE,
  cod_usua_recepciona_muestra   VARCHAR2(10),
  fec_recepcion_muestra         DATE,
  ind_uso                       VARCHAR2(1),
  ind_turno                     VARCHAR2(1),
  cod_medico_realiza            VARCHAR2(7),
  ind_tecnologo_anula           VARCHAR2(1),
  num_autorizacion              VARCHAR2(10),
  num_ficha                     VARCHAR2(10),
  num_pre_orden                 VARCHAR2(10),
  cod_paquete                   VARCHAR2(10),
  des_version_tarifario_pq      VARCHAR2(2),
  des_num_interno_seccion       VARCHAR2(6),
  sec_autorizacion              VARCHAR2(10),
  ind_agrupa                    VARCHAR2(10),
  des_num_registro              VARCHAR2(12),
  id_registro_ris               NUMBER,
  ind_ingresa_cta               VARCHAR2(1)
)
/*tablespace DATA_DINAMICA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 400M
    next 1M
    minextents 1
    maxextents unlimited
  );
-- Add comments to the table */