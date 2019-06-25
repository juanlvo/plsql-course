DROP TABLE emp1;
CREATE TABLE emp1(emp_id number);

DROP TABLE emp2;
CREATE TABLE emp2(emp_id number);

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

SELECT * FROM emp2

CREATE OR REPLACE PROCEDURE delete_any_table (p_table_name VARCHAR2) IS
  v_no_rec NUMBER;
BEGIN
  EXECUTE IMMEDIATE 'delete from '||p_table_name;
  v_no_rec:=SQL%ROWCOUNT;
  COMMIT;
  DBMS_OUTPUT.PUT_LINE(v_no_rec||' record(s) delete from '||p_table_name);
END;

EXECUTE delete_any_table('emp2');

SELECT * FROM emp2;

EXECUTE delete_any_table('dfd');