DECLARE
  CURSOR c_emp_dept30 IS
    SELECT employee_id,
            first_name
      FROM employees
     WHERE department_id=30;
     
     v_empno employees.employee_id%TYPE;
     v_first_name employees.first_name%TYPE;
     
BEGIN
  OPEN c_emp_dept30;
    LOOP
      FETCH c_emp_dept30 INTO v_empno, v_first_name;
      EXIT WHEN c_emp_dept30%notfound;
      DBMS_OUTPUT.PUT_LINE(v_empno||' '||v_first_name);
    END LOOP;
  CLOSE c_emp_dept30;
END;
--------------------------------------------------------------------------------
DECLARE
  TYPE c_emp_dept IS REF CURSOR;
  d_cursor c_emp_dept;
  
  v_empno employees.employee_id%type;
  v_first_name employees.first_name%type;
BEGIN
  OPEN d_cursor FOR SELECT employee_id, first_name
                      FROM employees
                      WHERE department_id=10;
  LOOP
    FETCH d_cursor INTO v_empno, v_first_name;
    EXIT WHEN d_cursor%NOTFOUND;
    DBMS_OUTPUT.PUT_LINE(v_empno||' '||v_first_name);
  END LOOP;
  CLOSE d_cursor;
  
    OPEN d_cursor FOR SELECT employee_id, first_name
                      FROM employees
                      WHERE department_id=30;
  LOOP
    FETCH d_cursor INTO v_empno, v_first_name;
    EXIT WHEN d_cursor%NOTFOUND;
    DBMS_OUTPUT.PUT_LINE(v_empno||' '||v_first_name);
  END LOOP;
  CLOSE d_cursor;
END;