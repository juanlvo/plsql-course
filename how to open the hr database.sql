show con_name;

select name, con_id
from v$pdbs;

alter session set container=orclpdb;

alter pluggable database open;

