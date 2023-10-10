import pyarrow.parquet as pq
from ingesta import read_s3_excel_to_dataframe

local_file_path = '/temperatura_ideam.parquet'
s3_bucket_name = 'psariaszlab1'
s3_key = 'trusted/temperatura_ideam.parquet'

ruta_archivo_parquet = (local_file_path, s3_bucket_name, s3_key)

tabla_parquet = pq.read_table(ruta_archivo_parquet)

df = tabla_parquet.to_pandas()

df