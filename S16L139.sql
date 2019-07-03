CREATE OR REPLACE FUNCTION get_sum_sal_dept(dept_id NUMBER) RETURN NUMBER RESULT_CACHE IS
  v_sal NUMBER;
BEGIN
  SELECT SUM(salary)
  INTO v_sal
  FROM employees
  WHERE department_id=dept_id;
  
  RETURN v_sal;
END;

SELECT get_sum_sal_dept(10) FROM DUAL;
SELECT get_sum_sal_dept(20) FROM DUAL;
SELECT get_sum_sal_dept(30) FROM DUAL;

SELECT get_sum_sal_dept(10) FROM DUAL;

--------------------------------------------------------------------------------

CREATE OR REPLACE FUNCTION get_sum_sal_dept(dept_id NUMBER) RETURN NUMBER RESULT_CACHE RELIES_ON(employees) IS
  v_sal NUMBER;
BEGIN 
  SELECT SUM(salary)
  INTO v_sal
  FROM employees
  WHERE department_id = dept_id;
  
  return v_sal;
END;