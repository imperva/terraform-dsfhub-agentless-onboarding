output "gcp-spanner-instance" {
  description = "Google Spanner instance"
  value       = module.gcp-spanner-instance.this
}

output "gcp-spanner-asset" {
  description = "GCP SPANNER asset"
  value       = module.gcp-spanner-asset.this
}
