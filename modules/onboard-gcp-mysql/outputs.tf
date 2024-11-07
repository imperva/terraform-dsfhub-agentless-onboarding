output "gcp-mysql-instance" {
  description = "Google MySQL database instance"
  value       = module.gcp-mysql-instance.this
}

output "gcp-mysql-asset" {
  description = "GCP MYSQL asset"
  value       = module.gcp-mysql-asset.this
}
