/*step 1
the User ICT is exist in remote database called newd
the user will create table, view on table, 
and procedure read form the view 
the user will check that all theses objects are valid
-------take code from here
drop table students;

create table students
(student_id number,
 student_name varchar2(100),
 dob date
 );

insert into students(student_id,student_name,dob) values (1,'aya ahmed','1-jan-1980');
insert into students(student_id,student_name,dob) values (2,'sara mahmoud','1-jan-1980');
insert into students(student_id,student_name,dob) values (3,'nabil alail','1-jan-1980');
commit;

select * from students;

create or replace view v1_students
as
select * from students;


create or replace procedure print_all_students
is
begin
  for i in (select * from v1_students )
  loop
  dbms_output.put_line(i.student_id||' '||i.student_name);
  end loop;

end;

select * from user_objects
where object_name in ('PRINT_ALL_STUDENTS','STUDENTS','V1_STUDENTS');

*/
--to read any table from the remote db, you should use table_name@db_link
select * from students@READ_REMOTE;

SELECT name, value
FROM v$parameter
WHERE name='remote_dependencies_mode';

alter session set remote_dependencies_mode='SIGNATURE';

SELECT name, value
FROM v$parameter
WHERE name='remote_dependencies_mode';

drop procedure read_from_remote_db;

select * from students@READ_REMOTE;

create or replace procedure read_from_remote_db
is
begin
dbms_output.put_line('executing the remote procedure');
print_all_students@READ_REMOTE;
end;

select * from user_objects
where lower(object_name)='read_from_remote_db';
--now go and recompile the print_all_students without any changes 

exec read_from_remote_db

--now go and recompile the print_all_students and do some changes in parameters 

exec read_from_remote_db 