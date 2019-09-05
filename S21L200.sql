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

