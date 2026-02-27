--the SHOW command might come in handy to look at the task 
show tasks in account;

--you can also look at any task more in depth using DESCRIBE
describe task AGS_GAME_AUDIENCE.RAW.GET_NEW_FILES;

--Execute task
execute task AGS_GAME_AUDIENCE.RAW.GET_NEW_FILES;

Select * From AGS_GAME_AUDIENCE.RAW.PL_GAME_LOGS;
