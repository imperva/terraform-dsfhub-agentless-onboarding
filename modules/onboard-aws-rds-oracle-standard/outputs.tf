output "oracle-parameter-group" {
  description = "oracle parameter group"
  value       = module.oracle-parameter-group.this
}

output "oracle-instance" {
  description = "oracle instance"
  value       = module.oracle-instance.this
}

output "oracle-log-group" {
  description = "aws log group"
  value       = module.oracle-log-group.this
}

output "aws-rds-oracle-asset" {
  description = "aws rds oracle asset"
  value       = module.aws-rds-oracle-asset.this
}

output "aws-log-group-asset" {
  description = "aws log group asset"
  value       = module.aws-log-group-asset.this
}
