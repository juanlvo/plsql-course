CREATE OR REPLACE PACKAGE proc_rules_calling IS
  
  PROCEDURE print_emp_details(p_emp_id NUMBER);

END;

CREATE OR REPLACE PACKAGE BODY proc_rules_calling IS

  FUNCTION get_no_work_days (p_emp_id NUMBER) RETURN NUMBER IS
    v_hiredate DATE;
  BEGIN
    SELECT hire_date
    INTO v_hiredate
    FROM employees
    WHERE employee_id=p_emp_id;
    
    RETURN round(SYSDATE-v_hiredate);
  END;
  
  PROCEDURE print_emp_details(p_emp_id NUMBER) IS
    v_details employees%ROWTYPE;
  BEGIN
    SELECT *
    INTO v_details
    FROM employees
    WHERE employee_id=p_emp_id;
    
    DBMS_OUTPUT.PUT_LINE('id:'||v_details.employee_id);
    DBMS_OUTPUT.PUT_LINE('fname:'||v_details.first_name);
    DBMS_OUTPUT.PUT_LINE('salary:'||v_details.salary);
    DBMS_OUTPUT.PUT_LINE('hire date:'||v_details.hire_date);
    DBMS_OUTPUT.PUT_LINE('no of days work:'||get_no_work_days(p_emp_id));
  END;

END;
----------------------------------------------------------------------------
EXECUTE proc_rules_calling.print_emp_details(101);
-----------------------------------------------------------------------------

CREATE OR REPLACE PACKAGE BODY proc_rules_calling IS

  PROCEDURE print_emp_details(p_emp_id NUMBER) IS
    v_details employees%ROWTYPE;
  BEGIN
    SELECT *
    INTO v_details
    FROM employees
    WHERE employee_id=p_emp_id;
    
    DBMS_OUTPUT.PUT_LINE('id:'||v_details.employee_id);
    DBMS_OUTPUT.PUT_LINE('fname:'||v_details.first_name);
    DBMS_OUTPUT.PUT_LINE('salary:'||v_details.salary);
    DBMS_OUTPUT.PUT_LINE('hire date:'||v_details.hire_date);
    DBMS_OUTPUT.PUT_LINE('no of days work:'||get_no_work_days(p_emp_id));
  END;

  FUNCTION get_no_work_days (p_emp_id NUMBER) RETURN NUMBER IS
    v_hiredate DATE;
  BEGIN
    SELECT hire_date
    INTO v_hiredate
    FROM employees
    WHERE employee_id=p_emp_id;
    
    RETURN round(SYSDATE-v_hiredate);
  END;
  
END;

-------------------------------------------------------------------------------
DROP PACKAGE proc_rules_calling;

CREATE OR REPLACE PACKAGE proc_rules_calling IS
  
  PROCEDURE print_emp_details(p_emp_id NUMBER);

END;


CREATE OR REPLACE PACKAGE BODY proc_rules_calling IS

  FUNCTION get_no_work_days (p_emp_id NUMBER) RETURN NUMBER;

  PROCEDURE print_emp_details(p_emp_id NUMBER) IS
    v_details employees%ROWTYPE;
  BEGIN
    SELECT *
    INTO v_details
    FROM employees
    WHERE employee_id=p_emp_id;
    
    DBMS_OUTPUT.PUT_LINE('id:'||v_details.employee_id);
    DBMS_OUTPUT.PUT_LINE('fname:'||v_details.first_name);
    DBMS_OUTPUT.PUT_LINE('salary:'||v_details.salary);
    DBMS_OUTPUT.PUT_LINE('hire date:'||v_details.hire_date);
    DBMS_OUTPUT.PUT_LINE('no of days work:'||get_no_work_days(p_emp_id));
  END;

  FUNCTION get_no_work_days (p_emp_id NUMBER) RETURN NUMBER IS
    v_hiredate DATE;
  BEGIN
    SELECT hire_date
    INTO v_hiredate
    FROM employees
    WHERE employee_id=p_emp_id;
    
    RETURN round(SYSDATE-v_hiredate);
  END;
  
END;
-------------------------------------------------------------------------------
EXECUTE proc_rules_calling.print_emp_details(104);