output "postgres-parameter-group" {
  description = "postgres parameter group"
  value       = module.postgres-parameter-group.this
}

output "postgres-instance" {
  description = "postgres instance"
  value       = module.postgres-instance.this
}

output "postgres-log-group" {
  description = "postgres audit log group"
  value       = module.postgres-parameter-group.this
}

output "aws-rds-postgresql-asset" {
  description = "aws rds postgresql asset"
  value       = module.aws-rds-postgresql-asset.this
}

output "aws-log-group-asset" {
  description = "aws log group asset"
  value       = module.aws-log-group-asset.this
}
