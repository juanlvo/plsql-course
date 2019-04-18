DECLARE
    v_no NUMBER:=&v;
BEGIN
    IF v_no >= 10  THEN
        dbms_output.put_line('the number you entered is >= 10');
    END IF;
END;
--------------------
DECLARE
    v_no NUMBER:=&v;
BEGIN
    IF v_no >= 10  THEN
        dbms_output.put_line('the number you entered is >= 10');
    ELSE
        dbms_output.put_line('the number you entered is < 10');
    END IF;
END;
