create or replace PROCEDURE SP_BUSCARCODIGOUSUARIO (
  cNombres USUARIO.NOMBRES%TYPE,
  cApellidos USUARIO.APELLIDOS%TYPE,
  cCodigo OUT VARCHAR2
  )
AS
  BEGIN
    SELECT codigo INTO cCodigo FROM USUARIO WHERE nombres LIKE cNombres||'%' and apellidos like cApellidos||'%';
    COMMIT;
  END;