output "mysql-option-group" {
  description = "mysql option group"
  value       = module.mysql-option-group.this
}

output "mysql-instance" {
  description = "mysql instance"
  value       = module.mysql-instance.this
}

output "mysql-audit-log-group" {
  description = "mysql audit log group"
  value       = module.mysql-audit-log-group.this
}

output "mysql-slow-query-log-group" {
  description = "mysql slow query log group"
  value       = module.mysql-slow-query-log-group.this
}

output "aws-rds-mysql-asset" {
  description = "aws rds mysql asset"
  value       = module.aws-rds-mysql-asset.this
}

output "aws-log-group-audit-asset" {
  description = "aws log group audit asset"
  value       = module.aws-log-group-audit-asset.this
}

output "aws-log-group-slow-query-asset" {
  description = "aws log group slow query asset"
  value       = module.aws-log-group-slow-query-asset.this
}
