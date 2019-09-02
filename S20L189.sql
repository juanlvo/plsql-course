--without wrap
CREATE OR REPLACE FUNCTION get_sum_sal_dept(dept_id NUMBER) RETURN NUMBER IS
  v_sal NUMBER;
BEGIN
  
  SELECT SUM (salary)
  INTO v_sal
  FROM employees
  WHERE department_id=dept_id;
  
  RETURN v_sal;
  
  EXCEPTION
    WHEN OTHERS THEN RETURN NULL;
END;

SELECT get_sum_sal_dept(90) FROM DUAL;

SELECT line, text
FROM user_source
WHERE lower(name)='get_sum_sal_dept';

BEGIN
  dbms_ddl.create_wrapped(
  'CREATE OR REPLACE FUNCTION get_sum_sal_dept(dept_id NUMBER) RETURN NUMBER IS
  v_sal NUMBER;
BEGIN
  
  SELECT SUM (salary)
  INTO v_sal
  FROM employees
  WHERE department_id=dept_id;
  
  RETURN v_sal;
  
  EXCEPTION
    WHEN OTHERS THEN RETURN NULL;
END;'
  );
END;

SELECT get_sum_sal_dept(90) FROM DUAL;

SELECT line, text
FROM user_source
WHERE lower(name)='get_sum_sal_dept';

DECLARE
  v1 VARCHAR2(1000) := 'CREATE OR REPLACE FUNCTION get_sum_sal_dept(dept_id NUMBER) RETURN NUMBER IS
  v_sal NUMBER;
BEGIN
  
  SELECT SUM (salary)
  INTO v_sal
  FROM employees
  WHERE department_id=dept_id;
  
  RETURN v_sal;
  
  EXCEPTION
    WHEN OTHERS THEN RETURN NULL;
END;';
BEGIN
  DBMS_DDL.CREATE_WRAPPED(V1);
END;
