DROP TABLE students;
DROP VIEW v1_students;
DROP VIEW v2_students;
DROP PROCEDURE print_all_students;
DROP PROCEDURE print_all_students_from_v1;

CREATE TABLE students(
student_id NUMBER,
student_name VARCHAR2(100),
dob DATE
);

INSERT INTO students(student_id, student_name, dob) VALUES (1, 'Juan Vivas', TO_DATE('01011990', 'DDMMYYYY'));
INSERT INTO students(student_id, student_name, dob) VALUES (2, 'Ana Vivas', TO_DATE('01011992', 'DDMMYYYY'));
INSERT INTO students(student_id, student_name, dob) VALUES (3, 'Luis Vivas', TO_DATE('01011960', 'DDMMYYYY'));
INSERT INTO students(student_id, student_name, dob) VALUES (4, 'Juana de Vivas', TO_DATE('01011962', 'DDMMYYYY'));

COMMIT;

SELECT * FROM students;

CREATE OR REPLACE VIEW v1_students AS
  SELECT * FROM students;
  
CREATE OR REPLACE VIEW v2_students AS
  SELECT student_id, dob
  FROM students;
  
CREATE OR REPLACE PROCEDURE print_all_students IS
BEGIN
  FOR i IN (SELECT student_id FROM students) LOOP
    DBMS_OUTPUT.PUT_LINE(i.student_id);
  END LOOP;
END;

CREATE OR REPLACE PROCEDURE print_all_students_from_v1 IS
BEGIN
  FOR i IN (SELECT * FROM v1_students) LOOP
    DBMS_OUTPUT.PUT_LINE(i.student_id);
  END LOOP;
END;

SELECT *
FROM user_objects
WHERE LOWER(object_name) in ('v1_students', 'v2_students', 'print_all_students', 'print_all_students_from_v1');

ALTER TABLE students
MODIFY student_name VARCHAR2(200);

SELECT *
FROM user_objects
WHERE LOWER(object_name) in ('v1_students', 'v2_students', 'print_all_students', 'print_all_students_from_v1');

EXECUTE print_all_students_from_v1;

SELECT *
FROM user_objects
WHERE LOWER(object_name) in ('v1_students', 'v2_students', 'print_all_students', 'print_all_students_from_v1');
