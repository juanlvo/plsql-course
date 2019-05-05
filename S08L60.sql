DECLARE
    CURSOR c_emp_dept30 IS
        SELECT employee_id,
                first_name
        FROM employees
        WHERE department_id=30;
BEGIN
    FOR i IN c_emp_dept30
    LOOP
        dbms_output.put_line(i.employee_id||' '||i.first_name);
    END LOOP;
END;
--
DECLARE
BEGIN
    FOR i IN (SELECT employee_id,
                        first_name
                FROM employees
                WHERE department_id=30)
    LOOP
        dbms_output.put_line(i.employee_id||' '||i.first_name);
    END LOOP;            
END;