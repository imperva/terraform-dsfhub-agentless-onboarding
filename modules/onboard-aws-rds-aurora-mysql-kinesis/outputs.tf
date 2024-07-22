output "cluster" {
  description = "Aurora MySQL Cluster"
  value       = module.aurora-mysql-cluster.this
}

output "instance" {
  description = "Aurora MySQL Cluster instance"
  value       = module.aurora-mysql-instance.this
}

output "kms_key" {
  description = "AWS KMS Key"
  value       = module.aws-kms-key.this
}

output "activity_stream" {
  description = "Aurora MySQL kinesis activity stream"
  value       = module.aurora-mysql-cluster-activity-stream.this
}

output "aws_rds_aurora_mysql_cluster_asset" {
  description = "Aurora MySQL cluster asset"
  value       = module.aws-rds-aurora-mysql-cluster-asset.this
}

output "aws_kinesis_asset" {
  description = "AWS Kinesis stream asset"
  value       = module.aws-kinesis-asset.this
}
