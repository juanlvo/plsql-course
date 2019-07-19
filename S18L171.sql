CREATE OR REPLACE TRIGGER before_create_trigger BEFORE CREATE ON SCHEMA
BEGIN
  IF TO_NUMBER(TO_CHAR(SYSDATE, 'hh24')) NOT BETWEEN 8 AND 13 THEN
    RAISE_APPLICATION_ERROR(-20001, 'Create not allowed now');
  END IF;
END;

CREATE TABLE t2(value1 NUMBER);

CREATE OR REPLACE VIEW x_y AS SELECT * FROM EMPLOYEES;

----------------------------------------------------------------------------

CREATE TABLE ddl_log (
  operation VARCHAR2(30),
  obj_owner VARCHAR2(30),
  object_name VARCHAR2(30),
  attempt_by VARCHAR2(30),
  attempt_dt DATE
);

CREATE OR REPLACE TRIGGER before_create_trigger AFTER DDL ON SCHEMA
BEGIN
  INSERT INTO ddl_log
  SELECT ora_sysevent,
          ora_dict_obj_owner,
          ora_dict_obj_name,
          USER,
          SYSDATE
    FROM DUAL;
END;

SELECT *
FROM ddl_log;

CREATE TABLE tabl1(n NUMBER);

SELECT * FROM ddl_log;

ALTER TABLE tabl1
ADD x NUMBER;

SELECT *
FROM ddl_log;

DROP TABLE tabl1;

SELECT * FROM ddl_log;