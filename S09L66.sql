DESC departments;

INSERT INTO departments (department_id, department_name)
VALUES (1, NULL);


BEGIN

INSERT INTO departments (department_id, department_name)
VALUES (1, NULL);

END;

------

DECLARE
    e_insert EXCEPTION;
    PRAGMA exception_init(e_insert, -01400);
BEGIN
    INSERT INTO departments (department_id, department_name)
    VALUES (1, NULL);
    
    EXCEPTION
        WHEN e_insert THEN
            dbms_output.put_line('insert failed');
            dbms_output.put_line(sqlcode);
            dbms_output.put_line(sqlerrm);
            
        WHEN OTHERS THEN
            NULL;
END;
--
--this code it doesn't have a good structure way, because the update will not execute when there is an exception in the insert

DECLARE
    e_insert EXCEPTION;
    PRAGMA exception_init(e_insert, -01400);
BEGIN
    INSERT INTO departments (department_id, department_name)
    VALUES (1, NULL);
    
    UPDATE employees
    SET employee_id='ss'
    WHERE employee_id=100;
    
    EXCEPTION
        WHEN e_insert THEN
            dbms_output.put_line('insert failed');
            dbms_output.put_line(sqlcode);
            dbms_output.put_line(sqlerrm);
            
        WHEN OTHERS THEN
            NULL;
END;
--

DECLARE
    e_insert EXCEPTION;
    PRAGMA exception_init(e_insert, -01400);
BEGIN
    BEGIN
        INSERT INTO departments (department_id, department_name)
        VALUES (1, NULL);
    EXCEPTION
        WHEN e_insert THEN
            dbms_output.put_line('insert failed');
            dbms_output.put_line(sqlcode);
            dbms_output.put_line(sqlerrm);
        WHEN OTHERS THEN
            NULL;
    END;
    BEGIN
        UPDATE employees
        SET employee_id='ss'
        WHERE employee_id=100;
    EXCEPTION
        WHEN OTHERS THEN
            dbms_output.put_line('insert failed');
            dbms_output.put_line(sqlcode);
            dbms_output.put_line(sqlerrm);
    END;
END;