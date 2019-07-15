DELETE FROM employees
WHERE employee_id=10;

DROP VIEW emp_all_v;

CREATE OR REPLACE VIEW emp_all_v AS
SELECT *
FROM employees;

INSERT INTO emp_all_v
(employee_id, first_name, last_name, email, phone_number, hire_date, job_id,
  salary, commission_pct, manager_id, department_id)
  VALUES
  (10, 'JUAN', 'VIVAS', 'TEST@TEST.COM', NULL, SYSDATE, 'AD_PRES', 1500, 0, NULL, 90);
  
SELECT *
FROM EMPLOYEES
WHERE EMPLOYEE_ID=10;

ROLLBACK;
  
CREATE OR REPLACE TRIGGER test_instead INSTEAD OF INSERT ON emp_all_v
BEGIN
  DBMS_OUTPUT.PUT_LINE('TEST');
END;

CREATE OR REPLACE TRIGGER test_instead INSTEAD OF INSERT ON emp_all_v
BEGIN
  INSERT INTO employees
    (employee_id, first_name, last_name, email, phone_number, hire_date, job_id, 
    salary, commission_pct, manager_id, department_id)
  VALUES
    (:new.employee_id, :new.first_name, :new.last_name, :new.email, 
    :new.phone_number, :new.hire_date, :new.job_id, :new.salary, :new.commission_pct,
    :new.manager_id, :new.department_id);
    
  DBMS_OUTPUT.PUT_LINE('TEST');
END;


