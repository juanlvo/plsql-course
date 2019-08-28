ALTER SESSION SET PLSQL_WARNINGS='DISABLE:ALL';

SELECT name, value
FROM v$parameter
WHERE name = 'plsql_warnings';  

BEGIN
  dbms_warning.add_warning_setting_cat('SEVERE', 'ENABLE', 'SESSION');
END;

SELECT name, value
FROM v$parameter
WHERE name = 'plsql_warnings';  

SELECT dbms_warning.get_warning_setting_string FROM DUAL;

------------------------------------------------------------------------------

EXEC dbms_warning.add_warning_setting_num(6002, 'DISABLE', 'SESSION');

SELECT DBMS_WARNING.GET_WARNING_SETTING_NUM(6002)
FROM DUAL;

EXEC DBMS_WARNING.ADD_WARNING_SETTING_NUM(6002, 'ENABLE', 'SESSION');

SELECT DBMS_WARNING.GET_WARNING_SETTING_NUM(6002)
FROM DUAL;


--------------------------------------------------------------------------------

EXEC DBMS_WARNING.SET_WARNING_SETTING_STRING('ENABLE:ALL', 'SESSION');

SELECT DBMS_WARNING.GET_WARNING_SETTING_STRING
FROM DUAL;

--------------------------------------------------------------------------------

SELECT DBMS_WARNING.GET_CATEGORY(5000)
FROM DUAL;

SELECT DBMS_WARNING.GET_CATEGORY(6002)
FROM DUAL;

SELECT DBMS_WARNING.GET_CATEGORY(7203)
FROM DUAL;

--------------------------------------------------------------------------------

SELECT DBMS_WARNING.GET_WARNING_SETTING_CAT('SEVERE')
FROM DUAL;

SELECT DBMS_WARNING.GET_WARNING_SETTING_CAT('INFORMATIONAL')
FROM DUAL;

SELECT DBMS_WARNING.GET_WARNING_SETTING_CAT('PERFORMANCE')
FROM DUAL;

--------------------------------------------------------------------------------

SELECT DBMS_WARNING.GET_WARNING_SETTING_NUM(5000)
FROM DUAL;

SELECT DBMS_WARNING.GET_WARNING_SETTING_NUM(6002)
FROM DUAL;

SELECT DBMS_WARNING.GET_WARNING_SETTING_NUM(7203)
FROM DUAL;

