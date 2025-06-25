output "oracle-parameter-group" {
  description = "RDS parameter group for Oracle"
  value       = module.oracle-parameter-group.this
}

output "oracle-instance" {
  description = "RDS Oracle instance"
  value       = module.oracle-instance.this
}

output "oracle-log-group" {
  description = "AWS log group"
  value       = module.oracle-log-group.this
}

output "log-group-firehose-iam-role" {
  description = "Log group to Firehose IAM role"
  value       = module.log-group-firehose-iam-role.this
}

output "log-group-firehose-iam-role-policy" {
  description = "Log group to Firehose IAM role policy"
  value       = module.log-group-firehose-iam-role-policy.this
}

output "oracle-log-group-subscription-filter" {
  description = "Log group subscription filter"
  value       = module.oracle-log-group-subscription-filter.this
}

output "firehose-s3-iam-role" {
  description = "Firehose to S3 IAM role"
  value       = module.firehose-s3-iam-role.this
}

output "firehose-s3-iam-role-policy" {
  description = "Firehose to S3 IAM role policy"
  value       = module.firehose-s3-iam-role-policy.this
}

output "firehose-log-group-iam-role-policy" {
  description = "Firehose to Log Group IAM role policy"
  value       = module.firehose-log-group-iam-role-policy.this
}

output "kinesis-firehose-delivery-stream" {
  description = "Firehose delivery stream to S3"
  value       = module.kinesis-firehose-delivery-stream.this
}

output "s3-bucket-policy" {
  description = "S3 bucket policy"
  value       = module.s3-bucket-policy.this
}

output "s3-bucket" {
  description = "S3 bucket"
  value       = module.s3-bucket.this
}

output "aws-rds-oracle-asset" {
  description = "AWS RDS Oracle asset"
  value       = module.aws-rds-oracle-asset.this
}

output "aws-s3-bucket-asset" {
  description = "AWS S3 asset"
  value       = module.aws-s3-asset.this
}
