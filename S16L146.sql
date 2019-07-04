DROP TABLE ename2;

CREATE TABLE ename2 AS
  SELECT employee_id, first_name
  FROM employees;
  
SELECT *
FROM ename2;

DECLARE
  TYPE emp_t IS TABLE OF VARCHAR2(100) INDEX BY BINARY_INTEGER;
  emp_table emp_t;
  c NUMBER:=0;
BEGIN
  FOR i IN (SELECT employee_id, first_name from ename2) LOOP
    c:=c+1;
    emp_table(c):=i.first_name;
  END LOOP;
  
  FOR i IN emp_table.FIRST..emp_table.LAST LOOP
    DBMS_OUTPUT.PUT_LINE(emp_table(i));
  END LOOP;
END;

--------------------------------------------------------------------------------


DECLARE
  TYPE emp_t IS TABLE OF VARCHAR2(100) INDEX BY BINARY_INTEGER;
  emp_table emp_t;
  c NUMBER:=0;
BEGIN
  SELECT first_name BULK COLLECT INTO emp_table
  FROM ename2;
  
  FOR i IN emp_table.FIRST..emp_table.LAST LOOP
    DBMS_OUTPUT.PUT_LINE(emp_table(i));
  END LOOP;
END;