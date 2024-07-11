output "s3-bucket" {
  description = "s3 bucket"
  value       = module.redshift-cluster.this
}

output "s3_policy" {
  description = "s3 iam policy"
  value       = data.aws_iam_policy_document.s3_policy.json
}

output "s3-bucket-policy" {
  description = "s3 bucket policy"
  value       = module.s3-bucket-policy.this
}

output "redshift-parameter-group" {
  description = "redshift parameter group"
  value       = module.redshift-parameter-group.this
}

output "redshift-logging" {
  description = "redshift logging configuration"
  value       = module.redshift-logging.this
}

output "redshift-cluster" {
  description = "redshift cluster"
  value       = module.redshift-cluster.this
}

output "redshift-asset" {
  description = "aws redshift asset"
  value       = module.redshift-asset.this
}

output "s3-bucket-asset" {
  description = "aws s3 bucket asset"
  value       = module.s3-bucket-asset.this
}
