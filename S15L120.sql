DECLARE
  v_ename VARCHAR2(100);
BEGIN
  EXECUTE IMMEDIATE 'SELECT first_name FROM employees WHERE employee_id=100'
  INTO v_ename;
  DBMS_OUTPUT.PUT_LINE(v_ename);
END;

--------------------------------------------------------------------------------

DECLARE
  v_ename VARCHAR2(100);
  vno NUMBER:=200;
BEGIN
  EXECUTE IMMEDIATE 'SELECT first_name FROM employees WHERE employee_id=:c'
  INTO v_ename USING vno;
  DBMS_OUTPUT.PUT_LINE(v_ename);
END;
