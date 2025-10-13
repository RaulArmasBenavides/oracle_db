--set serveroutput on;
DECLARE
LS_SERVICIO                    SCOTT.SER_REGISTRO_ORDEN_CAB.COD_SERVICIO_REGISTRO%TYPE := '0100';
LS_NUM_ORDEN                   SCOTT.SER_REGISTRO_ORDEN_CAB.NUM_REG_ORDEN_SERVICIO%TYPE := '000000000001';
LS_COD_SEC                     SCOTT.SER_REGISTRO_ORDEN_DET.DES_SECUENCIAL%TYPE := '02';
--variables del procedure
ls_cuenta                 SCOTT.HOS_CUENTA_APERTURA_CAB.NUM_CUENTA%TYPE;
ls_secuencial             SCOTT.HOS_CUENTA_APERTURA_CAB.DES_SECUENCIAL_CUENTA%TYPE;
ls_ind_caja               SCOTT.ser_sol_orden_dpto_medico_det.ind_caja%type;
ls_responsable_cta        SCOTT.ser_registro_orden_cab.COD_RESPONSABLE_CUENTA%type;
ln_precio                 NUMBER(12,2);
LS_ATENCION               VARCHAR2(1);
LI_ENCONTRADO             NUMBER(2);
ls_tarifa                 varchar2(2);
ls_cod_condicion_ss       varchar2(5);
CURSOR LEE_ORDEN_LAB_CAB IS
  SELECT c.cod_servicio_registro,         c.num_reg_orden_servicio,          c.num_sol_orden_servicio,
         c.cod_servicio_procesa,          c.cod_tipo_historia,               c.cod_historia_paciente,
         c.cod_condicion_ss,              c.fec_emision_orden,               c.fec_registro_orden,
         c.cod_procedencia,               c.cod_dpto_solicita,
         c.cod_servicio_solicita,         c.cod_dpto_actual,                 c.cod_cama,
         c.cod_protocolo,                 c.des_filiacion_sis,               c.des_edad_paciente_fecha,
         c.aud_ip_maquina,                c.aud_des_nombre_maquina,          c.aud_fec_registro,
         c.cod_tipo_pago,                 c.Cod_responsable_cuenta,          c.cod_cia,
         c.num_autorizacion,              c.num_ficha,                       c.num_sec_ficha,
         c.des_anio_ficha,                c.cod_evaluacion_ss
   FROM SCOTT.SER_REGISTRO_ORDEN_CAB C
  WHERE C.COD_SERVICIO_REGISTRO  = LS_SERVICIO
    AND C.NUM_REG_ORDEN_SERVICIO = LS_NUM_ORDEN;
    --nvl((select d.cod_cia from  SCOTT.hos_autoriza_examen_cab d where d.n_autorizacion=num_autorizacion),0) as cod_cia,
/*CURSOR LEE_ORDEN_LAB_DET IS
--@ emelendez añadir al cursor el secuencial para identificarlo
  SELECT d.cod_servicio_registro,  d.num_reg_orden_servicio,         d.cod_tarifario,
         d.des_version_tarifario,  d.val_cantidad,                   d.ind_estado,
         d.sec_autorizacion,       d.des_secuencial
    FROM SCOTT.SER_REGISTRO_ORDEN_DET D
   WHERE D.COD_SERVICIO_REGISTRO   =  LS_SERVICIO
     AND D.NUM_REG_ORDEN_SERVICIO  =  LS_NUM_ORDEN
     AND D.DES_SECUENCIAL          =  LS_COD_SEC;*/
--fin variables del procedure

