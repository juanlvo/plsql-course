DROP TABLE emp_tel;

CREATE TABLE emp_tel (
emp_id      NUMBER PRIMARY KEY,
full_name   VARCHAR2(100),
mob1        VARCHAR2(20),
mob2        VARCHAR2(20),
landline    VARCHAR2(20)
);

INSERT INTO emp_tel VALUES
(1, 'Juan Vivas', '+352691222333', '+352621444555', '+352123456');

SELECT *
FROM emp_tel;
--
DECLARE
    TYPE t_tel IS RECORD (
        v_mob1      emp_tel.mob1%TYPE,
        v_mob2      emp_tel.mob2%TYPE,
        v_landline  emp_tel.landline%TYPE
    );
    
    TYPE t_emp_tel IS RECORD (
        v_emp_id    emp_tel.emp_id%TYPE,
        v_full_name emp_tel.full_name%TYPE,
        v_tel       t_tel
    );
    
    v_rec t_emp_tel;
BEGIN
    SELECT emp_id,
            full_name,
            mob1,
            mob2,
            landline
    INTO    v_rec.v_emp_id,
            v_rec.v_full_name,
            v_rec.v_tel.v_mob1,
            v_rec.v_tel.v_mob2,
            v_rec.v_tel.v_landline
    FROM    emp_tel
    WHERE   emp_id=1;
    
    dbms_output.put_line('emp_id: '||v_rec.v_emp_id);
    dbms_output.put_line('landline: '||v_rec.v_tel.v_landline);
END;
