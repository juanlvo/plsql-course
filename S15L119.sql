DELETE FROM emp1;

select * from emp1;

CREATE OR REPLACE PROCEDURE add_rows(p_table_name VARCHAR2, p_value NUMBER) IS
BEGIN
  EXECUTE IMMEDIATE 'INSERT INTO '||p_table_name||' values(:1) 'using p_value;
END;

EXECUTE add_rows('emp1', 10);

SELECT * FROM emp1;

-------------------------------------------------------------------------------

DELETE FROM emp1;

CREATE OR REPLACE PROCEDURE add_rows(p_table_name VARCHAR2, p_value NUMBER) IS
  val1 NUMBER:=20;
  val2 NUMBER:=30;
BEGIN
  EXECUTE IMMEDIATE 'INSERT INTO '||p_table_name||' values(:1) ' using p_value;
  EXECUTE IMMEDIATE 'INSERT INTO '||p_table_name||' values(:yy) ' using val1;
  EXECUTE IMMEDIATE 'INSERT INTO '||p_table_name||' values(:uuu) ' using val2;
END;

EXECUTE add_rows('emp1', 10);

SELECT * FROM emp1;