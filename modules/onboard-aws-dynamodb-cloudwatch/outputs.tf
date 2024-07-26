output "s3-bucket" {
  description = "S3 bucket"
  value       = module.s3-bucket.this
}

output "s3-bucket-policy" {
  description = "S3 bucket policy"
  value       = module.s3-bucket-policy.this
}

output "cloudtrail" {
  description = "AWS CloudTrail"
  value       = module.cloudtrail.this
}

output "log-group" {
  description = "CloudWatch log group"
  value       = module.dynamodb-log-group.this
}

output "cloudwatch-policy" {
  description = "CloudWatch policy"
  value       = module.cloudwatch-policy.this
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

output "aws-log-group-asset" {
  description = "AWS Log Group asset"
  value       = module.aws-log-group-asset.this
}
