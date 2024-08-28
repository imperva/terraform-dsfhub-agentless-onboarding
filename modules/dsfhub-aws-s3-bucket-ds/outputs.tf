output "this" {
  description = "AWS S3 bucket data source asset"
  value       = dsfhub_data_source.this
  sensitive   = true
}
