output "this" {
  description = "AWS Redshift cluster asset"
  value       = dsfhub_data_source.this
  sensitive   = true
}
