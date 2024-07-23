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

output "aws_rds_aurora_mysql_cluster_asset" {
  description = "Aurora MySQL cluster asset"
  value       = module.aws-rds-aurora-mysql-cluster-asset.this
}

output "aws_log_group_asset" {
  description = "AWS log group asset"
  value       = module.aws-log-group-asset.this
}
