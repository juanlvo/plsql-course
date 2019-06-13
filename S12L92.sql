CREATE OR REPLACE PACKAGE p_test IS

  c_var1 CONSTANT NUMBER:=10;
  c_var2 VARCHAR2(100):='welcome';
  
  PROCEDURE PRINT;

END;
-------------------------------------------------------------------------------
CREATE OR REPLACE PACKAGE BODY p_test IS
  c_var3 VARCHAR2(100):='hi there';
  PROCEDURE print IS
    c_var4 VARCHAR2(100):='hi';
  BEGIN
    DBMS_OUTPUT.PUT_LINE('this variable came from the package spec. '||c_var1);
    DBMS_OUTPUT.PUT_LINE('this variable came from the package spec. '||c_var2);
    DBMS_OUTPUT.PUT_LINE('this variable came from the package body. '||c_var3);
    DBMS_OUTPUT.PUT_LINE('this variable came from the print proc '||c_var4);
  END;
END;
------------------------------------------------------------------------------
EXECUTE p_test.print;