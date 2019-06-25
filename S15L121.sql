CREATE OR REPLACE FUNCTION get_emp(p_id NUMBER) RETURN employees%ROWTYPE IS
  emp_rec EMPLOYEES%ROWTYPE;
BEGIN
  SELECT *
  INTO emp_rec
  FROM employees
  WHERE employee_id=p_id;
  
  RETURN emp_rec;
END;

SELECT get_emp(100) FROM DUAL;

DECLARE
  emp_rec employees%rowtype;
BEGIN
  emp_rec:=get_emp(100);
  DBMS_OUTPUT.PUT_LINE(emp_rec.employee_id||' '||emp_rec.first_name);
END;
--------------------------------------------------------------------------------

CREATE OR REPLACE FUNCTION get_emp2(p_id NUMBER) RETURN employees%ROWTYPE IS
  emp_rec EMPLOYEES%ROWTYPE;
  v_query VARCHAR2(1000);
BEGIN
  v_query := 'SELECT *
  FROM employees
  WHERE employee_id=:1';
  
  EXECUTE IMMEDIATE v_query INTO emp_rec USING p_id;
  
  RETURN emp_rec;
END;

DECLARE
  emp_rec employees%ROWTYPE;
BEGIN
  emp_rec := get_emp2(105);
  DBMS_OUTPUT.PUT_LINE(emp_rec.employee_id||' '||emp_rec.first_name);
END;