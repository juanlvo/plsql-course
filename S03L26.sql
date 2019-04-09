declare
v_no number := 300;
v_date date;
v_timestamp timestamp;
v_project_period interval year to month;
begin
v_no := 125.323;
v_date := sysdate;
v_timestamp := current_timestamp;
--current_timestamp return the current date and time for user session
v_project_period := '03-04';
DBMS_OUTPUT.PUT_LINE(v_no);
DBMS_OUTPUT.PUT_LINE(v_date);
DBMS_OUTPUT.PUT_LINE(v_timestamp);
DBMS_OUTPUT.PUT_LINE('the project period is :'||v_project_period);
DBMS_OUTPUT.PUT_LINE(to_char(sysdate, 'dd-mm-yyyy hh:mi:ss'));
end;
