CREATE OR REPLACE PROCEDURE update_sal_x (emp_id NUMBER, p_amount NUMBER) IS
  v_new_sal NUMBER;
BEGIN
  UPDATE employees
  SET salary=salary+p_amount
  WHERE employee_id=emp_id
  RETURNING salary INTO v_new_sal;
  DBMS_OUTPUT.PUT_LINE('the new sal now is '||v_new_sal);
END;

SELECT *
FROM employees
WHERE employee_id = 200; --sal=4400

EXEC update_sal_x(200, 1);

--------------------------------------------------------------------------------

DROP TABLE ename_test;

CREATE TABLE ename_test AS
  SELECT employee_id, salary
  FROM employees;

SELECT *
FROM ename_test
ORDER BY 1;

DECLARE
  TYPE emp_t IS TABLE OF ename_test%ROWTYPE;
  emp_table emp_t:=emp_t();
  emp_new_sal emp_t:=emp_t();
BEGIN
  SELECT * BULK COLLECT INTO emp_table
  FROM ename_test;
  
  FORALL i IN emp_table.FIRST..emp_table.LAST
  UPDATE ename_test
  SET salary=salary/2
  WHERE employee_id=emp_table(i).employee_id
  RETURNING employee_id, salary BULK COLLECT INTO emp_new_sal;
  
  FOR i IN emp_new_sal.FIRST..emp_new_sal.LAST LOOP
    DBMS_OUTPUT.PUT_LINE(emp_new_sal(i).employee_id||' '||emp_new_sal(i).salary);
  END LOOP;
END;