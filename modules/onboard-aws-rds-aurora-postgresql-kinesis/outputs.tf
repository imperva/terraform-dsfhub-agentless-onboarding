output "cluster" {
  description = "Aurora PostgreSQL cluster"
  value       = module.aurora-postgresql-cluster.this
}

output "instance" {
  description = "Aurora PostgreSQL instance"
  value       = module.aurora-postgresql-instance.this
}

output "kms_key" {
  description = "AWS KMS Key"
  value       = module.aws-kms-key.this
}

output "activity_stream" {
  description = "Aurora PostgreSQL kinesis activity stream"
  value       = module.aurora-postgresql-cluster-activity-stream.this
}

output "aws_rds_aurora_postgresql_cluster_asset" {
  description = "Aurora PostgreSQL cluster asset"
  value       = module.aws-rds-aurora-postgresql-cluster-asset.this
}

output "aws_kinesis_asset" {
  description = "AWS Kinesis stream asset"
  value       = module.aws-kinesis-asset.this
}
