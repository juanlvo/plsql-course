DECLARE
    v_counter NUMBER:=1;
BEGIN
    WHILE v_counter<=3
    LOOP
        dbms_output.put_line('welcome');
        v_counter:=v_counter+1;
    END LOOP;
END;
--
--print the employees first name for employee 100, 101, 102
--using while loop
DECLARE
    v_empno NUMBER:=100;
    v_first_name employees.first_name%TYPE;
BEGIN
    WHILE v_empno<=102
    LOOP
        SELECT first_name INTO v_first_name
        FROM employees
        WHERE employee_id=v_empno;
        dbms_output.put_line(v_empno||' '||v_first_name);
        v_empno:=v_empno+1;
    END LOOP;
END;
