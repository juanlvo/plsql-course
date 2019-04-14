-- error because is not allow to use a reserved word
declare
having number:=50;
begin
    dbms_output.put_line(having);
end;
--- can be use name of functions but is not recomended
declare
trim number:=50;
begin
    dbms_output.put_line(trim);
    dbms_output.put_line(standard.trim(' juan '));
end;
--
DECLARE
    v_sal     employees.salary%type;
    v_new_sal employees.salary%type;
BEGIN
    SELECT salary
    INTO v_sal
    FROM employees
    WHERE employee_id=100;
    
    DBMS_OUTPUT.PUT_LINE('The old salary is '||v_sal);
    
    v_new_sal:=v_sal+100;
    
    UPDATE employees
    SET salary=v_new_sal
    WHERE employee_id=100;
    
    DBMS_OUTPUT.PUT_LINE('The new salary is '||v_new_sal);
    
    INSERT INTO departments (department_id, department_name, manager_id, location_id)
    VALUES (1, 'test', null, null);
    
    COMMIT;
END;

SELECT *
FROM EMPLOYEES
WHERE EMPLOYEE_ID = 100;

SELECT *
FROM DEPARTMENTS
WHERE DEPARTMENT_ID = 1;

BEGIN
DELETE FROM EMPLOYEES
WHERE EMPLOYEE_ID=-989;
END;