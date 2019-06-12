CREATE OR REPLACE FUNCTION square_area(p_side NUMBER) RETURN NUMBER IS
BEGIN
  RETURN p_side*p_side;
END;

SELECT square_area(4) FROM DUAL;

-------------------------------------------------------------------

CREATE OR REPLACE FUNCTION rectangle_area (p_l NUMBER, p_w NUMBER) RETURN NUMBER IS
BEGIN
  RETURN p_l*p_w;
END;

SELECT rectangle_area(4,5) FROM DUAL;

--------------------------------------------------------------------
CREATE OR REPLACE PACKAGE area IS
  
  FUNCTION square_area(p_side NUMBER) RETURN NUMBER;
  
  FUNCTION rectangle_area (p_l NUMBER, p_w NUMBER) RETURN NUMBER;
  
END;
--------------------------------------------------------------------
CREATE OR REPLACE PACKAGE BODY area IS
  
  FUNCTION square_area(p_side NUMBER) RETURN NUMBER IS
  BEGIN
    RETURN p_side*p_side;
  END;
    
  FUNCTION rectangle_area (p_l NUMBER, p_w NUMBER) RETURN NUMBER IS
  BEGIN
    RETURN p_l*p_w;
  END;
BEGIN
  DBMS_OUTPUT.PUT_LINE('Welcome');
END;
--------------------------------------------------------------------
SELECT area.square_area(4) FROM DUAL;
SELECT area.rectangle_area(4, 10) FROM DUAL;
----------------------------------------------------
BEGIN
  DBMS_OUTPUT.PUT_LINE(area.square_area(4));
END;
---------------------------------------------------------------
DROP FUNCTION square_area;
DROP FUNCTION rectangle_area;