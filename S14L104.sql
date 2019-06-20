BEGIN
  FOR i IN 1..30000 LOOP
    DBMS_OUTPUT.PUT_LINE(LPAD(i, 7, 0));
  END LOOP;
END;
------------------------------------------------------------------------------
BEGIN
  FOR i IN 1..30000 LOOP
    DBMS_OUTPUT.ENABLE(1000000);
    DBMS_OUTPUT.PUT_LINE(LPAD(i, 7, 0));
  END LOOP;
END;
-------------------------------------------------------------------------------
BEGIN

  DBMS_OUTPUT.PUT_LINE('test');
  DBMS_OUTPUT.DISABLE;
  DBMS_OUTPUT.PUT_LINE('test2');
  DBMS_OUTPUT.ENABLE;
  DBMS_OUTPUT.PUT_LINE('test3');

END;
-------------------------------------------------------------------------------
BEGIN
  DBMS_OUTPUT.PUT_LINE('Welcome');
  DBMS_OUTPUT.PUT('my ');
  DBMS_OUTPUT.PUT('name ');
  DBMS_OUTPUT.PUT('is ');
  DBMS_OUTPUT.PUT('Juan ');
  DBMS_OUTPUT.NEW_LINE;
  DBMS_OUTPUT.PUT_LINE('My nams is Juan');
END;