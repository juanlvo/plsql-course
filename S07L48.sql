DECLARE
    TYPE t_EMP IS RECORD
    (   v_emp_id     employees.employee_id%type,
        v_first_name employees.first_name%type,
        v_last_name  employees.last_name%type
    );
    v_emp t_EMP;
BEGIN
    SELECT employee_id,
            first_name,
            last_name
    INTO v_emp
    FROM employees
    WHERE employee_id=100;
    
    dbms_output.put_line(v_emp.v_emp_id||' '||v_emp.v_first_name||' '||v_emp.v_last_name);
END;
