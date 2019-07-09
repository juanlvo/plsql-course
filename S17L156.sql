DELETE FROM departments;

CREATE OR REPLACE TRIGGER dept_check_time BEFORE INSERT OR UPDATE OR DELETE ON departments
BEGIN
  IF to_number(to_char(SYSDATE, 'hh24')) NOT BETWEEN 8 AND 15 THEN
    RAISE_APPLICATION_ERROR(-20010, 'DML operations not allowed now');
  END IF;
END;

DELETE FROM departments;

DELETE FROM departments
WHERE department_id=-4;

SELECT *
FROM user_objects
WHERE object_name='DEPT_CHECK_TIME';

SELECT *
FROM user_triggers
WHERE trigger_name='DEPT_CHECK_TIME';

----------------------------------------------------------------------------------

CREATE OR REPLACE TRIGGER dept_check_time BEFORE INSERT OR UPDATE OR DELETE ON departments
BEGIN
  IF to_number(to_char(SYSDATE, 'hh24')) NOT BETWEEN 8 AND 15 THEN
    IF INSERTING THEN
      RAISE_APPLICATION_ERROR(-20010, 'Insert operations not allowed now');
    ELSIF DELETING THEN
      RAISE_APPLICATION_ERROR(-20011, 'Delete operations not allowed now');
    ELSIF UPDATING THEN
      RAISE_APPLICATION_ERROR(-20012, 'Update operations not allowed now');
    END IF;
  END IF;
END;


DELETE FROM departments;

UPDATE departments
SET department_name='x'
WHERE department_id=-5;
