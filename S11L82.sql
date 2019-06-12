/*
Create a function to return the salary for an employee
we need 2 parameters (in) number (employee_id)
the return value should be also number because it is the salary
*/
CREATE OR REPLACE FUNCTION get_sal(p_emp_id NUMBER) RETURN NUMBER IS
  v_sal NUMBER;
BEGIN
  SELECT salary
  INTO v_sal
  FROM employees
  WHERE employee_id=p_emp_id;
  
  RETURN v_sal;
END;
-------------------------------------
--how to invoke teh function
-- 1 as part of an expression
DECLARE
  v_sal NUMBER;
BEGIN
  v_sal := get_sal(100);
  DBMS_OUTPUT.PUT_LINE(v_sal);
END;
-----------------------------
--2 as parameter value
BEGIN
  DBMS_OUTPUT.PUT_LINE(get_sal(100));
END;
---------------------------
--also can be call in this way
EXECUTE DBMS_OUTPUT.PUT_LINE(get_sal(100));
----------------------------
--3. using host variable
VARIABLE b_salary NUMBER;
EXECUTE :b_salary := get_sal(100);
PRINT b_salary
-------------------------------
--4. as part of select

SELECT get_sal(100) FROM DUAL;

SELECT employee_id, 
        first_name, 
          get_sal(employee_id)
FROM employees
WHERE department_id=20;

SELECT *
FROM user_objects
WHERE object_name='GET_SAL';

SELECT line, text
FROM USER_SOURCE
WHERE NAME='GET_SAL';

-------------------------------------
BEGIN
  DBMS_OUTPUT.PUT_LINE(get_sal(9999));
END;