DESC employees;

DROP TABLE ename;

CREATE TABLE ename AS
  SELECT DISTINCT(first_name) FROM employees;
  
SELECT *
FROM ename;

DECLARE
  TYPE ename_t IS TABLE OF VARCHAR2(100);
  ename_table ename_t:=ename_t();
  c NUMBER:=0;
BEGIN
  FOR i IN (SELECT * FROM ename) LOOP
    c:=c+1;
    ename_table.EXTEND;
    ename_table(c):=i.first_name;
  END LOOP;
  
  FOR i IN ename_table.FIRST..ename_table.LAST LOOP
    UPDATE ename
    SET first_name=first_name||' to be added:)'
    WHERE first_name=ename_table(i);
  END LOOP;
  EXCEPTION
  WHEN OTHERS THEN
    NULL;
END;

--------------------------------------------------------------------------------
--now with bulk

DROP TABLE ename;

CREATE TABLE ename AS
  SELECT DISTINCT(first_name) FROM employees;
  
SELECT *
FROM ename;


DECLARE
  TYPE ename_t IS TABLE OF VARCHAR2(100);
  ename_table ename_t:=ename_t();
  c NUMBER:=0;
BEGIN
  FOR i IN (SELECT * FROM ename) LOOP
    c:=c+1;
    ename_table.EXTEND;
    ename_table(c):=i.first_name;
  END LOOP;
  
  FORALL i IN ename_table.FIRST..ename_table.LAST SAVE EXCEPTIONS
    UPDATE ename
    SET first_name=first_name||' to be added:)'
    WHERE first_name=ename_table(i);

  EXCEPTION
  WHEN OTHERS THEN
    NULL;
END;
