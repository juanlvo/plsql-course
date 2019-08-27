--current value of plsql_warnings

--1 v$parameter

select name, value
from v$parameter
where name='plsql_warnings';

--2 dbms_warnings.get_warning_setting_string()

DECLARE
  s varchar2(100);
BEGIN
  s:=dbms_warning.get_warning_setting_string();
  dbms_output.put_line(s);
END;

-- now the status of dbms_warning.get_warning_setting_string() is DISABLE:ALL

DROP PROCEDURE P11;

CREATE OR REPLACE PROCEDURE P11 (p OUT VARCHAR2) IS
BEGIN
  p:= 'test';
END;

select *
from user_plsql_object_settings
where name='P11';

ALTER SESSION SET PLSQL_WARNINGS='ENABLE:ALL';

CREATE OR REPLACE PROCEDURE P11 (p OUT VARCHAR2) IS
BEGIN
  p:= 'test';
END;

SELECT *
FROM USER_ERRORS
WHERE NAME='P11';

select *
from user_plsql_object_settings
where name='P11';

ALTER PROCEDURE P11 compile PLSQL_WARNINGS='DISABLE:ALL';

select *
from user_plsql_object_settings
where name='P11';