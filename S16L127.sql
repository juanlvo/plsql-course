DROP TABLE hr_table;

CREATE TABLE hr_table(
  id NUMBER,
  name VARCHAR2(100)
);

CREATE OR REPLACE PROCEDURE add_hr_table(p_id NUMBER, p_name VARCHAR2) IS
BEGIN
  INSERT INTO hr_table VALUES (p_id, p_name);
END;

-- now connect with sys and create the user jack (orclpdb)
-- set session container=orclpdb;
-- create user ford identify by ford;
-- grant create session, connect to ford;

GRANT EXECUTE ON add_hr_table TO ford;

-- ford can execute EXECUTE hr.add_hr_table(1, 'khaled');

select * from hr_table;