DECLARE
    CURSOR c_emp_dept(v_dept NUMBER) IS
        SELECT employee_id, first_name
        FROM employees
        WHERE department_id=v_dept;
        
        v_empno employees.employee_id%TYPE;
        v_first_name employees.first_name%TYPE;
        
BEGIN
    OPEN c_emp_dept(10);
        dbms_output.put_line('dept 10 contains:');
        LOOP
            FETCH c_emp_dept INTO v_empno, v_first_name;
            EXIT WHEN c_emp_dept%notfound;
            dbms_output.put_line(v_empno||' '||v_first_name);
        END LOOP;
    CLOSE c_emp_dept;
    
    OPEN c_emp_dept(20);
        dbms_output.put_line('dept 20 contains:');
        LOOP
            FETCH c_emp_dept INTO v_empno, v_first_name;
            EXIT WHEN c_emp_dept%notfound;
            dbms_output.put_line(v_empno||' '||v_first_name);
        END LOOP;
    CLOSE c_emp_dept;
END;
------
DECLARE
    CURSOR c_emp_dept(v_dept NUMBER) IS
        SELECT employee_id id, first_name
        FROM employees
        WHERE department_id=v_dept;
        
BEGIN
    dbms_output.put_line('dept 10 contains:');
    FOR i IN c_emp_dept(10)
    LOOP
        dbms_output.put_line(i.id||' '||i.first_name);
    END LOOP;
    
    dbms_output.put_line('dept 20 contains:');
    FOR i IN c_emp_dept(20)
    LOOP
        dbms_output.put_line(i.id||' '||i.first_name);
    END LOOP;
END;