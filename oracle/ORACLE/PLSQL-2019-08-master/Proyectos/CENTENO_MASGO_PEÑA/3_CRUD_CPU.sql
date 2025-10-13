create or replace package CPU_tapi
is

type CPU_tapi_rec is record (
CODIPATRCPU  CPU.CODIPATRCPU%type
,ESTACPU  CPU.ESTACPU%type
,MEMORAM  CPU.MEMORAM%type
,CODICPU  CPU.CODICPU%type
,CODIEQUI  CPU.CODIEQUI%type
,NOMBEQUI  CPU.NOMBEQUI%type
,PROCCPU  CPU.PROCCPU%type
,DISCDURO  CPU.DISCDURO%type
);
type CPU_tapi_tab is table of CPU_tapi_rec;

-- insert
procedure ins (
p_CODIPATRCPU in CPU.CODIPATRCPU%type
,p_ESTACPU in CPU.ESTACPU%type
,p_MEMORAM in CPU.MEMORAM%type default null 
,p_CODICPU in CPU.CODICPU%type
,p_CODIEQUI in CPU.CODIEQUI%type
,p_NOMBEQUI in CPU.NOMBEQUI%type default null 
,p_PROCCPU in CPU.PROCCPU%type default null 
,p_DISCDURO in CPU.DISCDURO%type default null 
);
-- update
procedure upd (
p_CODIPATRCPU in CPU.CODIPATRCPU%type
,p_ESTACPU in CPU.ESTACPU%type
,p_MEMORAM in CPU.MEMORAM%type default null 
,p_CODICPU in CPU.CODICPU%type
,p_CODIEQUI in CPU.CODIEQUI%type
,p_NOMBEQUI in CPU.NOMBEQUI%type default null 
,p_PROCCPU in CPU.PROCCPU%type default null 
,p_DISCDURO in CPU.DISCDURO%type default null 
);
-- delete
procedure del (
p_CODIPATRCPU in CPU.CODIPATRCPU%type
);
end CPU_tapi;

/
create or replace package body CPU_tapi
is
-- insert
procedure ins (
p_CODIPATRCPU in CPU.CODIPATRCPU%type
,p_ESTACPU in CPU.ESTACPU%type
,p_MEMORAM in CPU.MEMORAM%type default null 
,p_CODICPU in CPU.CODICPU%type
,p_CODIEQUI in CPU.CODIEQUI%type
,p_NOMBEQUI in CPU.NOMBEQUI%type default null 
,p_PROCCPU in CPU.PROCCPU%type default null 
,p_DISCDURO in CPU.DISCDURO%type default null 
) is
begin
insert into CPU(
CODIPATRCPU
,ESTACPU
,MEMORAM
,CODICPU
,CODIEQUI
,NOMBEQUI
,PROCCPU
,DISCDURO
) values (
p_CODIPATRCPU
,p_ESTACPU
,p_MEMORAM
,p_CODICPU
,p_CODIEQUI
,p_NOMBEQUI
,p_PROCCPU
,p_DISCDURO
);end;
-- update
procedure upd (
p_CODIPATRCPU in CPU.CODIPATRCPU%type
,p_ESTACPU in CPU.ESTACPU%type
,p_MEMORAM in CPU.MEMORAM%type default null 
,p_CODICPU in CPU.CODICPU%type
,p_CODIEQUI in CPU.CODIEQUI%type
,p_NOMBEQUI in CPU.NOMBEQUI%type default null 
,p_PROCCPU in CPU.PROCCPU%type default null 
,p_DISCDURO in CPU.DISCDURO%type default null 
) is
begin
update CPU set
ESTACPU = p_ESTACPU
,MEMORAM = p_MEMORAM
,CODICPU = p_CODICPU
,CODIEQUI = p_CODIEQUI
,NOMBEQUI = p_NOMBEQUI
,PROCCPU = p_PROCCPU
,DISCDURO = p_DISCDURO
where CODIPATRCPU = p_CODIPATRCPU;
end;
-- del
procedure del (
p_CODIPATRCPU in CPU.CODIPATRCPU%type
) is
begin
delete from CPU
where CODIPATRCPU = p_CODIPATRCPU;
end;
end CPU_tapi;
