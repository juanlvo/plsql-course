DROP TABLE customers;

CREATE TABLE customers(
  cust_id NUMBER,
  cust_name VARCHAR2(100)
);

SELECT MAX(cust_id)
FROM customers;

SELECT NVL(MAX(cust_id),0)
FROM customers;

CREATE OR REPLACE TRIGGER customers_seq BEFORE INSERT ON customers FOR EACH ROW
DECLARE
  v_max_id NUMBER;
BEGIN
  SELECT NVL(MAX(cust_id), 0)+1
  INTO v_max_id
  FROM customers;
  
  :new.cust_id:=v_max_id;
END;

INSERT INTO customers(cust_name)
SELECT first_name
FROM employees;

INSERT INTO customers(cust_name)
VALUES('oracle');

SELECT *
FROM customers;

INSERT INTO customers(cust_name)
VALUES('juan');

SELECT *
FROM customers;
