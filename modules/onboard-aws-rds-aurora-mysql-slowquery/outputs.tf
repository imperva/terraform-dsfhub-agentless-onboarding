output "cluster_parameter_group" {
  description = "Aurora MySQL Cluster parameter group"
  value       = module.aurora-mysql-cluster-parameter-group.this
}

output "cluster" {
  description = "Aurora MySQL Cluster"
  value       = module.aurora-mysql-cluster.this
}

output "instance" {
  description = "Aurora MySQL instance"
  value       = module.aurora-mysql-instances.this
}

output "log_group" {
  description = "Aurora MySQL log group"
  value       = module.aurora-mysql-log-group.this
}

output "log_group_slowquery" {
  description = "Aurora MySQL slow query log group"
  value       = module.aurora-mysql-log-group-slowquery.this
}

output "dsf_aurora_mysql_cluster" {
  description = "Aurora MySQL cluster DSF asset"
  value       = module.aws-rds-aurora-mysql-cluster-asset.this
}

output "dsf_aurora_mysql_log_group" {
  description = "Aurora MySQL log group asset"
  value       = module.aws-log-group-asset.this
}

output "dsf_aurora_mysql_log_group_slowquery" {
  description = "Aurora MySQL slow query log group asset"
  value       = module.aws-log-group-slowquery-asset.this
}
