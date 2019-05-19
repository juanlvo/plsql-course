SELECT *
FROM employee_id=1;
-----
DECLARE
    v_employee_id NUMBER :=1;
BEGIN
    UPDATE employees
    SET salary = 20000
    WHERE employee_id = v_employee_id;
    
    dbms_output.put_line(SQL%rowcount);
END;
-----
DECLARE
    v_employee_id NUMBER :=1;
    e_invalid_no EXCEPTION;
BEGIN
    UPDATE employees
    SET salary = 20000
    WHERE employee_id = v_employee_id;
    
    dbms_output.put_line(SQLCODE);
    dbms_output.put_line(SQLERRM);
    
    IF SQL%NOTFOUND THEN
        RAISE e_invalid_no;
    END IF;
    
    COMMIT;
    
    EXCEPTION
        WHEN e_invalid_no THEN
            dbms_output.put_line('invalid emp ID');
            dbms_output.put_line(SQLCODE);
            dbms_output.put_line(SQLERRM);
END;

-----

DECLARE
    v_employee_id NUMBER :=1;
    --e_invalid_no EXCEPTION;
BEGIN
    UPDATE employees
    SET salary = 20000
    WHERE employee_id = v_employee_id;
    
    IF SQL%NOTFOUND THEN
        raise_application_error(-20000, 'invalid emp ID');
    END IF;
    
    COMMIT;
    
END;