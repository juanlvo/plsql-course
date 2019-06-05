/*
Assume the lenght for tel is 12, for example 123456789012
we need a procedure to format the number from 123456789012 to 123(45)6789012
*/
CREATE OR REPLACE PROCEDURE format_tel(p_tel IN OUT VARCHAR2) IS
BEGIN
  p_tel := substr(p_tel,1,3)||'('||substr(p_tel,4,2)||')'||substr(p_tel, 7);
END;
---
VARIABLE b_telephone VARCHAR2(20);

EXECUTE :b_telephone := '123456789012';

EXECUTE format_tel(:b_telephone);

PRINT b_telephone;
-----
DECLARE
  v_tel VARCHAR2(100):='123456789012';
BEGIN
  format_tel(v_tel);
  DBMS_OUTPUT.PUT_LINE(v_tel);
END;