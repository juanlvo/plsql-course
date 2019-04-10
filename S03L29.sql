select *
from employees
where employee_id=100;

--define a bind variable v_sal to be a number
--create a block to store the salary for employee_id=100 in this variable
--print the variable

--note: number bind variable without size
variable v_sal number
begin
select salary into :v_sal
from employees
where employee_id=100;
end;

print v_sal

--------------------------------------------

variable v_sal number
set autoprint on
begin
select salary into :v_sal
from employees
where employee_id=100;
end;


----------------------------------
--note: varchar2 bind variable should have size
var v_name varchar2(100)
set autoprint on
begin
select first_name into :v_name
from employees
where employee_id=100;
end;
