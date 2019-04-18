SELECT employee_id,
        first_name,
        salary,
        department_id,
        case department_id
        when 90 then salary*1.1
        when 60 then salary*1.2
        when 100 then salary*1.3
        else salary
        end new_sal
from employees;
-------
SELECT employee_id,
        first_name,
        salary,
        department_id,
        case 
        when department_id=90 then salary*1.1
        when department_id=60 then salary*1.2
        when department_id=100 then salary*1.3
        else salary
        end new_sal
from employees;
--------------
DECLARE
    v_sal NUMBER;
    v_desc VARCHAR2(100);
BEGIN
    SELECT salary INTO v_sal
    FROM employees
    WHERE employee_id=&emp_id;
    
    v_desc:=case
    when v_sal is null then 'no salary for the employee'
    when v_sal between 1000 and 3000 then 'salary is low'
    when v_sal between 3001 and 5000 then 'salary is medium'
    when v_sal between 5001 and 10000 then 'salary is good'
    else 'salary is high'
    end;
    dbms_output.put_line(v_desc);
END;
------------------

DECLARE
    v_sal NUMBER;
    v_desc varchar2(100);
BEGIN
    SELECT salary into v_sal
    FROM employees
    WHERE employee_id=&emp_id;
    
    CASE
    WHEN v_sal IS NULL THEN
        dbms_output.put_line('no salary for the employee');
    WHEN v_sal BETWEEN 1000 AND 3000 THEN
        dbms_output.put_line('the salary is low');
    WHEN v_sal BETWEEN 3001 AND 5000 THEN
        dbms_output.put_line('the salary is medium');
    WHEN v_sal BETWEEN 5001 AND 10000 THEN
        dbms_output.put_line('the salary is good');
    ELSE
        dbms_output.put_line('the salary is high');
    END CASE;
END;
