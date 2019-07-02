CREATE OR REPLACE PROCEDURE add_hr_table(p_id NUMBER, p_name VARCHAR2) AUTHID CURRENT_USER IS
BEGIN
  INSERT INTO hr.hr_table values (p_id, p_name);
END;