DECLARE
    v_first_name employees.first_name%TYPE;
BEGIN
    FOR i IN 99..102
        LOOP
            SELECT first_name INTO v_first_name
            FROM employees
            WHERE employee_id=i;
            dbms_output.put_line(i||' ' ||v_first_name);
        END LOOP;
        
EXCEPTION
    WHEN no_data_found THEN
        NULL;
END;
---
DECLARE
    v_first_name employees.first_name%TYPE;
BEGIN
    FOR i IN 99..102
        LOOP
            BEGIN 
                SELECT first_name INTO v_first_name
                FROM employees
                WHERE employee_id=i;
                dbms_output.put_line(i||' ' ||v_first_name);
            EXCEPTION
                WHEN no_data_found THEN
                    NULL;
            END;
        END LOOP;
END;