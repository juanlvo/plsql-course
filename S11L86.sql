CREATE OR REPLACE FUNCTION get_sal_tax (p_sal NUMBER) RETURN NUMBER IS
BEGIN
  COMMIT;
  IF p_sal<5000 THEN
    RETURN p_sal*(10/100);
  ELSE
    RETURN p_sal*(15/100);
  END IF;
END;
-------------------------------------------------------------------
---this is not gona work because of the commit sentence
SELECT employee_id,
 
      first_name,
      salary,
      get_sal_tax(salary)
FROM employees  
WHERE get_sal_tax(salary)> 2000
ORDER BY get_sal_tax(salary);
--------------------------------------------------------------------
---but in this way is going to work
DECLARE
  v NUMBER;
BEGIN
  v:=get_sal_tax(5000);
  DBMS_OUTPUT.PUT_LINE(v);
END;
--------------------------------------------------------------------
CREATE OR REPLACE FUNCTION get_sal_tax (p_sal NUMBER) RETURN NUMBER IS
BEGIN
  INSERT INTO departments(department_id, department_name)
      VALUES(-99, 'test');
      
  IF p_sal<5000 THEN
    RETURN p_sal*(10/100);
  ELSE
    RETURN p_sal*(15/100);
  END IF;
END;
--------------------------------------------------------------------
-- you cannot use function in a select if the function contains dml
--------------------------------------------------------------------
SELECT employee_id,
 
      first_name,
      salary,
      get_sal_tax(salary)
FROM employees  
WHERE get_sal_tax(salary)> 2000
ORDER BY get_sal_tax(salary);
--------------------------------------------------------------------
---but it will work in this way
-------------------------------------------------------------------
DECLARE
  v NUMBER;
BEGIN
  v:=get_sal_tax(5000);
  DBMS_OUTPUT.PUT_LINE(v);
END;
----------
SELECT * FROM DEPARTMENTS WHERE DEPARTMENT_ID = -99;
----------------------------------------------------------------------
DROP FUNCTION get_sal_tax;