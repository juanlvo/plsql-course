DROP TABLE test_emp;

CREATE TABLE test_emp(
  emp_id NUMBER,
  first_name VARCHAR2(100)
);

DROP TABLE test_emp_sequence;

CREATE TABLE test_emp_sequence(
  seq NUMBER,
  trigger_type VARCHAR2(100)
);


DROP SEQUENCE s;

CREATE SEQUENCE s;

CREATE OR REPLACE TRIGGER before_insert_stat
BEFORE INSERT ON test_emp
BEGIN
  INSERT INTO test_emp_sequence VALUES(s.nextval, 'before_inser_stat');
END;

CREATE OR REPLACE TRIGGER before_insert_each_row
BEFORE INSERT ON test_emp FOR EACH ROW
BEGIN
  INSERT INTO test_emp_sequence VALUES(s.nextval, 'before_inser_row');
END;

CREATE OR REPLACE TRIGGER after_insert_each_row
AFTER INSERT ON test_emp FOR EACH ROW
BEGIN
  INSERT INTO test_emp_sequence VALUES(s.nextval, 'after_insert_each_row');
END;


CREATE OR REPLACE TRIGGER after_insert_stat
AFTER INSERT ON test_emp 
BEGIN
  INSERT INTO test_emp_sequence VALUES(s.nextval, 'after_insert_stat');
END;

INSERT INTO test_emp VALUES(1, 'mazen');

SELECT *
FROM test_emp_sequence
ORDER BY seq;

INSERT INTO test_emp
SELECT employee_id, first_name
FROM employees
WHERE department_id=20;

SELECT *
FROM test_emp_sequence
ORDER BY seq;

ALTER TRIGGER after_insert_each_row COMPILE;

ALTER TABLE test_emp DISABLE ALL TRIGGERS;

ALTER TABLE test_emp ENABLE ALL TRIGGERS;

DROP TRIGGER after_insert_stat;