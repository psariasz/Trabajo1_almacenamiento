%%configure -f
{ "conf":{
"spark.pyspark.python": "python3",
"spark.pyspark.virtualenv.enabled": "true",
"spark.pyspark.virtualenv.type":"native",
"spark.pyspark.virtualenv.bin.path":"/usr/bin/virtualenv"
}}

df = spark.read.option("header",True).csv("s3://psariaszlab1/raw/temperatura_ideam.csv",inferSchema=True)

df.show()

df.groupBy('departamento').agg({'valorobservado': 'mean'}).show()

# Número de datos faltantes por columna
for column in df.columns:
    missing_count = df.filter(df[column].isNull()).count()
    print(f"Missing values in {column}: {missing_count}")

for column in df.columns:
    print(f"Unique values in {column}: {df.select(column).distinct().count()}")

df.describe().show()
