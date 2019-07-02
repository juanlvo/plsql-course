--nocopy will have no effects
--case 1
CREATE OR REPLACE PROCEDURE pass_by_value3 (p_id IN OUT NOCOPY NUMBER) IS
BEGIN
  p_id:=p_id*10;
  IF p_id>100 THEN
    RAISE VALUE_ERROR;
  END IF;
END;

DECLARE
  v NUMBER(10):=20; --the variable has a size so the nocopy is not going to work
BEGIN
  pass_by_value3(v);
  DBMS_OUTPUT.PUT_LINE('NO ISSUE '||v);
  EXCEPTION
  WHEN VALUE_ERROR THEN
    DBMS_OUTPUT.PUT_LINE('EXCEPTION '||v);
END;

--------------------------------------------------------------------------------
--case 2
CREATE OR REPLACE PROCEDURE pass_by_value4 (p_id IN OUT NOCOPY NUMBER) IS
BEGIN
  p_id:=p_id*10;
  IF p_id>100 THEN
    RAISE VALUE_ERROR;
  END IF;
END;

DECLARE
  v NUMBER NOT NULL :=20; --the variable can't be null so the nocopy is not going to work
BEGIN
  pass_by_value4(v);
  DBMS_OUTPUT.PUT_LINE('NO ISSUE '||v);
  EXCEPTION
  WHEN VALUE_ERROR THEN
    DBMS_OUTPUT.PUT_LINE('EXCEPTION '||v);
END;

--------------------------------------------------------------------------------
-- case 3

CREATE OR REPLACE PROCEDURE pass_by_value5 (p_id IN OUT NOCOPY VARCHAR2) IS
BEGIN
  p_id:=p_id*10;
  IF p_id>100 THEN
    RAISE VALUE_ERROR;
  END IF;
END;

DECLARE
  v NUMBER :=20; --if the actual need implicit conversion, nocopy is not going to work
BEGIN
  pass_by_value5(v);
  DBMS_OUTPUT.PUT_LINE('NO ISSUE '||v);
  EXCEPTION
  WHEN VALUE_ERROR THEN
    DBMS_OUTPUT.PUT_LINE('EXCEPTION '||v);
END;