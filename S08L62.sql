SELECT *
FROM employees
WHERE employee_id in (100, 200)
ORDER BY 1;

---

SELECT *
FROM employees
WHERE employee_id in (100, 200)
ORDER BY 1
FOR UPDATE;

COMMIT;

-----

DECLARE
    CURSOR c_emp_dept30 IS
    SELECT employee_id, first_name, salary
    FROM employees
    WHERE department_id=30
    FOR UPDATE;
    
BEGIN
    
    FOR i IN c_emp_dept30
    LOOP
    
        UPDATE employees
        SET salary=salary+1
        WHERE employee_id=i.employee_id;
    
    END LOOP;
    COMMIT;
    
END;
---
SELECT *
FROM employees
WHERE department_id=30;

-----
DECLARE
    CURSOR c_emp_dept30 IS
    SELECT employee_id, first_name, salary
    FROM employees
    WHERE department_id=30
    FOR UPDATE;
    
BEGIN
    
    FOR i IN c_emp_dept30
    LOOP
    
        UPDATE employees
        SET salary=salary-1
        WHERE CURRENT OF c_emp_dept30;
    
    END LOOP;
    COMMIT;
    
END;
---
SELECT *
FROM employees
WHERE department_id=30;