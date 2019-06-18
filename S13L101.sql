CREATE OR REPLACE PACKAGE cur_pkg IS
  
  CURSOR c_emp IS
  SELECT employee_id
  FROM employees;
  
  PROCEDURE open;
  
  PROCEDURE close;
  
  PROCEDURE printnext_20;
  
END;

CREATE OR REPLACE PACKAGE BODY cur_pkg IS

  PROCEDURE open IS
  BEGIN
    IF NOT c_emp%isopen THEN
      OPEN c_emp;
    END IF;
  END open;
  
  PROCEDURE close IS
  BEGIN
    IF c_emp%isopen THEN
    CLOSE c_emp;
    END IF;
  END close;
  
  PROCEDURE printnext_20 IS
    v_emp_id NUMBER;
  BEGIN
    FOR i IN 1..20
    LOOP
      FETCH c_emp INTO v_emp_id;
        DBMS_OUTPUT.PUT_LINE(v_emp_id);
          IF c_emp%notfound THEN
            DBMS_OUTPUT.PUT_LINE('no more');
            CLOSE c_emp;
            EXIT;
          END IF;
    END LOOP;
  END printnext_20;

END cur_pkg;

------------------------------------------------------------------------------

BEGIN
  cur_pkg.open;
  cur_pkg.printnext_20;
END;

BEGIN
  cur_pkg.close;
END;