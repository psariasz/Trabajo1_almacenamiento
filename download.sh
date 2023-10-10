#!/bin/bash

URL="https://www.datos.gov.co/resource/sbwg-7ju4.json"

# Directorio local para almacenar temporalmente los archivos descargados
LOCAL_DIR="C:\Universidad\primer_semestre\almacenamiento\trabajo1"

# Nombre del archivo local
LOCAL_FILE="temperatura_ideam.json"

# Nombre del bucket S3
S3_BUCKET="psariaszlab1"

# Ruta en S3 (directorio en la zona raw)
S3_RAW_PATH="raw/"

# Comando para descargar el archivo
curl -o "$LOCAL_DIR/$LOCAL_FILE" "$URL"

# Comando para cargar el archivo en S3
aws s3 cp "$LOCAL_DIR/$LOCAL_FILE" "s3://$S3_BUCKET/$S3_RAW_PATH$LOCAL_FILE"

