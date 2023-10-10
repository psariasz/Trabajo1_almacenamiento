/*Dentro del siguiente script puede encontrar la forma
de crear un schema y una tabla con datos provenientes de S3.
El ultimo bloque de este codigo corresponder a una consulta en SQL de la BD*/
create external schema trabajo1_schema
from data catalog
database 'trabajo1_db'
iam_role 'arn:aws:iam::300013369769:role/LabRole'
create external database if not exists;

create external table trabajo1_schema.temperaturas_ideam(
    codigoestacion BIGINT,
    codigosensor BIGINT,
    fechaobservacion varchar(50),
    valorobservado DOUBLE PRECISION,
    nombreestacion varchar(50),
    departamento varchar(50),
    municipio varchar(50),
    zonahidrografica varchar(50),
    latitud DOUBLE PRECISION,
    longitud DOUBLE PRECISION,
    descripcionsensor varchar(50),
    unidadmedida  varchar(50))
STORED AS PARQUET
LOCATION 's3://psariaszlab1/trusted/';

SELECT
    nombreestacion,
    AVG(valorobservado) AS average_valorobservado, departamento
FROM
    trabajo1_schema.temperaturas_ideam
GROUP BY
    nombreestacion, departamento
ORDER BY
    average_valorobservado DESC;