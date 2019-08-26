SELECT name, value
FROM v$parameter
WHERE name = 'plsql_optimize_level';

ALTER SESSION SET PLSQL_OPTIMIZE_LEVEL = 0;

SELECT name, value
FROM v$parameter
WHERE name = 'plsql_optimize_level';

DECLARE
  a NUMBER;
  b NUMBER;
  c NUMBER;
BEGIN
  DBMS_OUTPUT.PUT_LINE(TO_CHAR(SYSDATE, 'hh:mi:ss'));
  FOR i IN 1..100000000 LOOP
    A:= 1;
    B:= 1;
    C:= A+1;
  END LOOP;
  DBMS_OUTPUT.PUT_LINE(TO_CHAR(SYSDATE, 'hh:mi:ss'));
END;

-------------------------------------------------------------------------------

ALTER SESSION SET PLSQL_OPTIMIZE_LEVEL = 2;

SELECT name, value
FROM v$parameter
WHERE name = 'plsql_optimize_level';

DECLARE
  a NUMBER;
  b NUMBER;
  c NUMBER;
BEGIN
  DBMS_OUTPUT.PUT_LINE(TO_CHAR(SYSDATE, 'hh:mi:ss'));
  FOR i IN 1..100000000 LOOP
    A:= 1;
    B:= 1;
    C:= A+1;
  END LOOP;
  DBMS_OUTPUT.PUT_LINE(TO_CHAR(SYSDATE, 'hh:mi:ss'));
END;