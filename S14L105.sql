DECLARE
  BUFFER VARCHAR2(100);
  status INTEGER;
BEGIN
  DBMS_OUTPUT.PUT_LINE('line 1');
  DBMS_OUTPUT.PUT_LINE('line 2');
  DBMS_OUTPUT.PUT_LINE('line 3');
  
  DBMS_OUTPUT.GET_LINE(buffer, status);
  DBMS_OUTPUT.PUT_LINE('Buffer: '||buffer);
  DBMS_OUTPUT.PUT_LINE('Status: '||status);
END;
-------------------------------------------------------------------------------
DECLARE
  BUFFER VARCHAR2(100);
  status INTEGER;
  v VARCHAR2(3000);
BEGIN
  DBMS_OUTPUT.PUT_LINE('line 1');
  DBMS_OUTPUT.PUT_LINE('line 2');
  DBMS_OUTPUT.PUT_LINE('line 3');
  FOR i IN 1..3 LOOP
    DBMS_OUTPUT.GET_LINE(BUFFER, status);
    v:=v||BUFFER||CHR(10);
  END LOOP;
  DBMS_OUTPUT.PUT_LINE(v);
END;
--------------------------------------------------------------------------------
DECLARE
  BUFFER DBMS_OUTPUT.CHARARR;
  v_line INTEGER;
BEGIN
  v_line:=10;
  DBMS_OUTPUT.PUT_LINE('line 1');
  DBMS_OUTPUT.PUT_LINE('line 2');
  DBMS_OUTPUT.PUT_LINE('line 3');
  DBMS_OUTPUT.PUT_LINE('line 4');
  DBMS_OUTPUT.GET_LINES(BUFFER, v_line);
  DBMS_OUTPUT.PUT_LINE(BUFFER(3));
  DBMS_OUTPUT.PUT_LINE(BUFFER(2));
  DBMS_OUTPUT.PUT_LINE(BUFFER(1));
  DBMS_OUTPUT.PUT_LINE(BUFFER(4));
END;