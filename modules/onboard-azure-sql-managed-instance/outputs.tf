output "default-managed-instance-security-rules" {
  description = "Security rules required for Managed Instances by default."
  value       = local.default_managed_instance_security_rules
}

output "security-group" {
  description = "Azure Network Security Group."
  value       = module.security-group.this
}

output "route-table" {
  description = "Azure Managed Instance Route Table."
  value       = module.route-table.this
}

output "virtual-network" {
  description = "Azure Managed Instance Virtual Network."
  value       = module.virtual-network.this
}

output "azure-ms-sql-managed-instance" {
  description = "Microsoft SQL Azure Managed Instance."
  value       = module.azure-ms-sql-managed-instance.this
}

output "diagnostic-setting" {
  description = "Diagnostic Setting."
  value       = module.diagnostic-setting.this
}

output "azure-sql-managed-instance-asset" {
  description = "AZURE SQL MANAGED INSTANCE asset."
  value       = module.azure-sql-managed-instance-asset.this
}

