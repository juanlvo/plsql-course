SELECT *
FROM employees
WHERE department_id = 30;
----
DECLARE
    CURSOR c_emp_dept30 IS
        SELECT employee_id,
                first_name
        FROM employees
        WHERE department_id = 30;
        
        v_empno      employees.employee_id%TYPE;
        v_first_name employees.first_name%TYPE;
BEGIN
    OPEN c_emp_dept30;
        LOOP
            FETCH c_emp_dept30
                INTO v_empno, v_first_name;
                EXIT WHEN c_emp_dept30%NOTFOUND;
                DBMS_OUTPUT.PUT_LINE(v_empno||' '||v_first_name);
        END LOOP;
    CLOSE c_emp_dept30;
END;
----
DECLARE
    CURSOR c_emp_dept30 IS
        SELECT employee_id,
                first_name
        FROM employees
        WHERE department_id = 30;
        
        v_emp_rec employees%ROWTYPE;
BEGIN
    OPEN c_emp_dept30;
        LOOP
            FETCH c_emp_dept30
                INTO v_emp_rec.employee_id, v_emp_rec.first_name;
                EXIT WHEN c_emp_dept30%NOTFOUND;
                DBMS_OUTPUT.PUT_LINE(v_emp_rec.employee_id||' '||v_emp_rec.first_name);
        END LOOP;
    CLOSE c_emp_dept30;
END;
----
DECLARE
    CURSOR c_emp_dept30 IS
        SELECT employee_id,
                first_name
        FROM employees
        WHERE department_id = 30;
        
        v_emp_rec c_emp_dept30%ROWTYPE;
BEGIN
    OPEN c_emp_dept30;
        LOOP
            FETCH c_emp_dept30
                INTO v_emp_rec;
                EXIT WHEN c_emp_dept30%NOTFOUND;
                DBMS_OUTPUT.PUT_LINE(v_emp_rec.employee_id||' '||v_emp_rec.first_name);
        END LOOP;
    CLOSE c_emp_dept30;
END;
----
DECLARE
    CURSOR c_emp_dept30 IS
        SELECT employee_id,
                first_name,
                salary
        FROM employees
        WHERE department_id = 30;
        
        v_emp_rec c_emp_dept30%ROWTYPE;
BEGIN
    OPEN c_emp_dept30;
        LOOP
            FETCH c_emp_dept30
                INTO v_emp_rec;
                EXIT WHEN c_emp_dept30%NOTFOUND;
                --DBMS_OUTPUT.PUT_LINE(v_emp_rec.employee_id||' '||v_emp_rec.first_name);
                UPDATE employees
                SET salary=salary+100
                WHERE employee_id=v_emp_rec.employee_id;
        END LOOP;
    CLOSE c_emp_dept30;
    COMMIT;
END;