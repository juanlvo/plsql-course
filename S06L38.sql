-- simple if statement
DECLARE
    v_no NUMBER:=&v;
BEGIN
    IF v_no >= 10  THEN
        dbms_output.put_line('the number you entered is >= 10');
    END IF;
END;
--- if and else statement
DECLARE
    v_no NUMBER:=&v;
BEGIN
    IF v_no >= 10  THEN
        dbms_output.put_line('the number you entered is >= 10');
    ELSE
        dbms_output.put_line('the number you entered is < 10');
    END IF;
END;
---------- if / elsif statment
DECLARE
    v_grade NUMBER := &v;
BEGIN
    IF v_grade BETWEEN 90 AND 100 THEN
        dbms_output.put_line('the grade is A');
    ELSIF v_grade BETWEEN 80 AND 89 THEN
        dbms_output.put_line('the grade is B');
    ELSIF v_grade BETWEEN 70 AND 79 THEN
        dbms_output.put_line('the grade is C');
    ELSIF v_grade BETWEEN 60 AND 69 THEN
        dbms_output.put_line('the grade is D');
    ELSE
        dbms_output.put_line('the grade is F');
    END IF;
END;
---------- IF with validation of negative values
DECLARE
    v_grade NUMBER := &v;
BEGIN
    IF v_grade BETWEEN 0 AND 100 THEN
        IF v_grade BETWEEN 90 AND 100 THEN
            dbms_output.put_line('the grade is A');
        ELSIF v_grade BETWEEN 80 AND 89 THEN
            dbms_output.put_line('the grade is B');
        ELSIF v_grade BETWEEN 70 AND 79 THEN
            dbms_output.put_line('the grade is C');
        ELSIF v_grade BETWEEN 60 AND 69 THEN
            dbms_output.put_line('the grade is D');
        ELSE
            dbms_output.put_line('the grade is F');
        END IF;
    ELSE
        dbms_output.put_line('the grade should be number between 0 and 100');
    END IF;
END;

/* Write a block that take the employee id as subtitute variable
* Output message: 'yes, the salary is >= 15000' if the salary >= 15000
* Output message: 'no, the salary is < 15000' if the salary < 15000
*/
DECLARE
    v_sal employee.salary%type;
BEGIN
    SELECT salary INTO v_sal
    FROM employees
    WHERE employee_id=&emp_id;
    
    IF v_sal >= 15000 THEN
        dbms_output.put_line('yes, the salary is >= 15000');
    ELSE
        dbms_output.put_line('no, the salary is < 15000');
    END IF;
END;
