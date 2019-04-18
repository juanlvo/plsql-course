BEGIN
    FOR i IN 1..3
    LOOP
        dbms_output.put_line('welcome '||i);
    END LOOP;
END;
---
BEGIN
    FOR i IN 1..1
        LOOP
            dbms_output.put_line('welcome '||i);
        END LOOP;
END;
---
BEGIN
    FOR i IN 3..5
        LOOP
            dbms_output.put_line('welcome '||i);
        END LOOP;
END;
---
BEGIN
    FOR i IN REVERSE 1..3
        LOOP
            dbms_output.put_line('welcome '||i);
        END LOOP;
END;
---
BEGIN
    FOR i IN 1..9/2
        LOOP
            DBMS_OUTPUT.PUT_LINE ('welcome '||i);
        END LOOP;
END;
--
DECLARE
    v_name varchar2(100);
BEGIN
    FOR i IN 100..102
        LOOP
            SELECT first_name||' '||last_name
            INTO v_name
            FROM employees
            WHERE employee_id=i;
            
            dbms_output.put_line(i||':'||v_name);
        END LOOP;
END;
--
/*
try to print this
*
**
***
****
*****
*/
DECLARE
    v_string VARCHAR2(5);
BEGIN
    FOR i IN 1..5
        LOOP
            v_string := v_string||'*';
            dbms_output.put_line(v_string);
        END LOOP;
END;
