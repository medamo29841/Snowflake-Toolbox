select practice_date, goals_scored as actual, null as forecast_1, NULL as forecast_2
    from train_2_model_practice_data
UNION ALL
select practice_date, goals_scored as actual, null as forecast_1, NULL as forecast_2
    from VALIDATE_2_MODEL_PRACTICE_DATA
UNION ALL    
select ts as practice_date, NULL as actual, null as forecast_1, forecast as forecast_2
    from second_goals_forecast;