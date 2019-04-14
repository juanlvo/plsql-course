select *
from employees
where department_id=20;

--

declare
v_rows_update number := 0;
begin
    update employees
    set salary=salary+100
    where department_id=20;
    
    v_rows_update := sql%rowcount;
    
    dbms_output.put_line('the number of records that was updated: '||v_rows_update);
    
end;

--

declare
    v_rows_exists boolean:=true;
begin
    update employees
    set salary=salary+100
    where department_id = 9999;
    
    v_rows_exists:=sql%found;
    
    if v_rows_exists=false then
        dbms_output.put_line('the sql contains no records retrieved');
    else
        dbms_output.put_line('the sql contains records retrieved '||sql%rowcount);
    end if;
end;