output "mariadb-option-group" {
  description = "mariadb option group"
  value = module.mariadb-option-group.this
}

output "mariadb-instance" {
  description = "mariadb instance"
  value = module.mariadb-instance.this
}

output "mariadb-log-group" {
  description = "mariadb log group"
  value = module.mariadb-log-group.this
}

output "aws-rds-mariadb-asset" {
  description = "aws rds mariadb asset"
  value = module.aws-rds-mariadb-asset.this
}

output "aws-log-group-asset" {
  description = "aws log group asset"
  value = module.aws-log-group-asset.this
}