--ln_precio number(12,2);
--ls_tarifa varchar2(2);
--LI_ENCONTRADO NUMBER(2);
--LS_SECUENCIAL VARCHAR2(2);
LS_cod_servicio_registro       SCOTT.SER_REGISTRO_ORDEN_DET.COD_SERVICIO_REGISTRO%TYPE;
LS_num_reg_orden_servicio      SCOTT.SER_REGISTRO_ORDEN_DET.NUM_REG_ORDEN_SERVICIO%TYPE;
LS_cod_tarifario               SCOTT.SER_REGISTRO_ORDEN_DET.COD_TARIFARIO%TYPE;
LS_des_version_tarifario       SCOTT.SER_REGISTRO_ORDEN_DET.DES_VERSION_TARIFARIO%TYPE;
LS_val_cantidad                SCOTT.SER_REGISTRO_ORDEN_DET.VAL_CANTIDAD%TYPE;
LS_ind_estado                  SCOTT.SER_REGISTRO_ORDEN_DET.IND_ESTADO%TYPE;
LS_sec_autorizacion            SCOTT.SER_REGISTRO_ORDEN_DET.SEC_AUTORIZACION%TYPE;
LS_des_secuencial              SCOTT.SER_REGISTRO_ORDEN_DET.DES_SECUENCIAL%TYPE;
j                              SCOTT.SER_REGISTRO_ORDEN_DET.DES_SECUENCIAL%TYPE;--varchar2(2);
CURSOR MAX_SECUENCIAL IS
  SELECT MAX(S.DES_SECUENCIAL)
  FROM SCOTT.SER_REGISTRO_ORDEN_DET S
  WHERE S.COD_SERVICIO_REGISTRO = LS_SERVICIO
  AND S.NUM_REG_ORDEN_SERVICIO = LS_NUM_ORDEN;
     
BEGIN

       FOR C_F IN LEE_ORDEN_LAB_CAB LOOP
           ls_responsable_cta := C_F.cod_responsable_cuenta;
           if c_f.cod_tipo_pago in ('01') then -- tipo de pago al contado
              LS_IND_CAJA :='1';
           else
              ls_ind_caja:='0';
           end if ;

          IF C_F.cod_responsable_cuenta IN  ('AUS','SIS','CLI','HOS') THEN

              BEGIN
                 if C_F.Cod_Cia=0 then-- cargar a la compañia
                  SELECT MAX(C.NUM_CUENTA)    ---cuenta activa
                         INTO ls_cuenta
                         FROM SCOTT.HOS_CUENTA_APERTURA_CAB C
                        WHERE C.COD_TIPO_HISTORIA     = C_F.COD_TIPO_HISTORIA
                          AND C.COD_HISTORIA_PACIENTE = C_F.COD_HISTORIA_PACIENTE;

                        SELECT C.DES_SECUENCIAL_CUENTA
                         INTO ls_secuencial           --- secuencia de cta
                         FROM SCOTT.HOS_CUENTA_APERTURA_CAB C
                        WHERE C.COD_TIPO_HISTORIA     = C_F.COD_TIPO_HISTORIA
                          AND C.COD_HISTORIA_PACIENTE = C_F.COD_HISTORIA_PACIENTE
                          AND C.NUM_CUENTA = ls_cuenta
                          AND C.DES_SECUENCIAL_CUENTA = ( SELECT MAX(C.DES_SECUENCIAL_CUENTA)
                                                            FROM SCOTT.HOS_CUENTA_APERTURA_CAB C
                                                           WHERE C.COD_TIPO_HISTORIA     = C_F.COD_TIPO_HISTORIA
                                                             AND C.COD_HISTORIA_PACIENTE = C_F.COD_HISTORIA_PACIENTE
                                                             AND C.IND_ESTADO            = '1');
                  else--cargar al paciente
                   SELECT C.NUM_CUENTA, C.DES_SECUENCIAL_CUENTA
                       INTO ls_cuenta, ls_secuencial
                       FROM SCOTT.HOS_CUENTA_APERTURA_CAB C
                      WHERE C.COD_HISTORIA_PACIENTE IS NULL
                        AND C.COD_CIA = C_F.Cod_Cia
                        AND C.DES_SECUENCIAL_CUENTA = (SELECT MAX(T.DES_SECUENCIAL_CUENTA)
                                                         FROM SCOTT.HOS_CUENTA_APERTURA_CAB T
                                                        WHERE T.COD_HISTORIA_PACIENTE IS NULL
                                                          AND T.COD_CIA = C_F.Cod_Cia
                                                          AND T.IND_ESTADO='1'
                                                          AND T.NUM_CUENTA = C.NUM_CUENTA
                                                          AND T.DES_SECUENCIAL_CUENTA = C.DES_SECUENCIAL_CUENTA);

                 end if;
             EXCEPTION
                   WHEN no_data_found THEN
                        ls_cuenta:= null;
                        ls_secuencial := null;
               END;

         END IF ;
