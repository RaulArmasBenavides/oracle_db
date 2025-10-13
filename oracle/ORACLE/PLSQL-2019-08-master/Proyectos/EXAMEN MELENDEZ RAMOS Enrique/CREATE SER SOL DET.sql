-- Create table
create table SCOTT.SER_SOL_ORDEN_DPTO_MEDICO_DET
(
  num_sol_orden_servicio    VARCHAR2(12) not null,
  cod_servicio_procesa      VARCHAR2(4) not null,
  cod_tarifario             VARCHAR2(10) not null,
  des_version_tarifario     VARCHAR2(2) not null,
  val_cantidad              NUMBER(5),
  val_precio                NUMBER(12,2),
  num_porcentaje_dsto       NUMBER(12,2),
  ind_caja                  VARCHAR2(1),
  num_atencion_ss           VARCHAR2(8),
  ind_registro_orden        VARCHAR2(1),
  ind_resultado             VARCHAR2(1),
  cod_responsable_cuenta    VARCHAR2(7),
  des_num_cobertura         VARCHAR2(8),
  ind_generacion_prefactura VARCHAR2(1),
  num_prefactura            VARCHAR2(10),
  ind_estado                VARCHAR2(1),
  cod_sub_servicio          VARCHAR2(2),
  num_cantidad_usos         NUMBER(5),
  ind_cargado_cta           VARCHAR2(1),
  cod_colegio_medico        VARCHAR2(7),
  ind_tipo_servicio         VARCHAR2(2),
  val_porcentaje            NUMBER(12,2),
  cod_paquete               VARCHAR2(10),
  des_version_tarifario_pq  VARCHAR2(2),
  sec_autorizacion          VARCHAR2(10),
  des_version_perfil        VARCHAR2(2),
  cod_perfil                VARCHAR2(6),
  des_secuencial            VARCHAR2(2),
  ind_act_pre               VARCHAR2(1),
  cod_tarifa_aplicada       VARCHAR2(2)
)
/*tablespace DATA_DINAMICA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 264M
    next 1M
    minextents 1
    maxextents unlimited
  );
-- Add comments to the table*/