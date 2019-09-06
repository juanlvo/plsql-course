DROP TABLE customers;

CREATE TABLE customers (
  cust_id NUMBER,
  name VARCHAR2(100),
  tel VARCHAR2(10)
);

CREATE OR REPLACE VIEW v_customer AS
  SELECT cust_id, name
  FROM customer;
  
CREATE OR REPLACE view v2_customer AS
  SELECT *
  FROM customers;
  
SELECT *
FROM user_objects
WHERE LOWER(object_name) in ('customer', 'v_customer', 'v2_customer');

--adding a column to table customer may or may not invalidate v_customer
--from oracle 11g

ALTER TABLE customers
ADD (dob DATE);

SELECT *
FROM user_objects
WHERE LOWER(object_name) in ('customer', 'v_customer', 'v2_customer');

--alter column to the table customer may or may not invalidate the view

ALTER TABLE customers
MODIFY tel VARCHAR2(20);

SELECT *
FROM user_objects
WHERE LOWER(object_name) in ('customer', 'v_customer', 'v2_customer');

SELECT *
FROM v2_customer;

SELECT *
FROM user_objects
WHERE LOWER(object_name) in ('customer', 'v_customer', 'v2_customer');

-------------------------------------case 2------------------------------------

CREATE OR REPLACE FUNCTION get_cust_name (p_cust_id NUMBER) RETURN VARCHAR2 IS
  v_name customer.name%TYPE;
BEGIN
  SELECT name INTO v_name
  FROM customers
  WHERE cust_id=p_cust_id;
  EXCEPTION
    WHEN OTHERS THEN RETURN NULL;
END;

SELECT *
FROM user_objects
WHERE LOWER(object_name) in ('customer', 'v_customer', 'get_cust_name');

ALTER TABLE customer
ADD (location NUMBER);

SELECT *
FROM user_objects
WHERE LOWER(object_name) in ('customer', 'v_customer', 'get_cust_name');

SELECT get_cust_name(10) FROM DUAL;

SELECT *
FROM user_objects
WHERE LOWER(object_name) in ('customer', 'v_customer', 'get_cust_name');

--alter the column may or may not invalidate the function

ALTER TABLE customers
MODIFY tel VARCHAR2(300);

SELECT *
FROM user_objects
WHERE LOWER(object_name) in ('customer', 'v_customer', 'v2_customer', 'get_cust_name');

ALTER TABLE customers
MODIFY name VARCHAR2(300);

SELECT *
FROM user_objects
WHERE LOWER(object_name) in ('customer', 'v_customer', 'v2_customer', 'get_cust_name');

-----------------------------case 3---------------------------------------------
--Impact on the procedure when adding/altering the original table

CREATE OR REPLACE PROCEDURE p1 IS
BEGIN
  FOR i IN (SELECT cust_id FROM customers) LOOP
    DBMS_OUTPUT.PUT_LINE(i.cust_id);
  END LOOP;
END;

CREATE OR REPLACE PROCEDURE p2 IS
BEGIN
  FOR i IN (SELECT * FROM customers) LOOP
    DBMS_OUTPUT.PUT_LINE(i.cust_id);
  END LOOP;
END;

SELECT *
FROM user_objects
WHERE LOWER(object_name) in ('p1', 'p2');

ALTER TABLE customers
ADD (addresss VARCHAR2(100));

SELECT *
FROM user_objects
WHERE LOWER(object_name) in ('p1', 'p2');

ALTER TABLE customers
MODIFY cust_id NUMBER(10);

SELECT *
FROM user_objects
WHERE LOWER(object_name) in ('p1', 'p2');
