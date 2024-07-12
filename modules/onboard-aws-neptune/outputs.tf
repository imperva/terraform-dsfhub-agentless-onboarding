output "cluster_parameter_group" {
  description = "Neptune Cluster parameter group"
  value       = module.neptune-cluster-parameter-group.this
}

output "cluster" {
  description = "Neptune Cluster"
  value       = module.neptune-cluster.this
}

output "instance" {
  description = "Neptune instance"
  value       = module.neptune-instance.this
}

output "log_group" {
  description = "Neptune log group"
  value       = module.neptune-log-group.this
}

output "dsf_neptune_cluster" {
  description = "Neptune cluster DSF asset"
  value       = module.aws-neptune-cluster-asset.this
}

output "dsf_neptune_log_group" {
  description = "DSF neptune log group asset"
  value       = module.aws-log-group-asset.this
}