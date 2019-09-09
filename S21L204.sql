CREATE OR REPLACE PACKAGE pkg IS
  PROCEDURE p1;
END;

CREATE OR REPLACE PACKAGE BODY pkg IS
  PROCEDURE p1 IS
  BEGIN
    DBMS_OUTPUT.PUT_LINE('welcome');
  END;
END;

CREATE OR REPLACE PROCEDURE call_from_pkg IS
BEGIN
  pkg.p1;
END;

SELECT *
FROM user_objects
WHERE LOWER(object_name) in ('pkg', 'call_from_pkg');

CREATE OR REPLACE PACKAGE BODY pkg IS
  PROCEDURE p1 IS
  BEGIN
      DBMS_OUTPUT.PUT_LINE('welcome');
      IF 1=1 THEN
        DBMS_OUTPUT.PUT_LINE('yes');
      END IF;
  END;
END;

SELECT *
FROM user_objects
WHERE LOWER(object_name) in ('pkg', 'call_from_pkg');

CREATE OR REPLACE PACKAGE pkg IS
  PROCEDURE p1;
  PROCEDURE p2;
END;

CREATE OR REPLACE PACKAGE BODY pkg IS
  PROCEDURE p1 IS
  BEGIN
    DBMS_OUTPUT.PUT_LINE('welcome');
  END;
  
  PROCEDURE p2 IS
  BEGIN
    DBMS_OUTPUT.PUT_LINE('welcome');
  END;
END;

SELECT *
FROM user_objects
WHERE LOWER(object_name) in ('pkg', 'call_from_pkg');

