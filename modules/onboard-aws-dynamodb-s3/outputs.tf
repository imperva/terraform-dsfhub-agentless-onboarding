output "s3-bucket" {
  description = "S3 bucket"
  value       = module.s3-bucket.this
}

output "s3-bucket-policy" {
  description = "S3 bucket policy"
  value       = module.s3-bucket-policy.this
}

output "dynamodb-cloudtrail" {
  description = "DynamoDB CloudTrail"
  value       = module.dynamodb-cloudtrail.this
}

output "eventbridge-firehose-iam-role" {
  description = "EventBridge to firehose IAM role"
  value       = module.eventbridge-firehose-iam-role.this
}

output "firehose-s3-iam-role" {
  description = "Firehose to S3 IAM role"
  value       = module.firehose-s3-iam-role.this
}

output "kinesis-firehose-delivery-stream" {
  description = "Firehose delivery stream to S3"
  value       = module.kinesis-firehose-delivery-stream.this
}

output "eventbridge-rule" {
  description = "EventBridge rule"
  value       = module.eventbridge-rule.this
}

output "eventbridge-target" {
  description = "EventBridge target"
  value       = module.eventbridge-target.this
}

output "aws-dynamodb-asset" {
  description = "AWS DynamoDB asset"
  value       = module.aws-dynamodb-asset.this
}

output "aws-s3-bucket-asset" {
  description = "AWS S3 asset"
  value       = module.aws-s3-asset.this
}
