output "cosmos-table-account" {
  description = "CosmosDB Table account."
  value       = module.cosmos-table-account.this
}

output "cosmosdb-table" {
  description = "CosmosDB Table."
  value       = module.cosmosdb-table.this
}

output "diagnostic-setting" {
  description = "Diagnostic Setting."
  value       = module.diagnostic-setting.this
}

output "azure-cosmosdb-asset" {
  description = "AZURE COSMOSDB TABLE asset."
  value       = module.azure-cosmosdb-asset.this
}
