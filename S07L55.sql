DECLARE
    TYPE t_locations IS TABLE OF VARCHAR2(100);
    loc t_locations;
BEGIN
    loc := t_locations('USA', 'UK', 'JORDAN');
    
    DBMS_OUTPUT.put_line(loc(1));
    DBMS_OUTPUT.PUT_LINE(loc(2));
    DBMS_OUTPUT.PUT_LINE(loc(3));
END;
-----
DECLARE
    TYPE t_locations IS TABLE OF VARCHAR2(100);
    loc t_locations;
BEGIN
    loc := t_locations('USA', 'UK', 'JORDAN');
    
    FOR i IN loc.FIRST..loc.LAST
    LOOP
        DBMS_OUTPUT.put_line(loc(i));
    END LOOP;
END;
--
DECLARE
    TYPE t_locations IS TABLE OF VARCHAR2(100);
    loc t_locations;
BEGIN
    loc := t_locations('USA', 'UK', 'JORDAN');
    loc.EXTEND;
    loc(4) := 'Lebanon';
    
    DBMS_OUTPUT.put_line(loc(1));
    DBMS_OUTPUT.PUT_LINE(loc(2));
    DBMS_OUTPUT.PUT_LINE(loc(3));
    DBMS_OUTPUT.PUT_LINE(loc(4));
END;
--
DECLARE
    TYPE t_locations IS TABLE OF VARCHAR2(100);
    loc t_locations;
BEGIN
    loc:=t_locations('Japan', 'South Korea', 'Thailand');
    loc.delete(2);
    loc(2):='India';
    
    DBMS_OUTPUT.PUT_LINE(loc(1));
    DBMS_OUTPUT.PUT_LINE(loc(2));
    DBMS_OUTPUT.PUT_LINE(loc(3));
END;
--
--
CREATE OR REPLACE TYPE t_tel AS TABLE OF NUMBER;

CREATE TABLE x_costumer (
    cust_id NUMBER,
    cust_name VARCHAR2(100),
    tel t_tel
)
NESTED TABLE tel STORE AS t_tel_tbl;

INSERT INTO x_costumer (cust_id, cust_name, tel)
VALUES (1, 'juan', t_tel(050121,0501245, 0589877));

SELECT *
FROM x_costumer;
