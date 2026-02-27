create or replace view camillas_db.forecasting.train_2_model_practice_data(
	practice_date,
	day_of_week,
	goals_attempted,
	goals_scored
) as
select 
practice_date,
dayname(practice_date) as day_of_week,
goals_attempted,
goals_scored
from camillas_db.forecasting.practice_stats
where practice_date < '2025-07-01';


create or replace view CAMILLAS_DB.FORECASTING.VALIDATE_2_MODEL_PRACTICE_DATA(
	PRACTICE_DATE,
    DAY_OF_WEEK,
	GOALS_ATTEMPTED,
	GOALS_SCORED
) as
  select 
    practice_date, 
    dayname(practice_date) as day_of_week,
    goals_attempted,
    goals_scored
  from camillas_db.forecasting.practice_stats
  where practice_date >= '2025-07-01';