
DROP TABLE IF EXISTS maquinarias3;

create external table maquinarias3 (
Tiempo string,
Tipo  string,
TipoReceta string,
Orden string,
Batch string,
UnPCU string,
UnitadNo string,
UnitadNomb string,
PCU string,
Modulo string,
InstNo string,
Nombre string,
Texto string,
MsgID string,
Estatus string,
MsgClass string,
BatchAno string,
TextoWinCC string,
RTNo string)
PARTITIONED BY (fecha string)
ROW FORMAT SERDE 'org.apache.hadoop.hive.contrib.serde2.RegexSerDe' 
WITH SERDEPROPERTIES ("input.regex" = "(.{8})(.{2})(.{33})(.{7})(.{7})(.{4})(.{4})(.{33})(.{4})(.{18})(.{5})(.{33})(.{64})(.{6})(.{2})(.{4})(.{3})(.{7})(.{6})" )
LOCATION '/user/hive/maquinarias/maquinarias/';

msck repair table maquinarias3;

select * from maquinarias3 limit 10;