/*
          IF C_F.cod_responsable_cuenta = 'PACIENT' THEN -- PACIENTE Q PAGO AL CONTADO

             BEGIN

                  SELECT DISTINCT R.NUM_CUENTA, R.DES_SECUENCIA_CUENTA
                    INTO ls_cuenta , ls_secuencial             -- CUENTA, SECUENCIA DE CTA
                    FROM SCOTT.SER_REGISTRO_ORDEN_DET D,
                         SCOTT.REC_COMPROBANTE_PAGO_CAB R
                   WHERE D.COD_TIPO_DOC_FAC_CAJA=R.COD_TIPO_DOCUMENTO
                     AND D.DES_NUM_DOC_FAC_CAJA=R.DES_NUM_DOCUMENTO
                     AND D.NUM_SERIE=R.NUM_SERIE
                     AND D.COD_SERVICIO_REGISTRO=LS_SERVICIO
                     AND D.NUM_REG_ORDEN_SERVICIO= LS_NUM_ORDEN;

           EXCEPTION
                   WHEN no_data_found THEN
                        ls_cuenta:= null;
                        ls_secuencial := null;
               END;
          END IF ;
*/

         ls_cod_condicion_ss := C_F.cod_condicion_ss;
         if ls_cod_condicion_ss is null then
            ls_cod_condicion_ss:= '05';--SCOTT.sf_busca_cod_cond_paciente(pvi_cod_tipo_historia => C_F.COD_TIPO_HISTORIA,pvi_cod_historia_paciente => C_F.cod_historia_paciente);
         end if ;
         if  ls_cod_condicion_ss = '05' then
             if  nvl(SCOTT.SF_BUSCA_PACIENTE_FISSAL(C_F.COD_TIPO_HISTORIA,C_F.cod_historia_paciente), '0') = '0' then
                  ls_tarifa := '06';--SCOTT.SF_BUSCA_TARIFA(ls_cod_condicion_ss)  ;
              else
                  if SCOTT.SF_BUSCA_PACIENTE_FISSAL(C_F.COD_TIPO_HISTORIA,C_F.cod_historia_paciente) = 'FISSAL' then
                     ls_tarifa := '09';
                  else
                      ls_tarifa := '06';
                  end if;
            end if;
        else
            ls_tarifa := '03';--SCOTT.SF_BUSCA_TARIFA(ls_cod_condicion_ss);
        end if;

          IF SCOTT.SF_BUSCA_PACIENTE_HOSPITAL(C_F.cod_tipo_historia,C_F.cod_historia_paciente) = '1' THEN LS_ATENCION :='2'; ELSE LS_ATENCION :='1'; END IF ;

           SELECT count(*)
             INTO LI_ENCONTRADO
             FROM SCOTT.SER_REGISTRO_ORDEN_CAB C
            WHERE C.COD_SERVICIO_REGISTRO  = LS_SERVICIO
              AND C.NUM_REG_ORDEN_SERVICIO = LS_NUM_ORDEN
              AND C.NUM_SOL_ORDEN_SERVICIO IS NOT NULL;
              
              dbms_output.put_line(LI_ENCONTRADO||','||'CABECERA');
              
          IF LI_ENCONTRADO=0 THEN

          /*INSERT INTO SER_SOL_ORDEN_DPTO_MEDICO(
                 num_sol_orden_servicio,       cod_servicio_procesa,        cod_colegio_medico,
                 cod_tipo_historia,            cod_historia_paciente,       cod_condicion,cod_evaluacion ,
                 fec_emision_orden,            cod_dpto_solicita,           cod_servicio_solicita,
                 tip_atencion,                 ind_estado,                  cod_dpto_pertenece_paciente,
                 cod_procedencia,              des_filiacion_sis,           cod_cama,
                 fec_registro_orden,           des_edad,                    aud_ip_maquina,
                 aud_des_nombre_maquina,       aud_fec_ultima_modificacion, aud_usuario ,
                 cod_responsable_cuenta,       num_cuenta,                  Des_Secuencial_Cuenta,
                 num_ficha,                    num_sec_ficha,               des_anio_ficha  )

          VALUES(LS_NUM_ORDEN,                 C_F.cod_servicio_registro,   C_F.cod_medico_solicita,
                 C_F.cod_tipo_historia,        C_F.cod_historia_paciente,   C_F.cod_condicion_ss, C_F.Cod_Evaluacion_Ss,
                 C_F.fec_emision_orden,        C_F.cod_dpto_solicita,       C_F.cod_servicio_solicita,
                 LS_ATENCION,                 '2',                          C_F.cod_dpto_actual,
                 C_F.cod_procedencia,          C_F.des_filiacion_sis,       C_F.cod_cama,
                 C_F.fec_registro_orden,       C_F.des_edad_paciente_fecha, C_F.aud_ip_maquina,
                 C_F.aud_des_nombre_maquina,   C_F.aud_fec_registro,        C_F.aud_usuario,
                 c_f.cod_responsable_cuenta,   ls_cuenta,                   ls_secuencial,
                 c_f.num_ficha,                c_f.num_sec_ficha,           c_f.des_anio_ficha) ;

           UPDATE SER_REGISTRO_ORDEN_CAB
              SET NUM_SOL_ORDEN_SERVICIO = LS_NUM_ORDEN,
                  COD_SERVICIO_PROCESA   = LS_SERVICIO
            WHERE COD_SERVICIO_REGISTRO  = LS_SERVICIO
              AND NUM_REG_ORDEN_SERVICIO = LS_NUM_ORDEN;*/
              dbms_output.put_line('INSERT,UPDATE,CABECERA');

          ELSE

           /*UPDATE SER_SOL_ORDEN_DPTO_MEDICO A
              SET cod_procedencia              = C_F.cod_procedencia
                 ,cod_dpto_solicita           = C_F.cod_dpto_solicita
                 -------------------------------------------------------
                 ,num_cuenta                  = ls_cuenta
                 ,des_secuencial_cuenta       = ls_secuencial
                 --------------------------------------------------------
                 ,cod_servicio_solicita       = C_F.cod_servicio_solicita
                 ,cod_colegio_medico          = C_F.cod_medico_solicita
                 ,fec_emision_orden           = C_F.fec_emision_orden
                 ,aud_ip_maquina              = C_F.aud_ip_maquina
                 ,aud_des_nombre_maquina      = C_F.aud_des_nombre_maquina
                 ,aud_fec_ultima_modificacion = C_F.aud_fec_registro
                 ,aud_usuario                 = C_F.aud_usuario
                 ,cod_responsable_cuenta      = C_F.cod_responsable_cuenta
            WHERE A.NUM_SOL_ORDEN_SERVICIO    = LS_NUM_ORDEN
              AND A.COD_SERVICIO_PROCESA      = LS_SERVICIO;*/
              dbms_output.put_line('UPDATE,CABECERA');
           END IF ;

