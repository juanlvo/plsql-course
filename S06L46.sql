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
----
DECLARE
    v_star VARCHAR2(100);
BEGIN
<<outer_loop>>
    FOR i IN 1..5
        LOOP
            <<inner_loop>>
            FOR j IN 1..i
                LOOP
                    v_star:=v_star||'*';
                    EXIT outer_loop WHEN i=3;
                END LOOP inner_loop;
            dbms_output.put_line(v_star);
            v_star:=null;
        END LOOP outer_loop;
END;
