CREATE OR REPLACE PROCEDURE update_sal(p_emp_id IN NUMBER, p_amount IN NUMBER) IS
BEGIN
  UPDATE employees
  SET salary=salary+p_amount
  WHERE employee_id=p_emp_id;
  
  COMMIT;
  
  EXCEPTION
  WHEN OTHERS THEN
    dbms_output.put_line(SQLCODE);
    dbms_output.put_line(SQLERRM);
END;
-----
SELECT *
FROM user_errors
WHERE name='UPDATE_SAL';
----
SELECT *
FROM employees
WHERE employee_id=100;
----
EXECUTE update_sal(100, 150);
-----
BEGIN
  update_sal(&emp_id, &amount);
END;
----
SELECT *
FROM user_objects
WHERE object_name='UPDATE_SAL';
----
SELECT *
FROM user_source
WHERE name = 'UPDATE_SAL'
ORDER BY line;
----
DROP PROCEDURE update_sal;