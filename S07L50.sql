select *
from departments
where department_id=10;

create table copy_departments
as select * from departments where 1=2;

select *
from copy_departments;

----

DECLARE
    TYPE t_dept IS RECORD (
        v_dept_id      departments.department_id%TYPE,
        v_dept_name    departments.department_name%TYPE,
        v_dept_manager departments.manager_id%TYPE,
        v_dept_loc     departments.location_id%TYPE
    );
    
    v_dept t_dept;
BEGIN

    SELECT department_id,
            department_name,
            manager_id,
            location_id
    INTO    v_dept
    FROM    departments
    WHERE   department_id = 10;
    
    INSERT INTO copy_departments VALUES v_dept;
    
END;
---
DECLARE
    v_dept departments%ROWTYPE;
BEGIN
    SELECT department_id,
            department_name,
            manager_id,
            location_id
    INTO    v_dept
    FROM    departments
    WHERE   department_id=10;
    
    INSERT INTO copy_departments VALUES v_dept;
END;
--
DECLARE
    v_dept departments%ROWTYPE;
BEGIN
    v_dept.department_id := 10;
    v_dept.department_name := 'test';
    
    UPDATE copy_departments
    SET ROW=v_dept;
END;
--
SELECT *
FROM copy_departments;
