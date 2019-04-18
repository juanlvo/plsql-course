--basic loop
--write a basic loop to print welcome 3 times
DECLARE
    v_counter NUMBER := 0;
BEGIN
    LOOP
        v_counter := v_counter+1;
        dbms_output.put_line('welcome '||v_counter);
        
        EXIT WHEN v_counter=3;
    END LOOP;
END;
---
--- print the employees first name for employee 100, 101 and 102
--using basic loop
DECLARE
    v_empno NUMBER := 100;
    v_first_name employees.first_name%type;
BEGIN
    LOOP
        EXIT WHEN v_empno > 102;
        
        SELECT first_name INTO v_first_name
        FROM employees
        WHERE employee_id = v_empno;
        
        dbms_output.put_line(v_empno||' '||v_first_name);
        
        v_empno := v_empno+1;
    END LOOP;
END;
