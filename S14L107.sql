SELECT *
FROM employees;

DECLARE
  l_file UTL_FILE.file_type;
  l_location VARCHAR2(100) := 'MYDIR';
  l_filename VARCHAR2(100) := 'sample.txt';
  l_text VARCHAR2(32767);
BEGIN
  l_file := UTL_FILE.fopen(l_location, l_filename, 'r');
  
  UTL_FILE.GET_LINE(l_file, l_text);
  DBMS_OUTPUT.PUT_LINE('First Line:'||l_text);
  UTL_FILE.GET_LINE(l_file, l_text);
  DBMS_OUTPUT.PUT_LINE('Second Line:'||l_text);
  
  UTL_FILE.FCLOSE(l_file);
END;