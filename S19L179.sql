SELECT name, value
FROM v$parameter
WHERE name = 'plsql_warnings';

ALTER SESSION SET PLSQL_WARNINGS='ENABLE:ALL';

CREATE OR REPLACE FUNCTION test_f RETURN NUMBER IS
v NUMBER := 0;
BEGIN
  RETURN v;
  v:=v+1;
END;

ALTER SESSION SET PLSQL_WARNINGS='DISABLE:INFORMATIONAL';

SELECT name, value
FROM v$parameter
WHERE name = 'plsql_warnings';

ALTER SESSION SET PLSQL_WARNINGS='DISABLE:INFORMATIONAL, ENABLE:SEVERE, ENABLE:PERFORMANCE';

SELECT name, value
FROM v$parameter
WHERE name = 'plsql_warnings';

CREATE OR REPLACE FUNCTION test_f RETURN NUMBER IS
v NUMBER := 0;
BEGIN
  RETURN v;
  v:=v+1;
END;

ALTER SESSION SET PLSQL_WARNINGS='DISABLE:INFORMATIONAL,
                                  ENABLE:SEVERE,
                                  ENABLE:PERFORMANCE,
                                  ERROR:05018';
                                  
SELECT name, value
FROM v$parameter
WHERE name = 'plsql_warnings';          

CREATE OR REPLACE FUNCTION test_f RETURN NUMBER IS
v NUMBER := 0;
BEGIN
  RETURN v;
  v:=v+1;
END;