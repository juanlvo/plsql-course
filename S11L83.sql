BEGIN
  DBMS_OUTPUT.PUT_LINE(get_sal(100));
END;
-------------------------------------
BEGIN
  DBMS_OUTPUT.PUT_LINE(get_sal(9999));
END;
----------------------------------------
SELECT get_sal(9999) FROM DUAL;
--------------------------------------
CREATE OR REPLACE FUNCTION get_sal(p_emp_id NUMBER) RETURN NUMBER IS
  v_sal NUMBER;
BEGIN
  SELECT salary
  INTO v_sal
  FROM employees
  WHERE employee_id = p_emp_id;
  
  RETURN v_sal;
  
  EXCEPTION
    WHEN no_data_found THEN
      RETURN -1;
END;
----------------------------------------
SELECT get_sal(9999) FROM DUAL;