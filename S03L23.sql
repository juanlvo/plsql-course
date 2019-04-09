-----1------
begin
dbms_output.put_line('Welcome');
end;
-----2------ example if you want to print Father's day
begin
dbms_output.put_line('Father''s day');
end;

--- when a string contains an apstrophe
-- it is recomended to use the q' notation

select 'today is the father''s day'
from dual;

---- using ? as delimiter q'?your text?'
select q'?today is the father's day?'
from dual;

--using * as delimiter q'*your text*'
select q'*today is the father's day*'
from dual;

--using ( as delimiter q'(your text)'
select q'(today is the father's day)'
from dual;

--using [as delimiter q'[your text]'
select q'[today is the father's day not the mother's day]'
from dual;

--------------------------------

begin
dbms_output.put_line('Father''s day');
dbms_output.put_line(q'(Father's day)');
end;
