BEGIN
    FOR i IN 1..10
        LOOP
            dbms_output.put_line(i);
        END LOOP;
END;
--
--print under the number the symbols :) only for numbers 1, 2, 3, 4, 5
--method 1
DECLARE
    v_sym VARCHAR2(100);
BEGIN
    FOR i IN 1..10
        LOOP
            IF i BETWEEN 1 AND 5 THEN
                v_sym:=i||chr(10)||':)';
            ELSE
                v_sym:=i;
            END IF;
            dbms_output.put_line(v_sym);
        END LOOP;
END;
--method 2
BEGIN
    FOR i IN 1..10
        LOOP
            dbms_output.put_line(i);
            CONTINUE WHEN i>5;
            dbms_output.put_line(':)');
        END LOOP;
END;
