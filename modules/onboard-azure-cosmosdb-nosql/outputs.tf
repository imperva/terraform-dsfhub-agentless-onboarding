output "cosmos-nosql-account" {
  description = "CosmosDB NoSQL account."
  value       = module.cosmos-nosql-account.this
}

output "enable-full-text-query" {
  description = "API update to enable full text query logging."
  value       = module.enable-full-text-query.this
}

output "diagnostic-setting" {
  description = "Diagnostic Setting."
  value       = module.diagnostic-setting.this
}

output "azure-cosmosdb-asset" {
  description = "AZURE COSMOSDB asset."
  value       = module.azure-cosmosdb-asset.this
}
