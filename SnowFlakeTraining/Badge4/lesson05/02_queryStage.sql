use schema mels_smoothie_challenge_db.trails;

Select * from @trails_geojson
(file_format => ff_json);

Select * from @trails_parquet
(file_format => FF_PARQUET);