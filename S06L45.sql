/*
try to do this
*
**
***
****
*****
*/
DECLARE
    v_star VARCHAR2(100);
BEGIN
    FOR i IN 1..5
        LOOP
            FOR j IN 1..i
                LOOP
                    v_star:=v_star||'*';
                END LOOP;
            dbms_output.put_line(v_star);
            v_star:=null;
        END LOOP;
END;
