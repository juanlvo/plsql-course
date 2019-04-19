DECLARE
    TYPE tab_no IS TABLE OF VARCHAR2(100)
    INDEX BY PLS_INTEGER;
    
    v_tab_no tab_no;
BEGIN
    v_tab_no(1) := 'juan';
    v_tab_no(6) := 'luis';
    v_tab_no(4) := 'vivas';
    
    dbms_output.put_line(v_tab_no(1));
    dbms_output.put_line(v_tab_no(6));
    dbms_output.put_line(v_tab_no(4));
END;
----
DECLARE
    TYPE tab_no IS TABLE OF NUMBER
    INDEX BY VARCHAR2(100);
    
    v_tab_no tab_no;
BEGIN
    v_tab_no('juan') := 1;
    v_tab_no('luis') := 6;
    v_tab_no('vivas') := 4;
    
    dbms_output.put_line(v_tab_no('juan'));
    dbms_output.put_line(v_tab_no('luis'));
    dbms_output.put_line(v_tab_no('vivas'));
END;
----
DECLARE
    TYPE tab_emp IS TABLE OF VARCHAR2(100)
    INDEX BY PLS_INTEGER;
    
    v_tab_emp tab_emp;
    v_name VARCHAR2(100);
BEGIN

    FOR i IN 100..110
    LOOP
        SELECT first_name||' '||last_name INTO v_name
        FROM    employees
        WHERE   employee_id=i;
        v_tab_emp(i) := v_name;
    END LOOP;
    
    FOR i IN 100..110
    LOOP
        dbms_output.put_line(v_tab_emp(i));
    END LOOP;

END;
