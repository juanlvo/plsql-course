DROP TRIGGER it_prog_range;

SELECT job_id,
        MIN(salary),
        MAX(salary)
FROM employees
GROUP BY job_id
ORDER BY 1;

CREATE OR REPLACE TRIGGER salary_range BEFORE INSERT OR UPDATE ON employees
FOR EACH ROW
DECLARE
  v_min_sal NUMBER;
  v_max_sal NUMBER;
BEGIN
  SELECT MIN(salary),
          MAX(salary)
    INTO v_min_sal,
          v_max_sal
    FROM employees
    WHERE job_id=:NEW.job_id;
    
    IF :NEW.salary NOT BETWEEN v_min_sal AND v_max_sal THEN
      RAISE_APPLICATION_ERROR(-20300, 'invalid range');
    END IF;
END;

SELECT *
FROM employees
WHERE job_id='IT_PROG'
ORDER BY salary;

UPDATE employees
SET salary=6000
WHERE employee_id=107;

CREATE OR REPLACE TRIGGER salary_range FOR INSERT OR UPDATE ON employees
COMPOUND TRIGGER
  TYPE job_t IS RECORD(minsal NUMBER, maxsal NUMBER);
  TYPE emp_t IS TABLE OF job_t INDEX BY VARCHAR2(100);
  emp emp_t;
  
  BEFORE STATEMENT IS
    BEGIN
      FOR i IN (
                SELECT job_id,
                        MIN(salary) min_sal,
                        MAX(salary) max_sal
                  FROM employees
                  GROUP BY job_id
                  ORDER BY 1
                ) LOOP
          emp(i.job_id).minsal:=i.min_sal;
          emp(i.job_id).maxsal:=i.max_sal;
        END LOOP;
  END BEFORE STATEMENT;
  
  BEFORE EACH ROW IS
    BEGIN
      IF :NEW.salary NOT BETWEEN emp(:new.job_id).minsal AND emp(:new.job_id).maxsal THEN
        RAISE_APPLICATION_ERROR(-20300, 'invalid range');
      END IF;
  END BEFORE EACH ROW;
END;


UPDATE employees
SET salary=100
WHERE employee_id=107;