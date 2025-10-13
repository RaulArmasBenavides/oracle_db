create or replace procedure sp_UPDATE_EMPLEADO(inCODIEMPL in number, inDNIEMPL in char, inAPELEMPL in varchar2, inAPELMATE in varchar2,
inNOMBEMPL in varchar2, inCUENEMPL in varchar2, inPASSEMPL in varchar2 ,inESTEMPL in char )
is
v_codiemp integer;
begin
SELECT CODIEMPL into v_codiemp FROM EMPLEADO WHERE CODIEMPL=inCODIEMPL FOR UPDATE;

 UPDATE EMPLEADO
    SET PASSEMPL   = inPASSEMPL ,
      DNIEMPL      = inDNIEMPL ,
      NOMBEMPL     = inNOMBEMPL ,
      CUENEMPL     = inCUENEMPL ,
      APELEMPL     = inAPELEMPL ,
      ESTEMPL      = inESTEMPL ,
      APELMATE     = inAPELMATE
    WHERE CODIEMPL = inCODIEMPL;
    
commit;
end;