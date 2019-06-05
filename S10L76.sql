DROP TABLE products;

CREATE TABLE products(
  prod_id NUMBER,
  prod_name VARCHAR2(20),
  prod_type VARCHAR2(20),
  CONSTRAINT products_pk PRIMARY KEY (prod_id)
);

----------------------------------------------------------

CREATE OR REPLACE PROCEDURE add_products
(p_prod_id NUMBER, p_prod_name VARCHAR2, p_prod_type VARCHAR2) IS
BEGIN
  INSERT INTO products VALUES (p_prod_id, p_prod_name, p_prod_type);
  COMMIT;
EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('error in insert');
    DBMS_OUTPUT.PUT_LINE(SQLCODE);
    DBMS_OUTPUT.PUT_LINE(SQLERRM);
END;

--ways to call the procedure
--
EXECUTE add_products(1, 'Laptop', 'SW');

select *
from products;

--try to send less parameters, it will an error message
EXECUTE add_products(1, 'PC');

--try to enter an existing product, this will generate a exception
EXECUTE add_products(1, 'Laptop', 'SW');

--second way to call the procedure, calling the variables
EXECUTE add_products(p_prod_id=>2, p_prod_name=>'PC', p_prod_type=>'SW');


select *
from products;

EXECUTE add_products( p_prod_name=>'Keyword', p_prod_id=>3, p_prod_type=>'HD');

select *
from products;

--mix way to call a procedure

EXECUTE add_products(4, p_prod_type=>'SW', p_prod_name=>'Windows 10');

select *
from products;
