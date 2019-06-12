DROP TABLE student;

CREATE TABLE student (
  student_id NUMBER,
  first_name VARCHAR2(100),
  birthday DATE,
  CONSTRAINT student_pk PRIMARY KEY (student_id)
);

DROP SEQUENCE student_seq;

CREATE SEQUENCE student_seq;

-----------------------------------------------------------------------------
--we need to create a package for insert, delete, query a student
--1. creation of the package spec.

CREATE OR REPLACE PACKAGE general_student IS

  PROCEDURE insert_student(p_first_name VARCHAR2, p_birthday DATE);
  
  PROCEDURE delete_student(p_student_id NUMBER);
  
  FUNCTION get_name(p_student_id NUMBER) RETURN VARCHAR2;
  
END;
------------------------------------------------------------------
CREATE OR REPLACE PACKAGE BODY general_student IS

  PROCEDURE insert_student(p_first_name VARCHAR2, p_birthday DATE) IS
  BEGIN
    INSERT INTO student VALUES(student_seq.NEXTVAL, p_first_name, p_birthday);
    COMMIT;
  EXCEPTION
    WHEN OTHERS THEN
      DBMS_OUTPUT.PUT_LINE(SQLCODE);
      DBMS_OUTPUT.PUT_LINE(SQLERRM);
  END;
  
  PROCEDURE delete_student(p_student_id NUMBER) IS
  BEGIN
    DELETE FROM student
    WHERE student_id=p_student_id;
    COMMIT;
  EXCEPTION
    WHEN OTHERS THEN
      DBMS_OUTPUT.PUT_LINE(SQLCODE);
      DBMS_OUTPUT.PUT_LINE(SQLERRM);
  END;
  
  FUNCTION get_name(p_student_id NUMBER) RETURN VARCHAR2 IS
    v_name student.first_name%TYPE;
  BEGIN
    SELECT first_name
    INTO v_name
    FROM student
    WHERE student_id=p_student_id;
    RETURN v_name;
  EXCEPTION
    WHEN OTHERS THEN
      DBMS_OUTPUT.PUT_LINE(SQLCODE);
      DBMS_OUTPUT.PUT_LINE(SQLERRM);
  END;
  
END;
-----------------------------------------------------------------------------
EXECUTE GENERAL_STUDENT.insert_student('Juan Vivas', '09-feb-1985');
EXECUTE GENERAL_STUDENT.insert_student('Ana Vivas', '04-nov-1986');

SELECT *
FROM student;

EXECUTE GENERAL_STUDENT.delete_student(1);

SELECT *
FROM student;


SELECT general_student.get_name(2) FROM DUAL;
