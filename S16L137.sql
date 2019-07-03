CREATE OR REPLACE PACKAGE nocopy_test IS
  
  TYPE number_t IS TABLE OF VARCHAR2(32767) INDEX BY BINARY_INTEGER;
  
  PROCEDURE pass_by_value(nums IN OUT number_t);
  PROCEDURE pass_by_reference(nums IN OUT NOCOPY number_t);
  PROCEDURE init;

END;
--------------------------------------------------------------------------------
CREATE OR REPLACE PACKAGE BODY nocopy_test IS
  l_numbers number_t;
  c_array_size NUMBER:=1000000;
  c_it NUMBER:=20;
  
  PROCEDURE pass_by_value(nums IN OUT number_t) IS
    indx PLS_INTEGER;
  BEGIN
    indx:=nums.COUNT;
  END;
  
  PROCEDURE pass_by_reference(nums IN OUT NOCOPY number_t) IS
    indx PLS_INTEGER;
  BEGIN
    indx:=nums.COUNT;
  END;
  
  PROCEDURE init IS
  BEGIN
    l_numbers.DELETE;
    FOR i IN 1..c_array_size LOOP
      l_numbers(i):='s'||i;
    END LOOP;
    
    DBMS_OUTPUT.PUT_LINE('start '||TO_CHAR(SYSDATE, 'hh:mi:ss'));
    
    FOR i IN 1..1000 LOOP
      pass_by_value(l_numbers);
    END LOOP;
    
    DBMS_OUTPUT.PUT_LINE('end '||TO_CHAR(SYSDATE, 'hh:mi:ss'));
    DBMS_OUTPUT.PUT_LINE('start '||TO_CHAR(SYSDATE, 'hh:mi:ss'));
    
    FOR i IN 1..1000 LOOP
      pass_by_reference(l_numbers);
    END LOOP;
    
    DBMS_OUTPUT.PUT_LINE('end '||TO_CHAR(SYSDATE,'hh:mi:ss'));
    
  END;
END;

BEGIN
  nocopy_test.init;
END;