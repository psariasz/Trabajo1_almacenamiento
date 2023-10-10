USE trabajo_1;
CREATE EXTERNAL TABLE temperaturas_ideam (
    idestacion BIGINT,
    sensor BIGINT,
    fecha TIMESTAMP,
    valorobservado DOUBLE,
    nombreestacion STRING,
    departamento STRING,
    municipio STRING,
    zonahidro STRING,
    latitud DOUBLE,
    longitud DOUBLE,
    descripcion STRING,
    unidad STRING
) 
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
   "separatorChar" = ",",
   "quoteChar"     = "'",
   "escapeChar"    = "\\"
)
LOCATION '/user/hadoop/trabajo_1/';