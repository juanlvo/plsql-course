DROP TABLE emp3;

BEGIN
  CREATE TABLE emp3 (emp_id NUMBER);
END;

BEGIN
  EXECUTE IMMEDIATE'CREATE TABLE emp3 (emp_id NUMBER)';
END;

SELECT * FROM emp3;

--------------------------------------------------------------------------------

CREATE OR REPLACE PROCEDURE create_any_table(p_table_name VARCHAR2, p_details VARCHAR2) IS
  v_details VARCHAR2(30000);
BEGIN
  v_details := 'CREATE TABLE '||p_table_name||' ('||p_details||')';
  DBMS_OUTPUT.PUT_LINE(v_details);
  EXECUTE IMMEDIATE v_details;
END;

--------------------------------------------------------------------------------
EXECUTE create_any_table('emp4', 'emp_id NUMBER, name VARCHAR2(100)');

SELECT * FROM USER_SYS_PRIVS;


EXECUTE create_any_table('emp4', 'emp_id NUMBER, name VARCHAR2(100)');

SELECT * FROM emp4;
