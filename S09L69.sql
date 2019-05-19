DECLARE
    v_sum_sal NUMBER(2);
    v_er EXCEPTION;
BEGIN
    BEGIN
        SELECT SUM(salary)
        INTO v_sum_sal
        FROM employees
        WHERE department_id=&dno;
            
        IF v_sum_sal IS NOT NULL THEN
            dbms_output.put_line('the sum is '||v_sum_sal);
            dbms_output.put_line(SQL%ROWCOUNT);
        ELSE
            RAISE v_er;
        END IF;
        
        EXCEPTION
            WHEN v_er THEN
                 dbms_output.put_line('no data found');
    END;
EXCEPTION
    WHEN OTHERS THEN
        dbms_output.put_line(SQLCODE);
        dbms_output.put_line(SQLERRM);
END;