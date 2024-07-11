output "mysql-option-group" {
  description = "mysql option group"
  value       = module.mysql-option-group.this
}

output "mysql-instance" {
  description = "mysql instance"
  value       = module.mysql-instance.this
}

output "mysql-log-group" {
  description = "mysql log group"
  value       = module.mysql-log-group.this
}

output "aws-rds-mysql-asset" {
  description = "aws rds mysql asset"
  value = module.aws-rds-mysql-asset.this
}

output "aws-log-group-asset" {
  description = "aws log group asset"
  value = module.aws-log-group-asset.this
}
