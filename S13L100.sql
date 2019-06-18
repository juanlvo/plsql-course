CREATE OR REPLACE PACKAGE persistance_state IS
  PRAGMA SERIALLY_REUSABLE;
  g_var NUMBER:=10;
  PROCEDURE update_g_var(p_no NUMBER);
END;

CREATE OR REPLACE PACKAGE BODY persistance_state IS
  PRAGMA SERIALLY_REUSABLE;
  PROCEDURE update_g_var(p_no NUMBER) IS
  BEGIN
    g_var:=p_no;
    DBMS_OUTPUT.PUT_LINE(g_var);
  END;

END;

-------------------------------------------------------------------------------

EXECUTE persistance_state.update_g_var(90);

VARIABLE test NUMBER;

EXECUTE :test:=persistance_state.g_var;

PRINT test;