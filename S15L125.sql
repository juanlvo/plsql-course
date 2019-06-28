DROP TABLE emp1;

CREATE TABLE emp1 (emp_id NUMBER);

DROP TABLE emp2;

CREATE TABLE emp2 (emp_id NUMBER);

BEGIN
  INSERT INTO emp1 VALUES (1);
  INSERT INTO emp1 VALUES (2);
  INSERT INTO emp1 VALUES (3);
  INSERT INTO emp2 VALUES (1);
  INSERT INTO emp2 VALUES (2);
  INSERT INTO emp2 VALUES (3);
  COMMIT;
END;

SELECT * FROM emp1;

SELECT * FROM emp2;

CREATE OR REPLACE PROCEDURE delete_any_table2(p_table_name VARCHAR2) IS
  v_no_rec NUMBER;
BEGIN
  EXECUTE IMMEDIATE 'delete from '||p_table_name;
  v_no_rec:=SQL%ROWCOUNT;
  COMMIT;
  DBMS_OUTPUT.PUT_LINE(v_no_rec||' record(s) delete from '||p_table_name);
END;


--------------------------------------------------------------------------------

CREATE OR REPLACE PROCEDURE delete_any_table2(p_table_name VARCHAR2) IS
  v_no_rec NUMBER;
  v_cur_id NUMBER;
BEGIN
  v_cur_id:=dbms_sql.open_cursor;
  dbms_sql.parse(v_cur_id, 'delete from '||p_table_name, dbms_sql.native);
  v_no_rec:=dbms_sql.execute(v_cur_id);
  DBMS_OUTPUT.PUT_LINE(v_no_rec||' record(s) delete from '||p_table_name);
    COMMIT;
END;


EXECUTE delete_any_table2('emp2');

select * from emp2;

--------------------------------------------------------------------------------

CREATE OR REPLACE PROCEDURE add_rows2(p_table_name VARCHAR2, p_value NUMBER) IS
  v_no_rec NUMBER;
  v_cur_id NUMBER;
  v_insert VARCHAR2(1000):='INSERT INTO '||p_table_name||' VALUES (:ID)';
BEGIN
  v_cur_id:=DBMS_SQL.OPEN_CURSOR;
  DBMS_SQL.PARSE(v_cur_id, v_insert, DBMS_SQL.NATIVE);
  DBMS_SQL.BIND_VARIABLE(v_cur_id,':ID', p_value);
  v_no_rec:=DBMS_SQL.EXECUTE(v_cur_id);
  DBMS_OUTPUT.PUT_LINE(v_no_rec||' record(s) INSERTED TO '||p_table_name);
  COMMIT;
END;

EXECUTE add_rows2('emp1', 90);

select * from emp1;