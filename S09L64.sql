DECLARE
    v_first_name employees.first_name%TYPE;
BEGIN
    SELECT first_name INTO v_first_name
    FROM employees
    WHERE employee_id=1; --there is no employee id = 1
    dbms_output.put_line(v_first_name);
END;
----
DECLARE
    v_first_name employees.first_name%TYPE;
BEGIN
    SELECT first_name INTO v_first_name
    FROM employees
    WHERE employee_id=1; --there is no employee id = 1
    dbms_output.put_line(v_first_name);
EXCEPTION
    WHEN no_data_found THEN
        dbms_output.put_line('The query doesn´t retrieve any data');
END;
-----
DECLARE
    v_emp_id employees.employee_id%TYPE;
BEGIN
    SELECT employee_id INTO v_emp_id
    FROM employees
    WHERE first_name=&name; --try xyx and after try John and the in last try use 1
    
EXCEPTION
    WHEN no_data_found THEN
        dbms_output.put_line('The query doesn´t retireve any record');    
    WHEN too_many_rows THEN
        dbms_output.put_line('Then query retrieve more than one record');
    WHEN OTHERS THEN
        dbms_output.put_line('Other error');
END;