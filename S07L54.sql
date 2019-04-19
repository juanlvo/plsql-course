 DECLARE
    TYPE tab_no IS TABLE OF employees%ROWTYPE
    INDEX BY PLS_INTEGER;
    
    v_tab_no tab_no;
    v_total NUMBER;
    
BEGIN
    v_tab_no(1).employee_id := 1;
    v_tab_no(1).first_name := 'juan';
    v_tab_no(1).last_name := 'vivas';
    
    v_tab_no(2).employee_id := 2;
    v_tab_no(2).first_name := 'luis';
    v_tab_no(2).last_name := 'vivas';
    
    dbms_output.put_line(v_tab_no(1).employee_id||' '||v_tab_no(1).first_name||' '||v_tab_no(1).last_name);
    dbms_output.put_line(v_tab_no(2).employee_id||' '||v_tab_no(2).first_name||' '||v_tab_no(2).last_name);
END;
--
--
DECLARE

    TYPE tab_no IS TABLE OF employees%ROWTYPE
    INDEX BY PLS_INTEGER;
    
    v_tab_no tab_no;

BEGIN

    FOR i IN 100..104
    LOOP
        SELECT *
        INTO v_tab_no(i)
        FROM employees
        WHERE employee_id=i;
        
        dbms_output.put_line(v_tab_no(i).employee_id||' '||v_tab_no(i).first_name||' '||v_tab_no(i).last_name);
    END LOOP;

END;
--
DECLARE
    TYPE tab_no IS TABLE OF employees%ROWTYPE
    INDEX BY PLS_INTEGER;
    
    v_tab_no tab_no;
BEGIN

    FOR i IN 100..104
    LOOP
        SELECT *
        INTO v_tab_no(i)
        FROM employees
        WHERE employee_id=i;
    END LOOP;

    FOR i IN v_tab_no.FIRST..v_tab_no.LAST
    LOOP
        dbms_output.put_line(v_tab_no(i).employee_id);
        dbms_output.put_line(v_tab_no(i).first_name);
        dbms_output.put_line(v_tab_no(i).last_name);
        dbms_output.put_line(v_tab_no(i).salary);
    END LOOP;
END;
