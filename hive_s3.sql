use trabajo_1;
CREATE EXTERNAL TABLE temperaturas_ideam_s3 (
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
STORED AS PARQUET
LOCATION 's3://psariaszlab1/trusted'