### Con este codigo se realizo la ETL de GLUE a S3.
import sys
from awsglue.transforms import *
from awsglue.utils import getResolvedOptions
from pyspark.context import SparkContext
from awsglue.context import GlueContext
from awsglue.job import Job

args = getResolvedOptions(sys.argv, ["JOB_NAME"])
sc = SparkContext()
glueContext = GlueContext(sc)
spark = glueContext.spark_session
job = Job(glueContext)
job.init(args["JOB_NAME"], args)

# Script generated for node Data Catalog table
DataCatalogtable_node1 = glueContext.create_dynamic_frame.from_catalog(
    database="trabajo_1",
    table_name="op2raw",
    transformation_ctx="DataCatalogtable_node1",
)

# Script generated for node S3 bucket
S3bucket_node2 = glueContext.write_dynamic_frame.from_options(
    frame=DataCatalogtable_node1,
    connection_type="s3",
    format="csv",
    connection_options={"path": "s3://psariaszlab1/trusted/", "partitionKeys": []},
    transformation_ctx="S3bucket_node2",
)

job.commit()