DROP TABLE customers;

CREATE TABLE customers(
  cust_id NUMBER,
  name VARCHAR2(100),
  status CHAR(1)
);

CREATE OR REPLACE TRIGGER customers_default_status BEFORE INSERT ON customers
FOR EACH ROW
BEGIN
  :new.status:='A';
END;

INSERT INTO customers(cust_id, name)
VALUES(1, 'OMAR');

SELECT *
FROM customers;