-- make a view that uses data from march to july for training the model 
create or replace view camillas_db.forecasting.train_model_practice_data(
	  practice_date,
	  goals_attempted,
	  goals_scored
) as
  select 
    practice_date, 
    goals_attempted,
    goals_scored
  from camillas_db.forecasting.practice_stats
  where practice_date < '2025-07-01';

  -- make a view that uses data from july forward for validating the model
create or replace view camillas_db.forecasting.validate_model_practice_data(
	   practice_date,
	   goals_attempted,
	   goals_scored
) as
  select 
    practice_date, 
    goals_attempted,
    goals_scored
  from camillas_db.forecasting.practice_stats
  where practice_date >= '2025-07-01';