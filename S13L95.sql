DROP TABLE customer;

CREATE TABLE customer(
  cust_id NUMBER,
  name VARCHAR2(100),
  birthday DATE
);

CREATE OR REPLACE PACKAGE overload_proc IS
  PROCEDURE add_cust(p_id NUMBER, p_name VARCHAR2, p_bd DATE);
  PROCEDURE add_cust(p_id NUMBER, p_name VARCHAR2);
END;
/


CREATE OR REPLACE PACKAGE BODY overload_proc IS
  PROCEDURE add_cust(p_id NUMBER, p_name VARCHAR2, p_bd DATE) IS
  BEGIN
    INSERT INTO customer(cust_id, name, birthday)
          VALUES(p_id, p_name, p_bd);
    COMMIT;
  END;
  
  PROCEDURE add_cust(p_id NUMBER, p_name VARCHAR2) IS
  BEGIN
        INSERT INTO customer(cust_id, name)
          VALUES(p_id, p_name);
    COMMIT;
  END;
END;
-----------------------------------------------------------------------------
EXECUTE overload_proc.add_cust(1, 'jack', '1-jan-90');

SELECT *
FROM customer;

EXECUTE overload_proc.add_cust(2, 'ford');

SELECT *
FROM customer;
-----------------------------------------------------------------------------
CREATE OR REPLACE PACKAGE overload_proc IS
  PROCEDURE add_cust(p_id NUMBER, p_name VARCHAR2, p_bd DATE);
  PROCEDURE add_cust(p_id NUMBER, p_name VARCHAR2);
  PROCEDURE add_cust(p_name VARCHAR2, p_id NUMBER);
END;
/


CREATE OR REPLACE PACKAGE BODY overload_proc IS
  PROCEDURE add_cust(p_id NUMBER, p_name VARCHAR2, p_bd DATE) IS
  BEGIN
    INSERT INTO customer(cust_id, name, birthday)
          VALUES(p_id, p_name, p_bd);
    COMMIT;
  END;
  
  PROCEDURE add_cust(p_id NUMBER, p_name VARCHAR2) IS
  BEGIN
        INSERT INTO customer(cust_id, name)
          VALUES(p_id, p_name);
    COMMIT;
  END;
  
  PROCEDURE add_cust(p_name VARCHAR2, p_id NUMBER) IS
  BEGIN
    INSERT INTO customer(name, cust_id)
    VALUES (p_name, p_id);
    COMMIT;
  END;
END; 
/
-------------------------------------------------------------------------------
EXECUTE OVERLOAD_PROC.add_cust('juan', 3);

SELECT *
FROM customer;
-------------------------------------------------------------------------------
CREATE OR REPLACE PACKAGE overload_proc IS
  PROCEDURE add_cust(p_id NUMBER, p_name VARCHAR2, p_bd DATE);
  PROCEDURE add_cust(p_id INTEGER, p_name VARCHAR2, p_bd DATE);
END;
/

CREATE OR REPLACE PACKAGE BODY overload_proc IS
  PROCEDURE add_cust(p_id NUMBER, p_name VARCHAR2, p_bd DATE) IS
  BEGIN
    INSERT INTO customer(cust_id, name, birthday)
          VALUES(p_id, p_name, p_bd);
    COMMIT;
  END;
  
  PROCEDURE add_cust(p_id INTEGER, p_name VARCHAR2, p_bd DATE) IS
  BEGIN
    INSERT INTO customer(cust_id, name, birthday)
          VALUES(p_id, p_name, p_bd);
    COMMIT;
  END;

END; 
/

EXECUTE overload_proc.add_cust(10.6, 'dina', '1-jan-90');