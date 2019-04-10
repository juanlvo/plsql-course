--write a PL/SQL block to print the first name and the last name for employee=100
select first_name, last_name
from hr.employees
where employee_id=100;

declare
v_fname employees.first_name%type;
v_lname employees.last_name%type;
begin

select first_name, last_name
into v_fname, v_lname
from hr.employees
where employee_id=100;

dbms_output.put_line('first name: '||v_fname);
dbms_output.put_line('last name: '||v_lname);
end;

--example of exception

declare
v_fname employees.first_name%type;
v_lname employees.last_name%type;
begin

select first_name, last_name
into v_fname, v_lname
from hr.employees
where employee_id=9000;

dbms_output.put_line('first name: '||v_fname);
dbms_output.put_line('last name: '||v_lname);
end;
