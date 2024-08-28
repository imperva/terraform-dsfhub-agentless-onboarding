output "this" {
  description = "AWS Redshift Cluster"
  value       = aws_redshift_cluster.this
  sensitive   = true
}
