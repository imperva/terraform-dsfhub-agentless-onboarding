output "storage-account" {
  description = "Azure Storage Account."
  value       = module.storage-account.this
}

output "storage-container" {
  description = "Azure Storage Container."
  value       = module.storage-container.this
}

output "eventhub-namespace" {
  description = "Azure Event Hub Namespace."
  value       = module.eventhub-namespace.this
}

output "eventhub" {
  description = "Azure Event Hub."
  value       = module.eventhub.this
}

output "eventhub-read-authorization" {
  description = "Read authorization for the Event Hub Namespace."
  value       = module.eventhub-authorizations["read"].this
}

output "eventhub-write-authorization" {
  description = "Write authorization for the Event Hub Namespace."
  value       = module.eventhub-authorizations["write"].this
}

output "azure-eventhub-asset" {
  description = "AZURE EVENTHUB asset."
  value       = module.azure-eventhub-asset.this
}
