output "gcp-postgresql-instance" {
  description = "Google PostgreSQL database instance"
  value       = module.gcp-postgresql-instance.this
}

output "gcp-postgresql-asset" {
  description = "GCP POSTGRESQL asset"
  value       = module.gcp-postgresql-asset.this
}
