output "gcp-alloydb-postgresql-cluster" {
  description = "Google AlloyDB for PostgreSQL cluster"
  value       = module.gcp-alloydb-cluster.this
}

output "gcp-alloydb-postgresql-instance" {
  description = "Google AlloyDB for PostgreSQL instance"
  value       = module.gcp-alloydb-instance.this
}

output "gcp-alloydb-postgresql-cluster-asset" {
  description = "GCP ALLOYDB POSTGRESQL CLUSTER asset"
  value       = module.gcp-alloydb-postgresql-cluster-asset.this
}

output "gcp-alloydb-postgresql-asset" {
  description = "GCP ALLOYDB POSTGRESQL asset"
  value       = module.gcp-alloydb-postgresql-asset.this
}
