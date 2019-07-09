DROP TABLE t1;

CREATE TABLE t1 (
  emp_id NUMBER,
  ename VARCHAR2(100)
);

INSERT INTO t1 VALUES (1, 'ford');
INSERT INTO t1 VALUES (2, 'aya');


---------------statement trigger------------------------
CREATE OR REPLACE TRIGGER t1_b4_update BEFORE UPDATE ON t1
BEGIN
  DBMS_OUTPUT.PUT_LINE(':)');
END;

UPDATE t1
SET ename=ename||' s';

UPDATE t1
SET ename=ename||' s'
WHERE emp_id=5555;

