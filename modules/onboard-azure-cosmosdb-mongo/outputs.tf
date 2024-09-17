output "cosmos-mongo-account" {
  description = "CosmosDB MongoDB account."
  value       = module.cosmos-mongo-account.this
}

output "diagnostic-setting" {
  description = "Diagnostic Setting."
  value       = module.diagnostic-setting.this
}

output "azure-cosmosdb-asset" {
  description = "AZURE COSMOSDB MONGO asset."
  value       = module.azure-cosmosdb-mongo-asset.this
}
