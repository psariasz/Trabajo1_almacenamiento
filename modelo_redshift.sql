/*El siguiente script son los codigos que se utilizaron para crear el modelo
dentro de redshift*/

CREATE MODEL temp_observado_auto_model_v2 FROM (SELECT codigoestacion,
FECHA,
valorobservado,
departamento,
latitud,
longitud
FROM public.temp_definitiva
WHERE FECHA <  '2018-01-01')
TARGET valorobservado FUNCTION ml_fn_temp_observado_v2
IAM_ROLE 'arn:aws:iam::300013369769:role/LabRole'
SETTINGS (
 S3_BUCKET 'psariaszlab1'
);

SELECT * FROM STV_ML_MODEL_INFO;

SELECT departamento,
ml_fn_temp_observado_v2(codigoestacion,
FECHA,
departamento,
latitud,
longitud)
AS active FROM public.temp_definitiva WHERE FECHA > '2018-01-01';