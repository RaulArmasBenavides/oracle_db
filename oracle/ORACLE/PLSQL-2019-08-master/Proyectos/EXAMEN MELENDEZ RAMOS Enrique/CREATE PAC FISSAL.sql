-- Create table
create table SCOTT.SIS_REG_PAC_FISSAL_CAB
(
  cod_tipo_historia             VARCHAR2(2),
  cod_historia_paciente         VARCHAR2(7),
  cod_condicion_ss              VARCHAR2(2),
  fec_registro                  DATE,
  cod_dpto_actual               VARCHAR2(4),
  des_filiacion_sis             VARCHAR2(15),
  des_edad_paciente             VARCHAR2(3),
  cod_evaluacion_ss             VARCHAR2(2),
  ind_estado                    VARCHAR2(1) not null,
  aud_ip_maquina                VARCHAR2(15),
  aud_des_nombre_maquina        VARCHAR2(50),
  aud_fec_registro              DATE default sysdate,
  aud_usuario_registra          VARCHAR2(20),
  aud_fec_modificacion          DATE,
  aud_usuario_reg_mod           VARCHAR2(20)
)