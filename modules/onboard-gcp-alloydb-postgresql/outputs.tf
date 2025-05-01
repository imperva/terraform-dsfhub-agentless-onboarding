output "gcp-alloydb-cluster" {
  description = "Google AlloyDB for PostgreSQL cluster"
  value       = module.gcp-alloydb-cluster.this
}

output "gcp-alloydb-primary-instance" {
  description = "Google AlloyDB for PostgreSQL primary instance"
  value       = module.gcp-alloydb-primary-instance.this
}

output "gcp-alloydb-read-pool-instance" {
  description = "Google AlloyDB for PostgreSQL reader instance"
  value       = module.gcp-alloydb-read-pool-instance.this
}

output "gcp-alloydb-postgresql-cluster-asset" {
  description = "GCP ALLOYDB POSTGRESQL CLUSTER asset"
  value       = module.gcp-alloydb-postgresql-cluster-asset.this
}

output "gcp-alloydb-postgresql-asset" {
  description = "GCP ALLOYDB POSTGRESQL asset"
  value       = module.gcp-alloydb-postgresql-asset.this
}
