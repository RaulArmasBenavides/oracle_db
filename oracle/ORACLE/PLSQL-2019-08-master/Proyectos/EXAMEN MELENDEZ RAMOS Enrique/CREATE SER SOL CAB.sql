-- Create table
create table SCOTT.SER_SOL_ORDEN_DPTO_MEDICO_CAB
(
  num_sol_orden_servicio        VARCHAR2(12) not null,
  cod_servicio_procesa          VARCHAR2(4) not null,
  ind_estado                    VARCHAR2(1),
  cod_tipo_historia             VARCHAR2(2),
  cod_historia_paciente         VARCHAR2(7),
  cod_condicion_ss              VARCHAR2(2),
  fec_emision_orden             DATE,
  fec_registro_orden            DATE,
  cod_medico_solicita           VARCHAR2(5),
  cod_procedencia               VARCHAR2(2),
  cod_dpto_solicita             VARCHAR2(4),
  cod_servicio_solicita         VARCHAR2(4),
  cod_dpto_actual               VARCHAR2(4),
  cod_cama                      VARCHAR2(5),
  cod_protocolo                 VARCHAR2(2),
  des_filiacion_sis             VARCHAR2(15),
  des_edad_paciente_fecha       VARCHAR2(3),
  cod_tipo_pago                 VARCHAR2(1),
  cod_responsable_cuenta        VARCHAR2(2),
  cod_cia                       VARCHAR2(5),
  num_autorizacion              VARCHAR2(10),
  num_ficha                     VARCHAR2(10),
  num_sec_ficha                 VARCHAR2(2),
  des_anio_ficha                VARCHAR2(4),
  cod_evaluacion_ss             VARCHAR2(2),
  aud_ip_maquina                VARCHAR2(15),
  aud_des_nombre_maquina        VARCHAR2(50),
  aud_fec_registro              DATE default sysdate,
  aud_usuario_registra          VARCHAR2(20),
  aud_fec_modificacion          DATE,
  aud_usuario_reg_mod           VARCHAR2(20)
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
-- Add comments to the table */