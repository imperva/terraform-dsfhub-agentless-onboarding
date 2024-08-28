output "s3-bucket" {
  description = "S3 Bucket"
  value       = module.s3-bucket.this
}

output "rds-sql-server-role" {
  description = "IAM role used in RDS option group"
  value       = module.rds-sql-server-role.this
}

output "rds-sql-server-policy" {
  description = "IAM policy giving RDS permissions to write to S3 bucket"
  value       = module.rds-sql-server-policy.this
}

output "attach-rds-sql-server-iam-policy" {
  description = "Attaching the IAM policy to the IAM role"
  value       = module.attach-rds-sql-server-iam-policy.this
}

output "rds-sql-server-option-group" {
  description = "RDS option group"
  value       = module.rds-sql-server-option-group.this
}

output "rds-sql-server-instance" {
  description = "RDS SQL Server instance(s)"
  value       = module.rds-sql-server-db.*.this
  sensitive   = true
}

output "rds-sql-server-instance-asset" {
  description = "AWS RDS MS SQL SERVER asset(s)"
  value       = module.aws-rds-ms-sql-server-asset.*.this
}

output "s3-bucket-asset" {
  description = "AWS S3 Bucket asset"
  value       = module.s3-bucket-asset.this
}
