output "oracle-parameter-group" {
  description = "oracle parameter group"
  value       = module.oracle-parameter-group.this
}

output "oracle-instance" {
  description = "oracle instance"
  value       = module.oracle-instance.this
}

output "aws-rds-oracle-asset" {
  description = "aws rds oracle asset"
  value       = module.aws-rds-oracle-asset.this
}
