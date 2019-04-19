DECLARE
    
    TYPE tab_no IS TABLE OF VARCHAR2(100)
    INDEX BY PLS_INTEGER;
    
    v_tab_no tab_no;
    v_total NUMBER;
    
BEGIN
    v_tab_no(1):='juan';
    v_tab_no(2):='luis';
    v_tab_no(3):='vivas';
    v_tab_no(6):='occhipinti';
    v_tab_no(5):='pepe';
    
    FOR i IN 1..10
    LOOP
        IF v_tab_no.exists(i) THEN
            dbms_output.put_line('the element '||i||' exists in the array and the value is '||v_tab_no(i));
        ELSE
            dbms_output.put_line('the element '||i||' does not exists in the array');
        END IF;
    END LOOP;
    
    v_total:=v_tab_no.count;
    
    dbms_output.put_line('the total elements in the array is '||v_total);
    dbms_output.put_line('the first element INDEX in the array is '||v_tab_no.FIRST);
    dbms_output.put_line('the NEXT element INDEX AFTER INDEX 3 is '||v_tab_no.NEXT(3));
    
END;
