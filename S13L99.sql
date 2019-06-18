CREATE OR REPLACE PACKAGE persistance_state IS
  g_var NUMBER:=10;
  PROCEDURE update_g_var(p_no NUMBER);
END;

CREATE OR REPLACE PACKAGE BODY persistance_state IS

  PROCEDURE update_g_var(p_no NUMBER) IS
  BEGIN
    g_var:=p_no;
    DBMS_OUTPUT.PUT_LINE(g_var);
  END;

END;

-------------------------------------------------------------------------------

EXECUTE persistance_state.update_g_var(80);
VARIABLE test NUMBER;
EXECUTE :test:=persistance_state.g_var;

PRINT test;

DECLARE
x NUMBER;
BEGIN
  x:=persistance_state.g_var;
  DBMS_OUTPUT.PUT_LINE(x);
END;

