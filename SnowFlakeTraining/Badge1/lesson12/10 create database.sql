use role sysadmin;

// Create a new database and set the context to use the new database
create database SOCIAL_MEDIA_FLOODGATES comment = 'Badge 1 Lesson 12';


Select database_name, comment, DATABASE_OWNER, Type
from information_schema.databases
Where comment like 'Badge%';
