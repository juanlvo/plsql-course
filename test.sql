CREATE TABLE  table_1(
id number,
name varchar2(100));

INSERT INTO table_1 VALUES (1, 'Juan Vivas');
INSERT INTO table_1 VALUES (2, 'Ana Vivas');
INSERT INTO table_1 VALUES (3, 'Luis Vivas');
INSERT INTO table_1 VALUES (4, 'Juana de Vivas');

CREATE OR REPLACE PROCEDURE insert_table_1 (p_id NUMBER, p_name VARCHAR2) IS
BEGIN
  INSERT INTO table_1 VALUES(p_id, p_name);
  COMMIT;
END;
