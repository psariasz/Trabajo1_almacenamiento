import boto3
from botocore.exceptions import NoCredentialsError
import pandas as pd
from io import BytesIO

def upload_to_s3(local_file, bucket, s3_key):
    # Creamos el cliente a S3
    s3 = boto3.client('s3')

    try:
        #UPLOAD del archivo a S3
        s3.upload_file(local_file, bucket, s3_key)
        print(f'Successfully uploaded {local_file} to {bucket}/{s3_key}')
    except FileNotFoundError:
        print(f'The file {local_file} was not found')
    except NoCredentialsError:
        print('Credentials not available')

def read_s3_excel_to_dataframe(bucket, s3_key, sheet_name = 'Reporte_Plano'):
    # Creamos el cliente a S3
    s3 = boto3.client('s3')

    try:
        #Descargamos data de S3
        response = s3.get_object(Bucket=bucket, Key=s3_key)
        data = response['Body'].read()
        
        #Llevamos la data a un dataframe
        df = pd.read_excel(BytesIO(data), sheet_name=sheet_name, header = 1)
        
        print(f'Éxito al leer el archivo Excel en DataFrame desde {s3_key} en {bucket}')

        return df
    except FileNotFoundError:
        print(f'El archivo {s3_key} no se encontró en {bucket}')
    except NoCredentialsError:
        print('Credenciales no disponibles')
    except pd.errors.ParserError as e:
        print(f'Error al analizar el archivo Excel: {e}')


local_file_path = '/temperatura_ideam.json'
s3_bucket_name = 'psariaszlab1'
s3_key = 'raw/temperatura_ideam.json'

upload_to_s3(local_file_path, s3_bucket_name, s3_key)
