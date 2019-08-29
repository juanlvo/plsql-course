ALTER SESSION SET PLSQL_CCFLAGS='plsql_ccflags:true,debug:true,debug:0';

SELECT name, value
FROM v$parameter
WHERE name='plsql_ccflags';

BEGIN
  DBMS_OUTPUT.PUT_LINE($$plsql_ccflags);
END;

BEGIN
  IF $$plsql_ccflags THEN
    dbms_output.put_line('plsql_ccflags value is true');
  END IF;
  
  IF $$debug=0 THEN
    dbms_output.put_line('debug value is 0');
  END IF;
  dbms_output.put_line($$ddfdfgf);
END;

ALTER SESSION SET plsql_warnings='enable:all';

BEGIN
  IF $$plsql_ccflags THEN
    dbms_output.put_line('plsql_ccflags value is true');
  END IF;
  
  IF $$debug=0 THEN
    dbms_output.put_line('debug value is 0');
  END IF;
  dbms_output.put_line($$ddfdfgf);
END;

CREATE OR REPLACE PROCEDURE cc IS
BEGIN
  IF $$plsql_ccflags THEN
    dbms_output.put_line('plsql_ccflags value is true');
  END IF;
  
  IF $$debug=0 THEN
    dbms_output.put_line('debug value is 0');
  END IF;
  dbms_output.put_line($$ddfdfgf);
END;