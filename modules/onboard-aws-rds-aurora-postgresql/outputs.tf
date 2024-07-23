output "cluster_parameter_group" {
  description = "Aurora PostgreSQL Cluster parameter group"
  value       = module.aurora-postgresql-cluster-parameter-group.this
}

output "cluster" {
  description = "Aurora PostgreSQL Cluster"
  value       = module.aurora-postgresql-cluster.this
}

output "instance" {
  description = "Aurora PostgreSQL instance"
  value       = module.aurora-postgresql-instance.this
}

output "log_group" {
  description = "Aurora PostgreSQL log group"
  value       = module.aurora-postgresql-log-group.this
}

output "aws_rds_aurora_postgresql_cluster_asset" {
  description = "Aurora PostgreSQL cluster asset"
  value       = module.aws-rds-aurora-postgresql-cluster-asset.this
}

output "aws_log_group_asset" {
  description = "AWS log group asset"
  value       = module.aws-log-group-asset.this
}
