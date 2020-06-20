
CREATE EXTERNAL TABLE IF NOT EXISTS tmp_movies(
star_rating double,
title string,
content_rating string,
genre string,
duration int,
actors_list array<string>
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
   "separatorChar" = ",",
   "quoteChar"     = "\""
)
location '/user/hive/data_peliculas';

select * from tmp_movies where title like '%Godfather%' limit 100;

select star_rating, title, content_rating, genre, duration, regexp_replace(actors_list, 'u') as actors_list
where title like '%Godfather%' limit 100;

CREATE EXTERNAL TABLE IF NOT EXISTS movies(
star_rating double,
title string,
content_rating string,
genre string,
duration int,
actors_list array<string>
)
COMMENT 'Data about cars from a public database'
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
STORED AS TEXTFILE
location '/user/hive/data_movies';
