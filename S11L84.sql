CREATE OR REPLACE FUNCTION get_sal_tax(p_sal NUMBER) RETURN NUMBER IS
BEGIN
  IF p_sal<5000 THEN
    RETURN p_sal*(10/100);
  ELSE
    RETURN p_sal*(15/100);
  END IF;
END; 
-----------------------------------
SELECT employee_id,
        first_name,
        last_name,
        salary,
        get_sal_tax(salary)
FROM employees;

SELECT employee_id,
        first_name,
        last_name,
        salary,
        get_sal_tax(p_sal => salary)
FROM employees;

SELECT employee_id,
        first_name,
        salary,
        get_sal_tax(salary)
FROM employees
WHERE get_sal_tax(salary) > 2000
ORDER BY get_sal_tax(salary);