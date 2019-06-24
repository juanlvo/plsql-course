DECLARE
  l_file UTL_FILE.FILE_TYPE;
  l_location VARCHAR2(100):='MYDIR';
  l_filename VARCHAR2(100):='sample.txt';
  l_text VARCHAR2(32767);
BEGIN
  l_file := UTL_FILE.FOPEN(l_location, l_filename, 'r');
  BEGIN
    LOOP
      UTL_FILE.GET_LINE(l_file, l_text);
      DBMS_OUTPUT.PUT_LINE(l_text);
    END LOOP;
    EXCEPTION WHEN no_data_found THEN
      DBMS_OUTPUT.PUT_LINE('end file');
  END;
  UTL_FILE.FCLOSE(l_file);
END;