-----------WITHOUT BULK--------------------------------------------------------

DECLARE
  TYPE emp_t IS TABLE OF employees%ROWTYPE;
  emp_table emp_t;
  CURSOR emp_c IS SELECT * FROM EMPLOYEES;
  C NUMBER:=0;
BEGIN
  emp_table:=emp_t();
  OPEN emp_c;
    LOOP
      emp_table.EXTEND;
      c:=c+1;
      FETCH emp_c INTO emp_table(c);
        EXIT WHEN emp_c%NOTFOUND;
      DBMS_OUTPUT.PUT_LINE(emp_table(c).first_name);
    END LOOP;
    CLOSE emp_c;
END;

-------------------------with bulk collect--------------------------------------

DECLARE
  TYPE emp_t IS TABLE OF employees%ROWTYPE;
  emp_table emp_t;
  CURSOR emp_c IS SELECT * FROM EMPLOYEES;
  C NUMBER:=0;
BEGIN
  emp_table:=emp_t();
  OPEN emp_c;
  FETCH emp_c BULK COLLECT INTO emp_table;
  
  FOR i IN emp_table.FIRST..emp_table.LAST LOOP
    DBMS_OUTPUT.PUT_LINE(emp_table(i).first_name);
  END LOOP;
END;

--------------------with bulk and limit-----------------------------------------

DECLARE
  TYPE emp_t IS TABLE OF employees%ROWTYPE;
  emp_table emp_t;
  CURSOR emp_c IS SELECT * FROM EMPLOYEES;
  C NUMBER:=0;
BEGIN
  emp_table:=emp_t();
  OPEN emp_c;
  FETCH emp_c BULK COLLECT INTO emp_table LIMIT 5;
  
  FOR i IN emp_table.FIRST..emp_table.LAST LOOP
    DBMS_OUTPUT.PUT_LINE(emp_table(i).first_name);
  END LOOP;
END;