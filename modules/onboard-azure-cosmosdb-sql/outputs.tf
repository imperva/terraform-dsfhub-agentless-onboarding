output "cosmos-sql-account" {
  description = "CosmosDB SQL account."
  value       = module.cosmos-sql-account.this
}

output "enable-full-text-query" {
  description = "API update to enable full text query logging."
  value       = module.enable-full-text-query.this
}

output "diagnostic-setting" {
  description = "Daignostic Setting."
  value       = module.diagnostic-setting.this
}

output "azure-cosmosdb-asset" {
  description = "AZURE COSMOSDB asset."
  value       = module.azure-cosmosdb-asset.this
}

output "azure-eventhub-asset" {
  description = "AZURE EVENTHUB asset."
  value       = module.azure-eventhub-asset.this
}
