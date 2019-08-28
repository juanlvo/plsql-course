SELECT text
FROM ALL_SOURCE
WHERE LOWER(name) = 'dbms_db_version';

BEGIN
  DBMS_OUTPUT.PUT_LINE(DBMS_DB_VERSION.VERSION);
  DBMS_OUTPUT.PUT_LINE(DBMS_DB_VERSION.RELEASE);
  IF DBMS_DB_VERSION.VER_LE_12 OR DBMS_DB_VERSION.VER_LE_12_2 THEN
    DBMS_OUTPUT.PUT_LINE('it is 12c :)');
  END IF;
END;

--------------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION get_sal (p_emp_id NUMBER) RETURN NUMBER
$if dbms_db_version.version>=11 $then result_cache $end
IS
  v_sal NUMBER;
BEGIN
  SELECT salary
  INTO v_sal
  FROM employees
  WHERE employee_id = p_emp_id;
  
  RETURN v_sal;
END;

-------------------------------------------------------------------------------

SELECT name, value
FROM v$parameter
WHERE name = 'plsql_optimize_level';  

BEGIN
  dbms_output.put_line($$plsql_code_type);
  dbms_output.put_line($$plsql_optimize_level);
  dbms_output.put_line($$plsql_warnings);
END;

--------------------------------------------------------------------------------

CREATE OR REPLACE PROCEDURE g_test IS
BEGIN
  dbms_output.put_line('test');
END;

CREATE OR REPLACE PROCEDURE g_test IS
BEGIN
  $if $$plsql_optimize_level <> 3 $then
  $error 'it should be compiled with plsql_optimize_level=3' $end
  $end
  dbms_output.put_line('test');
END;

alter session set plsql_optimize_level = 3;

CREATE OR REPLACE PROCEDURE g_test IS
BEGIN
  $if $$plsql_optimize_level <> 3 $then
  $error 'it should be compiled with plsql_optimize_level=3' $end
  $end
  dbms_output.put_line('test');
END;