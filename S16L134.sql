CREATE OR REPLACE PROCEDURE pass_by_ref(p_id in NUMBER) IS
BEGIN
  DBMS_OUTPUT.PUT_LINE(p_id);
END;

EXECUTE pass_by_ref(10);

--------------------------------------------------------------------------------

CREATE OR REPLACE PROCEDURE pass_by_ref(p_id in NUMBER) IS
BEGIN
  P_ID := 155; --this is not valid
  DBMS_OUTPUT.PUT_LINE(p_id);
END;