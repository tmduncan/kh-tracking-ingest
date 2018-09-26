# Serverless Data Pipeline - SAM Template
Tracking Pipeline - API Gateway -> Kinesis -> Firehose

## Resources list

This stack will create the following resources:

* An **API Gateway endpoint** that you can use to `track` events by submitting any JSON data via the HTTP POST method
* A **Kinesis Stream** that will stream events
* A **Kinesis Firehose Delivery Stream** that will buffer, optionally compress, and write each record into S3
* A **Lambda Function** to process/manipulate/clean/skip records before they get written into S3
* An **S3 Bucket** that will contain all the collected data
* An **IAM Role and Policy** for API Gateway
* An **IAM Role and Policy** for Kinesis Firehose


## Parameters
* **ApiStageName**: The API Gateway Stage name (e.g. dev, prod, etc.)
* **FirehoseS3Prefix**: The S3 Key prefix for Kinesis Firehose
* **FirehoseCompressionFormat**: The compression format used by Kinesis Firehose
* **FirehoseBufferingInterval**: How long Firehose will wait before writing a new batch into S3
* **FirehoseBufferingSize**: The maximum batch size in MB
* **LambdaTimeout**: Lambda's max execution time in seconds
* **LambdaMemorySize**: Lambda's max memory configuration
* **SteamShardCount**: Number of shards

## Outputs
* **TrackURL**: The public URL to submit new records
* **BucketName**: The bucket where data will be stored
* **FunctionName**: The Lambda Function that will process Firehose records

## Notes
* The API endpoint is publicly accessible (e.g. any browser or anonymous website user can potentially submit new records/events)
* Make sure the S3 bucket is empty when you delete the stack


## Deployment
scripts/deploy.sh [ options ]
#### Options
* `--parameter-overrides ParameterKey1=ParameterValue1 ParameterKey2=ParameterValue2 ...`
* [Full List](https://docs.aws.amazon.com/cli/latest/reference/cloudformation/deploy/index.html)

## Removal
scripts/remove.sh
