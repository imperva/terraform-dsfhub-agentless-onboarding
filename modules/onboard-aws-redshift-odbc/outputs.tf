output "redshift-cluster" {
  description = "redshift cluster"
  value       = module.redshift-cluster.this
}

output "redshift-asset" {
  description = "aws redshift asset"
  value       = module.redshift-asset.this
}