--agregar el for del dt
          SELECT MAX(S.DES_SECUENCIAL)
            INTO LS_SECUENCIAL
            FROM SCOTT.SER_REGISTRO_ORDEN_DET S
            WHERE S.COD_SERVICIO_REGISTRO = LS_SERVICIO
            AND S.NUM_REG_ORDEN_SERVICIO = LS_NUM_ORDEN;
            /*OPEN MAX_SECUENCIAL;
            FETCH MAX_SECUENCIAL INTO LS_SECUENCIAL;
                  IF MAX_SECUENCIAL%NOTFOUND THEN
                    LS_SECUENCIAL :='0';
                  END IF;
            CLOSE MAX_SECUENCIAL;*/
            dbms_output.put_line(LS_SECUENCIAL||','||'MAX_SEC_DET');
            FOR i IN 1..TO_NUMBER(LS_SECUENCIAL)
              LOOP
                j := i;
                j := lpad(j,2,'0');

                SELECT COUNT(*)
                INTO LI_ENCONTRADO
                FROM SCOTT.SER_SOL_ORDEN_DPTO_MEDICO_DET S
                WHERE S.COD_SERVICIO_PROCESA = LS_SERVICIO
                AND S.NUM_SOL_ORDEN_SERVICIO = LS_NUM_ORDEN
                AND S.DES_SECUENCIAL         = j
                ;
                dbms_output.put_line(j||'-->'||LI_ENCONTRADO)
                ;
                SELECT d.cod_servicio_registro,     d.num_reg_orden_servicio,          d.cod_tarifario,
                       d.des_version_tarifario,     d.val_cantidad,                    d.ind_estado,
                       d.sec_autorizacion,          d.des_secuencial
                INTO   LS_cod_servicio_registro,    LS_num_reg_orden_servicio,         LS_cod_tarifario,
                       LS_des_version_tarifario,    LS_val_cantidad,                   LS_ind_estado,
                       LS_sec_autorizacion,         LS_des_secuencial
                FROM SCOTT.SER_REGISTRO_ORDEN_DET D
                WHERE D.COD_SERVICIO_REGISTRO =  LS_SERVICIO
                AND D.NUM_REG_ORDEN_SERVICIO  =  LS_NUM_ORDEN
                AND D.DES_SECUENCIAL          =  j
                ;
                dbms_output.put_line(LS_cod_servicio_registro||','||LS_num_reg_orden_servicio||','||LS_cod_tarifario||','||LS_des_version_tarifario||
                                    ','||LS_val_cantidad||','||LS_ind_estado||','||LS_sec_autorizacion||','||LS_des_secuencial)
                ;
                IF LI_ENCONTRADO=0 THEN
                    ln_precio := '10';--SCOTT.SF_BUSCA_PRECIO_TARIFARIO_SERV(LS_cod_tarifario ,LS_des_version_tarifario , ls_tarifa , '' );  --@Erik 1
                    /*INSERT INTO SCOTT.SER_SOL_ORDEN_DPTO_MEDICO_DET (
                    num_sol_orden_servicio,      cod_servicio_procesa,         cod_tarifario,
                    des_version_tarifario,       val_cantidad,                 val_precio,
                    ind_caja,                    ind_registro_orden,           ind_estado,
                    cod_responsable_cuenta,      Sec_Autorizacion,             des_secuencial
                    )
                    VALUES(LS_NUM_ORDEN,         LS_cod_servicio_registro,     LS_cod_tarifario,
                    LS_des_version_tarifario,    LS_val_cantidad,              ln_precio,
                    LS_IND_CAJA,                 '1',                          '1',
                    ls_responsable_cta,          LS_sec_autorizacion,          LS_des_secuencial
                    );*/
                    dbms_output.put_line('INSERT'||','||LS_NUM_ORDEN||','||LS_cod_servicio_registro||','||LS_cod_tarifario||','||LS_des_version_tarifario||
                    ','||LS_val_cantidad||','||ln_precio||','||LS_IND_CAJA||','||'1'||','||'1'||','||ls_responsable_cta||','||LS_sec_autorizacion||','||LS_des_secuencial);
                 ELSE
                    ln_precio := '12';--SCOTT.SF_BUSCA_PRECIO_TARIFARIO_SERV(LS_cod_tarifario ,LS_des_version_tarifario , ls_tarifa , '' );  --@Erik 1
                    dbms_output.put_line('UPDATE'||','||LS_IND_ESTADO||','||LS_VAL_CANTIDAD||','||ln_precio);
                    /*UPDATE SCOTT.SER_SOL_ORDEN_DPTO_MEDICO_DET d
                      SET d.IND_ESTADO             = LS_IND_ESTADO,
                          d.VAL_CANTIDAD           = LS_VAL_CANTIDAD,
                          --cod_responsable_cuenta = ls_responsable_cta
                          d.val_precio             = ln_precio  --@Erik 1
                    WHERE NUM_SOL_ORDEN_SERVICIO = LS_NUM_ORDEN
                      AND COD_SERVICIO_PROCESA   = LS_SERVICIO
                      AND COD_TARIFARIO          = LS_COD_TARIFARIO
                      AND DES_VERSION_TARIFARIO  = LS_DES_VERSION_TARIFARIO
                      AND DES_SECUENCIAL         = LS_DES_SECUENCIAL
                      ;*/
                 END IF;
          END LOOP;
--fin del for

 END LOOP;

   -- Inserta los Items a la CTA
   IF ls_cuenta is not null THEN
   -- Paqra que no cargue a la CTA / VAPC 31/08/2007
      IF ls_responsable_cta not in('Med Aut', 'PAI', 'PROT','DOCEN','NDEFIN','CTABIOP','PAP-COM',' ') THEN
         --SCOTT.SP_PAT_ACTUALIZACION_CTA(ls_cuenta, ls_secuencial, ls_responsable_cta);
         dbms_output.put_line(ls_cuenta||','||ls_secuencial||','||ls_responsable_cta);
      END IF;
   END IF;

   COMMIT;

   EXCEPTION

      WHEN OTHERS THEN
      ROLLBACK;
      DBMS_OUTPUT.put_line(SQLCODE);

END;
/