declare
v_empno number := 10;
v_ename varchar2(100) := 'Juan';
v_salary hr.employees.salary%TYPE;
v_hire_period interval year to month;
v_empno1 v_empno%type;
begin
dbms_output.put_line(v_empno);
dbms_output.put_line(v_ename);
v_salary := 5000;
dbms_output.put_line(v_salary);
v_hire_period := '1-3';
dbms_output.put_line(v_hire_period);
dbms_output.put_line(v_empno1);
end;
