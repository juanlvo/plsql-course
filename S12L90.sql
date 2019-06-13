CREATE OR REPLACE PACKAGE global_messurement IS

  c_mille_to_km CONSTANT NUMBER := 1.6093;
  c_kilo_to_mille CONSTANT NUMBER := 0.6214;

END;

EXECUTE DBMS_OUTPUT.PUT_LINE('60 milles:='||60*GLOBAL_MESSUREMENT.c_mille_to_km||' KM');

EXECUTE DBMS_OUTPUT.PUT_LINE('100 KM:='||100*GLOBAL_MESSUREMENT.c_kilo_to_mille||' Milles');

---------------------------------------------------------------------------------

CREATE OR REPLACE FUNCTION get_mille_to_km(p_value NUMBER) RETURN NUMBER IS
BEGIN
  RETURN p_value*GLOBAL_MESSUREMENT.c_mille_to_km;
END;

SELECT GET_MILLE_TO_KM(100) FROM DUAL;

-------------------------------------------------------------------------------
-- we can define a procedure inside of a plsql block but is going to be available 
-- only inside the plsql block
-------------------------------------------------------------------------------
DECLARE
  FUNCTION get_sysdate RETURN DATE IS
  BEGIN
    RETURN SYSDATE;
  END;
BEGIN
  DBMS_OUTPUT.PUT_LINE(get_sysdate);
END;