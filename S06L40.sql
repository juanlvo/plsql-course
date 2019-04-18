DECLARE
    x NUMBER := 5;
    y NUMBER;
BEGIN
    IF x <> y THEN
        dbms_output.put_line('welcome');
    ELSE
        dbms_output.put_line('Operator with null value always =null');
    END IF;
END;

----Solution
DECLARE
    x NUMBER;
    y NUMBER;
BEGIN
    IF NVL(x, 0) <> nvl(y, 0) THEN
        dbms_output.put_line('welcome');
    ELSE
        dbms_output.put_line('Operator with null value always = null');
    END IF;
END;
----Solution
DECLARE
    x NUMBER;
    y NUMBER;
BEGIN
    IF x is null and y is null THEN
        dbms_output.put_line('welcome');
    ELSE
        dbms_output.put_line('Operator with null value always = null');
    END IF;
END;
