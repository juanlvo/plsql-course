DROP TABLE products;
DROP TABLE all_products;
DROP synonym products;

CREATE TABLE all_products(
  product_id NUMBER,
  product_name VARCHAR2(100),
  product_category VARCHAR2(100)
);

INSERT INTO all_products VALUES (1, 'Sony 52 Inch/LED M0014', 'TV');

CREATE OR REPLACE SYNONYM products FOR all_products;

SELECT * FROM all_products;
SELECT * FROM products;

CREATE OR REPLACE VIEW v_all_products AS
  SELECT * FROM products;
  
CREATE OR REPLACE PROCEDURE read_from_synonym IS
BEGIN
  FOR i IN (SELECT * FROM products) LOOP
    NULL;
  END LOOP;
END;

CREATE OR REPLACE PROCEDURE read_from_synonym2 IS
BEGIN
  FOR i IN (SELECT product_id FROM products) LOOP
    NULL;
  END LOOP;
END;

SELECT *
FROM user_objects
WHERE LOWER(object_name) in ('all_products', 'v_all_products', 'read_from_synonym', 'read_from_synonym2');

CREATE OR REPLACE SYNONYM products FOR employees;

SELECT *
FROM user_objects
WHERE LOWER(object_name) in ('all_products', 'v_all_products', 'read_from_synonym', 'read_from_synonym2');

SELECT * FROM PRODUCTS;

EXEC read_from_synonym;

SELECT *
FROM user_objects
WHERE LOWER(object_name) in ('all_products', 'v_all_products', 'read_from_synonym', 'read_from_synonym2');

EXEC read_from_synonym2;

SELECT *
FROM user_objects
WHERE LOWER(object_name) in ('all_products', 'v_all_products', 'read_from_synonym', 'read_from_synonym2');

SELECT * FROM v_all_products;

