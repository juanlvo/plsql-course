declare
v_global varchar2(100) := 'this is a global variable';
begin
    declare
    v_local varchar2(100) := 'this is a local variable';
    begin
    dbms_output.put_line(v_global);
    dbms_output.put_line(v_local);
    end;
dbms_output.put_line(v_global);
end;

---------------------------------

declare
v_father_name varchar2(100) := 'Juan';
v_birthday date := '9-Feb-1985';
begin
    declare
    v_child varchar2(100) := 'Rob';
    v_birthday date := '10-Feb-2020';
    begin
    dbms_output.put_line('the father name is '||v_father_name);
    dbms_output.put_line('the father birthday is '||v_birthday);
    dbms_output.put_line('the child name is '||v_child);
    dbms_output.put_line('the child birthday is '||v_birthday);
    end;
end;

---------------------------------

begin <<outer>>
declare
v_father_name varchar2(100) := 'Juan';
v_birthday date := '9-Feb-1985';
begin
    declare
    v_child varchar2(100) := 'Rob';
    v_birthday date := '10-Feb-2020';
    begin
    dbms_output.put_line('the father name is '||v_father_name);
    dbms_output.put_line('the father birthday is '||outer.v_birthday);
    dbms_output.put_line('the child name is '||v_child);
    dbms_output.put_line('the child birthday is '||v_birthday);
    end;
end;
end outer;
