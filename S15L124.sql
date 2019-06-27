-- we can use dynamic sql in anonymous blocks
DECLARE
  v_code VARCHAR2(100):='BEGIN
                        DBMS_OUTPUT.PUT_LINE(''welcome'');
                        END;';
BEGIN
  EXECUTE IMMEDIATE v_code;
END;
-------------------------------------------------------------------------------
ALTER PROCEDURE add_rows COMPILE;
ALTER FUNCTION get_sal COMPILE;
ALTER PACKAGE area COMPILE SPECIFICATION;
ALTER PACKAGE area COMPILE BODY;

CREATE OR REPLACE PROCEDURE compile_any_plsql(p_name VARCHAR2, p_type VARCHAR2, p_option VARCHAR2 DEFAULT NULL) IS
  v_comp_code VARCHAR2(1000):='alter '||p_type||' '||p_name||' compile '||p_option;
BEGIN
  EXECUTE IMMEDIATE v_comp_code;
END;

EXECUTE compile_any_plsql('AREA', 'package', 'specification');

EXECUTE compile_any_plsql('AREA', 'package', 'body');

EXECUTE compile_any_plsql('ADD_ROWS', 'procedure');

EXECUTE compile_any_plsql('GET_SAL', 'function');

