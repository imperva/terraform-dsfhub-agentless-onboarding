output "docdb-param-group" {
  description = "docdb parameter group"
  value       = module.docdb-param-group.this
}

output "docdb-cluster" {
  description = "docdb cluster"
  value       = module.docdb-cluster.this
}

output "docdb-cluster-instance" {
  description = "docdb cluster instance"
  value       = module.docdb-cluster-instance[*].this
}

output "docdb-log-group" {
  description = "docdb log group"
  value       = module.docdb-log-group.this
}

output "docdb-cluster-asset" {
  description = "docdb cluster asset"
  value       = module.docdb-cluster-asset.this
}

output "docdb-log-group-asset" {
  description = "docdb log group asset"
  value       = module.docdb-log-group-asset.this
}
