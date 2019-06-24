DECLARE
  l_file UTL_FILE.FILE_TYPE;
  l_location VARCHAR2(100) := 'MYDIR';
  l_filename VARCHAR2(100) := 'sample2.txt';
BEGIN
  l_file := UTL_FILE.FOPEN(l_location, l_filename, 'w');
  FOR i IN (SELECT * FROM DEPARTMENTS) LOOP
    UTL_FILE.PUT_LINE(l_file, i.department_name);
  END LOOP;
  
  UTL_FILE.FCLOSE(l_file);
  
  l_file := UTL_FILE.FOPEN(l_location, l_filename, 'A');
  UTL_FILE.PUT_LINE(l_file, 'ADDITIONAL LINES');
  UTL_FILE.FCLOSE(l_file);
END;