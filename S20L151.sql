ALTER SESSION SET plsql_ccflags='';

SELECT name, value
FROM v$parameter
WHERE name='plsql_ccflags';

SELECT name, value
FROM v$parameter
WHERE name='plsql_code_type';

ALTER SESSION SET plsql_ccflags='language:1,language:null,plsql_code_type:10';

SELECT name, value
FROM v$parameter
WHERE name='plsql_code_type';

BEGIN
  DBMS_OUTPUT.PUT_LINE($$language);
  DBMS_OUTPUT.PUT_LINE($$plsql_code_type);
  DBMS_OUTPUT.PUT_LINE($$plsql_warnings);
END;