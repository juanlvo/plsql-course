/*
  Create a procedure that take emp_id as parameter and return the first_name and
  salary
  note: bind the variable to print the first_name and salary
*/
CREATE OR REPLACE PROCEDURE query_emp(
  p_emp_id employees.employee_id%TYPE,
  p_f_name OUT employees.first_name%TYPE,
  p_sal OUT employees.salary%TYPE
) IS
BEGIN
  
  SELECT first_name, salary
    INTO p_f_name, p_sal
    FROM employees
   WHERE employee_id=p_emp_id;
   
  EXCEPTION 
    WHEN OTHERS THEN
      dbms_output.put_line(SQLCODE);
      dbms_output.put_line(SQLERRM);
END;
-----
VARIABLE b_first_name VARCHAR2(100)
VARIABLE b_sal NUMBER

EXECUTE query_emp(105, :b_first_name, :b_sal)

PRINT b_first_name b_sal;
----
DECLARE
  v_first_name employees.first_name%TYPE;
  v_sal employees.salary%TYPE;
BEGIN
  query_emp(105, v_first_name, v_sal);
        dbms_output.put_line(v_first_name);
      dbms_output.put_line(v_sal);
END;