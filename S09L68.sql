SELECT *
FROM employees
WHERE employee_id=15154;

SELECT SUM(salary)
FROM employees
WHERE department_id=888;
----
DECLARE
    v_sum_sal NUMBER;
BEGIN
    SELECT SUM(salary) INTO v_sum_sal
    FROM employees
    WHERE department_id=&dno;
    
    dbms_output.put_line('the sum is '||v_sum_sal);
    dbms_output.put_line(SQL%ROWCOUNT);
    
    EXCEPTION
        WHEN no_data_found THEN
            dbms_output.put_line('no data found');
END;
------
DECLARE
    v_sum_sal NUMBER;
    v_er EXCEPTION;
BEGIN
    SELECT SUM(salary) INTO v_sum_sal
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