select * from all_directories;

CREATE OR REPLACE PROCEDURE read_any_file(p_dir IN VARCHAR2, p_file_name IN VARCHAR2) IS
  l_file UTL_FILE.FILE_TYPE;
  l_text VARCHAR2(32767);
BEGIN
  l_file := UTL_FILE.FOPEN(p_dir, p_file_name, 'r');
  BEGIN
    LOOP
      UTL_FILE.GET_LINE(l_file, l_text);
      DBMS_OUTPUT.PUT_LINE(l_text);
    END LOOP;
    EXCEPTION
      WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('end file');
        UTL_FILE.FCLOSE(l_file);
  END;
  EXCEPTION
    WHEN UTL_FILE.INVALID_OPERATION THEN
      DBMS_OUTPUT.PUT_LINE('cannot open the file, invalid filename');
    WHEN UTL_FILE.READ_ERROR THEN
      DBMS_OUTPUT.PUT_LINE('cannot be read');
END read_any_file;

--------------------------------------------------------------------------------

EXECUTE read_any_file('MYDIR', 'sample2.txt');

EXECUTE read_any_file('MYDIR', 'sampldddle.txt');

