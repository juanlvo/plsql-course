SELECT *
FROM employees
WHERE employee_id IN (100, 101, 102, 103);

DECLARE
  TYPE emp_table_type IS TABLE OF NUMBER INDEX BY BINARY_INTEGER;
  emp_table emp_table_type;
BEGIN
  emp_table(1):=100;
  emp_table(2):=101;
  emp_table(3):=102;
  emp_table(100):=103;
  
  DBMS_OUTPUT.PUT_LINE(emp_table.FIRST);
  DBMS_OUTPUT.PUT_LINE(emp_table.LAST);
  
  FORALL i IN emp_table.FIRST..emp_table.LAST SAVE EXCEPTIONS
  UPDATE employees
  SET salary=salary+5
  WHERE employee_id=emp_table(i);
  
  COMMIT;
END;

--------------------------------------------------------------------------------

DECLARE
  TYPE emp_table_type IS TABLE OF NUMBER INDEX BY BINARY_INTEGER;
  emp_table emp_table_type;
BEGIN
  emp_table(1):=100;
  emp_table(2):=101;
  emp_table(3):=102;
  emp_table(100):=103;
  
  DBMS_OUTPUT.PUT_LINE(emp_table.FIRST);
  DBMS_OUTPUT.PUT_LINE(emp_table.LAST);
  
  FORALL i IN INDICES OF emp_table
  UPDATE employees
  SET salary=salary+5
  WHERE employee_id=emp_table(i);
  
  COMMIT;
END;