DROP TABLE t;

CREATE TABLE t (
test_value VARCHAR2(25));

CREATE OR REPLACE PROCEDURE child_block IS
BEGIN
  INSERT INTO t(test_value) VALUES ('Child block insert');
  COMMIT;
END child_block;

CREATE OR REPLACE PROCEDURE parent_block IS
BEGIN
  INSERT INTO t(test_value) VALUES('Parent block insert');
  child_block;
  ROLLBACK;
END parent_block;
/

EXECUTE parent_block;

SELECT * FROM t;

--------------------------------------------------------------------------------

CREATE OR REPLACE PROCEDURE child_block IS
  PRAGMA AUTONOMOUS_TRANSACTION;
BEGIN
  INSERT INTO t(test_value) VALUES ('Child block insert');
  COMMIT;
END child_block;

CREATE OR REPLACE PROCEDURE parent_block IS
BEGIN
  INSERT INTO t(test_value) VALUES('Parent block insert');
  child_block;
  ROLLBACK;
END parent_block;
/

TRUNCATE TABLE t;

EXECUTE parent_block;

SELECT * FROM t;