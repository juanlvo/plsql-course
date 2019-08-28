SELECT name, value
FROM v$parameter
WHERE name='plsql_ccflags';

ALTER SESSION SET plsql_ccflags='language:1';

SELECT name, value
FROM v$parameter
WHERE name='plsql_ccflags';

BEGIN
  dbms_output.put_line($$language);
  dbms_output.put_line($$plsql_ccflags);
END;

CREATE OR REPLACE FUNCTION get_curr_lang RETURN VARCHAR2
IS
  v_lang VARCHAR2(100);
BEGIN
  v_lang:='the curr language in system is '||
  $if $$language=1 $then 'English'
  $else 'Spanish'
  $end;
  RETURN v_lang;
END;

SELECT GET_CURR_LANG from dual;

SELECT *
FROM user_plsql_object_settings
WHERE LOWER(name)='get_curr_lang';

ALTER SESSION SET plsql_ccflags='language:2';

SELECT *
FROM user_plsql_object_settings
WHERE LOWER(name)='get_curr_lang';

CREATE OR REPLACE FUNCTION get_curr_lang RETURN VARCHAR2
IS
  v_lang VARCHAR2(100);
BEGIN
  v_lang:='the curr language in system is '||
  $if $$language=1 $then 'English'
  $else 'Spanish'
  $end;
  RETURN v_lang;
END;

SELECT *
FROM user_plsql_object_settings
WHERE LOWER(name)='get_curr_lang';

SELECT GET_CURR_LANG from dual;