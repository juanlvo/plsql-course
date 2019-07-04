BEGIN
  DBMS_OUTPUT.PUT_LINE(SQLERRM(-12899));
END;
--------------------------------------------------------------------------------
DROP TABLE ename;

CREATE TABLE ename AS
  SELECT DISTINCT first_name FROM employees;
  
SELECT *
FROM ename;

DECLARE
  TYPE ename_t IS TABLE OF VARCHAR2(100);
  ename_table ename_t:=ename_t();
  c NUMBER := 0;
  errors NUMBER;
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
    ERRORS := SQL%BULK_EXCEPTIONS.COUNT;
  DBMS_OUTPUT.PUT_LINE('The total number of errors ocurred are '||errors);
    FOR j IN 1..ERRORS LOOP
      DBMS_OUTPUT.PUT_LINE('The error iteration is '
                          ||SQL%BULK_EXCEPTIONS(j).ERROR_INDEX
                          ||' and the error code is '
                          ||SQLERRM(SQL%BULK_EXCEPTIONS(j).ERROR_CODE));
    END LOOP;
END;

SELECT *
FROM ename;