CREATE OR REPLACE PROCEDURE add_products
(p_prod_id NUMBER, p_prod_name VARCHAR2:='UNKNOWN', p_prod_type VARCHAR2 DEFAULT 'UNKNOWN') IS
BEGIN
  INSERT INTO products VALUES (p_prod_id, p_prod_name, p_prod_type);
  COMMIT;
EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('error in insert');
    DBMS_OUTPUT.PUT_LINE(SQLCODE);
    DBMS_OUTPUT.PUT_LINE(SQLERRM);
END;

EXECUTE add_products(10);

SELECT *
FROM products;