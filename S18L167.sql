SELECT *
FROM employees
WHERE job_id='IT_PROG'
ORDER BY salary;

CREATE OR REPLACE TRIGGER IT_PROG_RANGE BEFORE INSERT OR UPDATE ON employees 
FOR EACH ROW WHEN (NEW.job_id='IT_PROG')
DECLARE
  v_min_it_prog NUMBER;
  v_max_it_prog NUMBER;
BEGIN
  SELECT MIN(salary),
          MAX(salary)
    INTO v_min_it_prog,
          v_max_it_prog
    FROM employees
    WHERE job_id=:new.job_id;
    
    IF :NEW.salary NOT BETWEEN v_min_it_prog and v_max_it_prog THEN
      RAISE_APPLICATION_ERROR(-23000, 'invalid range');
    END IF;
END;

INSERT INTO employees (employee_id, 
                        first_name, 
                        last_name, 
                        email, 
                        phone_number,
                        hire_date,
                        job_id,
                        salary,
                        commission_pct,
                        manager_id,
                        department_id)
              VALUES (900,
                      'JUAN',
                      'VIVAS',
                      'test@test.com',
                      NULL,
                      SYSDATE,
                      'IT_PROG',
                      1500,
                      0,
                      NULL,
                      90);
                      
UPDATE employees
SET salary=6000
WHERE employee_id=107;

CREATE OR REPLACE TRIGGER it_proc_range FOR INSERT OR UPDATE ON employees
WHEN (NEW.job_id='IT_PROG')
COMPOUND TRIGGER
  v_min_it_prog NUMBER;
  v_max_it_prog NUMBER;
  BEFORE STATEMENT IS
  BEGIN
    SELECT MIN(salary),
            MAX(salary)
      INTO v_min_it_prog,
            v_max_it_prog
      FROM employees
    WHERE job_id='IT_PROG';
  END BEFORE STATEMENT;
  
  BEFORE EACH ROW IS
  BEGIN
    IF :NEW.salary NOT BETWEEN v_min_it_prog AND v_min_it_prog THEN
      RAISE_APPLICATION_ERROR(-20300, 'invalid range');
    END IF;
  END BEFORE EACH ROW;
END;

UPDATE employees
SET salary=200
WHERE employee_id=107;