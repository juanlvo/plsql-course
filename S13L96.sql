CREATE OR REPLACE PACKAGE overload_function IS
  FUNCTION f1(p1 NUMBER) RETURN NUMBER;
  FUNCTION f1(p1 NUMBER) RETURN VARCHAR2;
END;
------------------------------------------------------------------------------
CREATE OR REPLACE PACKAGE BODY overload_function IS
  
  FUNCTION f1(p1 NUMBER) RETURN NUMBER IS
  BEGIN
    return p1;
  END;
  
  FUNCTION f1(p1 NUMBER) RETURN VARCHAR2 IS
  BEGIN
    RETURN p1||'hi';
  END;
END;
------------------------------------------------------------------------------

SELECT OVERLOAD_FUNCTION.f1(1) FROM dual;

------------------------------------------------------------------------------
CREATE OR REPLACE PACKAGE overload_function IS
  FUNCTION f1(p1 NUMBER) RETURN NUMBER;
  FUNCTION f1(p1 VARCHAR2) RETURN VARCHAR2;
END;
------------------------------------------------------------------------------
CREATE OR REPLACE PACKAGE BODY overload_function IS
  
  FUNCTION f1(p1 NUMBER) RETURN NUMBER IS
  BEGIN
    return p1;
  END;
  
  FUNCTION f1(p1 VARCHAR2) RETURN VARCHAR2 IS
  BEGIN
    RETURN p1||'hi';
  END;
END;
------------------------------------------------------------------------------

SELECT OVERLOAD_FUNCTION.f1(1) FROM dual;

SELECT OVERLOAD_FUNCTION.f1('1') FROM dual;