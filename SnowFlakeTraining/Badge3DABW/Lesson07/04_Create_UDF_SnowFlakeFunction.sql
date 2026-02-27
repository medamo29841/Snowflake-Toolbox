use schema util_db.public;
create function neutralize_whining (whine text)
returns text as 'select initcap(whine)';

select neutralize_whining ('IM tIrEd Of ThIs GrAnDpA!');

set whine = 'Its too hot to study!';

select neutralize_whining ($whine);
