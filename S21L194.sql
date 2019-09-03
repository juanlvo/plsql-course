-------------------example 1----------------------------------------------------

DROP TABLE emp_copy;

CREATE TABLE emp_copy AS
  SELECT * FROM employees;
  
SELECT * FROM emp_copy;

create or replace view v_emp_copy as
  select * from emp_copy;
  
select object_name, object_type, status
from user_objects
where object_name='V_EMP_COPY';

DROP TABLE EMP_COPY;

select object_name, object_type, status
from user_objects
where object_name='V_EMP_COPY';

SELECT * FROM v_emp_copy;

-------------------example 2----------------------------------------------------

DROP TABLE dept_copy;

CREATE TABLE dept_copy AS 
  SELECT * FROM departments;
  
SELECT * FROM DEPT_COPY;

CREATE OR REPLACE VIEW v_dept_copy AS
  SELECT DEPARTMENT_ID, DEPARTMENT_NAME
  FROM DEPT_COPY;
  
select object_name, object_type, status
from user_objects
where object_name='V_DEPT_COPY';

ALTER TABLE DEPT_COPY
ADD (DSIZE NUMBER);

select object_name, object_type, status
from user_objects
where object_name='V_DEPT_COPY';

ALTER TABLE DEPT_COPY
DROP COLUMN DEPARTMENT_NAME;

select object_name, object_type, status
from user_objects
where object_name='V_DEPT_COPY';