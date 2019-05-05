--using c_emp%notfound, c_emp%isopen, c_emp%rowcount
DECLARE
    CURSOR c_emp IS
        SELECT employee_id, first_name
        FROM employees;
        
    v_empno employees.employee_id%TYPE;
    v_first_name employees.first_name%TYPE;
    
BEGIN
    IF c_emp%isopen THEN
        NULL;
    ELSE
        OPEN c_emp;
    END IF;
    
    dbms_output.put_line('The counter for cursor now is '||c_emp%rowcount);
    
    LOOP
        FETCH c_emp INTO v_empno, v_first_name;
        EXIT WHEN c_emp%notfound or c_emp%rowcount>10;
        dbms_output.put_line(v_empno||' '||v_first_name);
    END LOOP;
        dbms_output.put_line('the counter for cursor now is '||c_emp%rowcount);
    CLOSE c_emp;
END;