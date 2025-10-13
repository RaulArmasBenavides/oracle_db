create or replace package EQUIPO_tapi
is

type EQUIPO_tapi_rec is record (
ESTAEQU  EQUIPO.ESTAEQU%type
,FECHADQU  EQUIPO.FECHADQU%type
,OBSEEQUI  EQUIPO.OBSEEQUI%type
,MARCEQUI  EQUIPO.MARCEQUI%type
,CODIEQUI  EQUIPO.CODIEQUI%type
,PRECEQUI  EQUIPO.PRECEQUI%type
,MODEEQUI  EQUIPO.MODEEQUI%type
);
type EQUIPO_tapi_tab is table of EQUIPO_tapi_rec;

-- insert
procedure ins (
p_ESTAEQU in EQUIPO.ESTAEQU%type
,p_FECHADQU in EQUIPO.FECHADQU%type default null 
,p_OBSEEQUI in EQUIPO.OBSEEQUI%type default null 
,p_MARCEQUI in EQUIPO.MARCEQUI%type default null 
,p_CODIEQUI in EQUIPO.CODIEQUI%type
,p_PRECEQUI in EQUIPO.PRECEQUI%type default null 
,p_MODEEQUI in EQUIPO.MODEEQUI%type default null 
);
-- update
procedure upd (
p_ESTAEQU in EQUIPO.ESTAEQU%type
,p_FECHADQU in EQUIPO.FECHADQU%type default null 
,p_OBSEEQUI in EQUIPO.OBSEEQUI%type default null 
,p_MARCEQUI in EQUIPO.MARCEQUI%type default null 
,p_CODIEQUI in EQUIPO.CODIEQUI%type
,p_PRECEQUI in EQUIPO.PRECEQUI%type default null 
,p_MODEEQUI in EQUIPO.MODEEQUI%type default null 
);
-- delete
procedure del (
p_CODIEQUI in EQUIPO.CODIEQUI%type
);
end EQUIPO_tapi;

/
create or replace package body EQUIPO_tapi
is
-- insert
procedure ins (
p_ESTAEQU in EQUIPO.ESTAEQU%type
,p_FECHADQU in EQUIPO.FECHADQU%type default null 
,p_OBSEEQUI in EQUIPO.OBSEEQUI%type default null 
,p_MARCEQUI in EQUIPO.MARCEQUI%type default null 
,p_CODIEQUI in EQUIPO.CODIEQUI%type
,p_PRECEQUI in EQUIPO.PRECEQUI%type default null 
,p_MODEEQUI in EQUIPO.MODEEQUI%type default null 
) is
begin
insert into EQUIPO(
ESTAEQU
,FECHADQU
,OBSEEQUI
,MARCEQUI
,CODIEQUI
,PRECEQUI
,MODEEQUI
) values (
p_ESTAEQU
,p_FECHADQU
,p_OBSEEQUI
,p_MARCEQUI
,p_CODIEQUI
,p_PRECEQUI
,p_MODEEQUI
);end;
-- update
procedure upd (
p_ESTAEQU in EQUIPO.ESTAEQU%type
,p_FECHADQU in EQUIPO.FECHADQU%type default null 
,p_OBSEEQUI in EQUIPO.OBSEEQUI%type default null 
,p_MARCEQUI in EQUIPO.MARCEQUI%type default null 
,p_CODIEQUI in EQUIPO.CODIEQUI%type
,p_PRECEQUI in EQUIPO.PRECEQUI%type default null 
,p_MODEEQUI in EQUIPO.MODEEQUI%type default null 
) is
begin
update EQUIPO set
ESTAEQU = p_ESTAEQU
,FECHADQU = p_FECHADQU
,OBSEEQUI = p_OBSEEQUI
,MARCEQUI = p_MARCEQUI
,PRECEQUI = p_PRECEQUI
,MODEEQUI = p_MODEEQUI
where CODIEQUI = p_CODIEQUI;
end;
-- del
procedure del (
p_CODIEQUI in EQUIPO.CODIEQUI%type
) is
begin
delete from EQUIPO
where CODIEQUI = p_CODIEQUI;
end;
end EQUIPO_tapi;
