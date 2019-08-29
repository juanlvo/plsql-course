ALTER SESSION SET plsql_ccflags='';

SELECT name, value
FROM v$parameter
WHERE name='plsql_ccflags';

ALTER SESSION SET plsql_ccflags='trace_time:true,maxsizev:2000';

SELECT name, value
FROM v$parameter
WHERE name='plsql_ccflags';

CREATE OR REPLACE PROCEDURE test_only IS
  v VARCHAR2($$maxsizev);
BEGIN
  IF $$trace_time THEN
    DBMS_OUTPUT.PUT_LINE(TO_CHAR(SYSDATE, 'hh:mi:ss'));
  END IF;
  
  FOR i IN 1..1000 LOOP
    DBMS_OUTPUT.PUT_LINE($$maxsizev);
  END LOOP;
  
  IF $$trace_time THEN
    DBMS_OUTPUT.PUT_LINE(TO_CHAR(SYSDATE, 'hh:mi:ss'));
  END IF;
END;

EXEC test_only;

ALTER SESSION SET plsql_ccflags='trace_time:false,maxsizev:2000';

EXEC test_only;

CREATE OR REPLACE PROCEDURE test_only IS
  v VARCHAR2($$maxsizev);
BEGIN
  IF $$trace_time THEN
    DBMS_OUTPUT.PUT_LINE(TO_CHAR(SYSDATE, 'hh:mi:ss'));
  END IF;
  
  FOR i IN 1..1000 LOOP
    DBMS_OUTPUT.PUT_LINE($$maxsizev);
  END LOOP;
  
  IF $$trace_time THEN
    DBMS_OUTPUT.PUT_LINE(TO_CHAR(SYSDATE, 'hh:mi:ss'));
  END IF;
END;

select *
from SYS.USER_PLSQL_OBJECT_SETTINGS
where lower(name) like 'test_only';

EXEC test_only;

call dbms_preprocessor.print_post_processed_source('procedure', 'hr', 'test_only');

