SELECT name, value
FROM v$parameter
WHERE name='plsql_code_type';

DROP PROCEDURE p1;

CREATE OR REPLACE PROCEDURE p1 IS
BEGIN
  dbms_output.put_line('P1');
END;

SELECT *
FROM user_plsql_object_settings
WHERE name='P1';

ALTER SESSION SET plsql_code_type=native;


SELECT *
FROM user_plsql_object_settings
WHERE name='P1';

CREATE OR REPLACE PROCEDURE p1 IS
BEGIN
  dbms_output.put_line('P1');
END;

SELECT *
FROM user_plsql_object_settings
WHERE name='P1';

------------------------------------------------------------------------------
--let's check the performance

ALTER SESSION SET plsql_code_type=INTERPRETED;

CREATE OR REPLACE PROCEDURE p1 IS
  n NUMBER := 0;
BEGIN
  FOR i IN 1..500000000 LOOP
    n:=n+1;
  END LOOP;
END;

exec p1;

ALTER SESSION SET plsql_code_type=NATIVE;

EXEC P1;