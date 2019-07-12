DROP TABLE emp_copy;

CREATE TABLE emp_copy AS
  SELECT * FROM employees;
  
SELECT * FROM emp_copy;

DROP TABLE emp_sal_audit;

CREATE TABLE emp_sal_audit(
  emp_id NUMBER,
  operation VARCHAR2(10),
  old_sal NUMBER,
  new_sal NUMBER,
  op_date DATE,
  by_user VARCHAR2(100)
);

CREATE OR REPLACE TRIGGER emp_copy_sal_audit
AFTER INSERT OR UPDATE OF salary OR DELETE
ON emp_copy
FOR EACH ROW
BEGIN
  
  IF inserting THEN
    INSERT INTO EMP_SAL_AUDIT(EMP_ID, OPERATION, OLD_SAL, NEW_SAL, OP_DATE, BY_USER)
    VALUES(:new.employee_id, 'Inserting', null, :new.salary, SYSDATE, USER);
  END IF;
  
  IF updating THEN
    INSERT INTO EMP_SAL_AUDIT(EMP_ID, OPERATION, OLD_SAL, NEW_SAL, OP_DATE, BY_USER)
    VALUES(:old.employee_id, 'Updating', :old.salary, :new.salary, SYSDATE, USER);
  END IF;
  
  IF deleting THEN
      INSERT INTO EMP_SAL_AUDIT(EMP_ID, OPERATION, OLD_SAL, NEW_SAL, OP_DATE, BY_USER)
      VALUES(:old.employee_id, 'Deleting', :old.salary, null, SYSDATE, USER);
  END IF;
END;

---testing

INSERT INTO emp_copy(EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, SALARY, HIRE_DATE, JOB_ID)
VALUES (1, 'Juan', 'Vivas', 'test@test.com', 900, SYSDATE, 'AD_PRESS');

SELECT *
FROM emp_copy
WHERE employee_id=1;

SELECT emp_id, 
        operation, 
        old_sal, 
        new_sal,
        TO_CHAR(op_date, 'dd-mm-yyyy hh24:mi:ss') op_date,
        by_user
FROM emp_sal_audit
ORDER BY op_Date;

----testing update

UPDATE emp_copy
SET salary=salary+10
WHERE department_id=20;

SELECT *
FROM EMP_SAL_AUDIT
ORDER BY op_date;

---test deleting

DELETE FROM emp_copy
WHERE employee_id=1;

SELECT *
FROM EMP_SAL_AUDIT
ORDER BY op_date;
