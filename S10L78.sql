DELETE PRODUCTS;

SELECT * FROM PRODUCTS;

CREATE OR REPLACE PROCEDURE add_products
(p_prod_id NUMBER, p_prod_name VARCHAR2:='UNKNOWN', p_prod_type VARCHAR2 DEFAULT 'UNKNOWN') IS
BEGIN
  INSERT INTO products VALUES (p_prod_id, p_prod_name, p_prod_type);
  DBMS_OUTPUT.PUT_LINE(p_prod_id||' '||p_prod_name||' inserted ');
  COMMIT;
EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('error in insert'||p_prod_id||' '||p_prod_name);
    DBMS_OUTPUT.PUT_LINE(SQLCODE);
    DBMS_OUTPUT.PUT_LINE(SQLERRM);
END;
-----
BEGIN
  add_products(10, 'PC');
  add_products(10, 'Laptop');
  add_products(20, 'Keyboard');
END;

select *
from products;

DELETE PRODUCTS;

select *
from products;

------


CREATE OR REPLACE PROCEDURE add_products
(p_prod_id NUMBER, p_prod_name VARCHAR2:='UNKNOWN', p_prod_type VARCHAR2 DEFAULT 'UNKNOWN') IS
BEGIN
  INSERT INTO products VALUES (p_prod_id, p_prod_name, p_prod_type);
  DBMS_OUTPUT.PUT_LINE(p_prod_id||' '||p_prod_name||' inserted ');
  COMMIT;

END;
----

BEGIN
  add_products(10, 'PC');
  add_products(10, 'Laptop');
  add_products(20, 'Keyboard');
END;

select *
from products;

DELETE PRODUCTS;

select *
from products;

CREATE OR REPLACE PROCEDURE add_products
(p_prod_id NUMBER, p_prod_name VARCHAR2:='UNKNOWN', p_prod_type VARCHAR2 DEFAULT 'UNKNOWN') IS
BEGIN
  INSERT INTO products VALUES (p_prod_id, p_prod_name, p_prod_type);
  DBMS_OUTPUT.PUT_LINE(p_prod_id||' '||p_prod_name||' inserted ');

END;

BEGIN
  add_products(10, 'PC');
  add_products(10, 'Laptop');
  add_products(20, 'Keyboard');
END;

select *
from products;