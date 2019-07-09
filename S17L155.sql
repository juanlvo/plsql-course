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

