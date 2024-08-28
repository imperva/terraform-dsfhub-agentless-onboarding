output "this" {
  description = "AWS S3 bucket log aggregator asset"
  value       = dsfhub_log_aggregator.this
  sensitive   = true
}
