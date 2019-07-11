DROP TABLE emp_copy;

CREATE TABLE emp_copy AS
  SELECT * FROM employees;
  
SELECT * FROM emp_copy;

CREATE OR REPLACE TRIGGER check_sal BEFORE INSERT OR UPDATE OF salary ON emp_copy FOR EACH ROW
BEGIN
  IF :new.salary<500 THEN
    RAISE_APPLICATION_ERROR(-20030, 'min sal is 500');
  END IF;
END;
-------------------------------------------------
UPDATE emp_copy
SET salary=200
WHERE employee_id=100;

UPDATE emp_copy
SET salary=200;

SELECT COUNT(1) FROM emp_copy;

SELECT *
FROM user_triggers
WHERE trigger_name='CHECK_SAL';
---------------------------------------------------------------------------------

CREATE OR REPLACE TRIGGER check_sal BEFORE INSERT OR UPDATE OF salary ON emp_copy REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW
BEGIN
  IF :new.salary<500 THEN
    DBMS_OUTPUT.PUT_LINE('s');
  END IF;
END;

UPDATE emp_copy
SET salary=200
WHERE employee_id=100;

UPDATE emp_copy
SET salary=200;

CREATE OR REPLACE TRIGGER check_sal BEFORE INSERT OR UPDATE OF salary ON emp_copy REFERENCING NEW AS N OLD AS O FOR EACH ROW
BEGIN
  IF :n.salary<500 THEN
    DBMS_OUTPUT.PUT_LINE('s');
  END IF;
END;

UPDATE emp_copy
SET salary=200
WHERE employee_id=100;

UPDATE emp_copy
SET salary=200;