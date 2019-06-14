CREATE OR REPLACE PACKAGE override IS

  FUNCTION to_char(p1 number, p2 date) RETURN VARCHAR2;
  
  PROCEDURE PRINT;

END;
-------------------------------------------------------------------------------
CREATE OR REPLACE PACKAGE BODY override IS

  FUNCTION to_char(p1 NUMBER, p2 DATE) RETURN VARCHAR2 IS
  BEGIN
    RETURN p1||p2;
  END;

  PROCEDURE print IS
  BEGIN
    DBMS_OUTPUT.PUT_LINE(to_char(1, '1-jan-81')); ---this will execute the procedure of the package
    DBMS_OUTPUT.PUT_LINE(standard.to_char(10)); ---this will execute the standart built
    
  END;

END;

EXECUTE OVERRIDE.print