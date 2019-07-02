/**
* Pass by value example
**/

CREATE OR REPLACE PROCEDURE pass_by_value1 (p_id IN OUT NUMBER) IS
BEGIN
  p_id:=p_id*10;
  IF p_id>100 THEN
    RAISE VALUE_ERROR;
  END IF;
END;


-- run twice this block the first time with v:=5 and the second time v:= 20
DECLARE
  v NUMBER:=20;
BEGIN
  pass_by_value1(v);
  DBMS_OUTPUT.PUT_LINE('NO ISSUE '||v);
  EXCEPTION
  WHEN VALUE_ERROR THEN
    DBMS_OUTPUT.PUT_LINE('EXCEPTION '||v);
END;
--------------------------------------------------------------------------------
--pass by reference
CREATE OR REPLACE PROCEDURE pass_by_ref (p_id IN OUT NOCOPY NUMBER) IS
BEGIN
  p_id:=p_id*10;
  IF p_id>100 THEN
    RAISE VALUE_ERROR;
  END IF;
END;

DECLARE
  v NUMBER:=20;
BEGIN
  pass_by_ref(v);
  DBMS_OUTPUT.PUT_LINE('NO ISSUE '||v);
  EXCEPTION
  WHEN VALUE_ERROR THEN
    DBMS_OUTPUT.PUT_LINE('EXCEPTION '||v);
END;