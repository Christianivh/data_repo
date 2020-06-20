
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




create external table maquinarias2 ( tiempo string, tipo  string, tiporeceta string )
ROW FORMAT SERDE 'org.apache.hadoop.hive.contrib.serde2.RegexSerDe'
WITH SERDEPROPERTIES ("input.regex" = "(.{8})(.{2})(.{31}).*" )
LOCATION '/user/hive/datamq';


create external table maquinarias ( tiempo string, tipo  string, tiporeceta string )
PARTITIONED BY (fecha string)
ROW FORMAT SERDE 'org.apache.hadoop.hive.contrib.serde2.RegexSerDe'
WITH SERDEPROPERTIES ("input.regex" = "(.{8})(.{2})(.{31}).*" )
LOCATION '/user/hive/maquinarias/maquinarias/';


msck repair table maquinarias;
