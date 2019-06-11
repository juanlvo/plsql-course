CREATE OR REPLACE PROCEDURE p(x BOOLEAN) IS
BEGIN
  IF x THEN
    dbms_output.put_line('x is true');
  END IF;
END;
-------------
DECLARE
  v boolean;
BEGIN
  v:= TRUE;
  p(v);
END;
-------------
CREATE OR REPLACE PROCEDURE test_plsql_records(rec IN departments%ROWTYPE) IS
BEGIN
  INSERT INTO departments VALUES rec;
END;
----------------------
DECLARE
  v departments%ROWTYPE;
BEGIN
  v.department_id := 3;
  v.department_name := 'v dept';
  
  test_plsql_records(v);
END;
---------------
select * from departments;