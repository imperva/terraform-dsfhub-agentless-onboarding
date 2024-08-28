output "s3-bucket" {
  description = "S3 Bucket"
  value       = module.redshift-cluster.this
}

output "s3_policy" {
  description = "S3 Bucket IAM Policy Document"
  value       = data.aws_iam_policy_document.s3_policy.json
}

output "s3-bucket-policy" {
  description = "S3 Bucket IAM Policy"
  value       = module.s3-bucket-policy.this
}

output "redshift-parameter-group" {
  description = "Redshift Parameter Group"
  value       = module.redshift-parameter-group.this
}

output "redshift-logging" {
  description = "Redshift Logging Configuration"
  value       = module.redshift-logging.this
}

output "redshift-cluster" {
  description = "Redshift Cluster"
  value       = module.redshift-cluster.this
}

output "redshift-asset" {
  description = "AWS Redshift asset"
  value       = module.redshift-asset.this
}

output "s3-bucket-asset" {
  description = "AWS S3 bucket asset"
  value       = module.s3-bucket-asset.this
}
