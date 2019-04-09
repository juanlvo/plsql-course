---1-----
declare
v_date date;
v_no number := 10;
v_name varchar2(100) not null := 'Juan';
begin
dbms_output.put_line(v_date);
dbms_output.put_line(v_no);
dbms_output.put_line(v_name);
v_no := v_no+10;
v_name := 'Carla';
dbms_output.put_line(v_name);
v_date := '10-May-2012';
dbms_output.put_line(v_date);
dbms_output.put_line(v_no);
end;
---2----
declare
v_date date := sysdate;
v_no number := 10*2;
v_pi constant number := 3.14;
begin
dbms_output.put_line(v_date);
dbms_output.put_line(v_no);
dbms_output.put_line(v_pi);
v_date := v_date+10;
dbms_output.put_line(v_date);
end;
