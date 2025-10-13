CREATE TABLE USUARIO (
       CODIGO          char(5) NOT NULL,
       NOMBRES         varchar2(50) NOT NULL,
       APELLIDOS       varchar2(50) NOT NULL,
       CONSTRAINT pkUsuario PRIMARY KEY(CODIGO)
); 


CREATE TABLE RESPUESTA (
       ID             numeric NOT NULL,
       CODIGO         char(5) NOT NULL,
       OPINION        varchar2(50) NOT NULL,
       COMENTARIO     varchar2(100) NULL,
       CONSTRAINT pkRespuesta PRIMARY KEY(ID),
       CONSTRAINT fkRespuestaUsuario
            FOREIGN KEY(CODIGO)
            REFERENCES USUARIO(CODIGO)); 
            
insert into usuario values ('P0001','Carlos','Euribe')
insert into usuario values ('P0003','Luis','Salas')
insert into usuario values ('P0003','Juan','Lopez')