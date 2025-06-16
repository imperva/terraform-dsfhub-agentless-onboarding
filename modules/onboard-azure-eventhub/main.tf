terraform {
  required_providers {
    dsfhub = {
      source = "imperva/dsfhub"
    }
  }
}

module "storage-account" {
  source = "../azurerm-storage-account"

  account_replication_type = var.storage_account_replication_type
  account_tier             = var.storage_account_tier
  location                 = var.storage_account_location
  name                     = var.storage_account_name
  resource_group_name      = var.storage_account_resource_group_name
}

module "storage-container" {
  source = "../azurerm-storage-container"

  container_access_type = "private"
  name                  = var.storage_container_name
  storage_account_id    = module.storage-account.this.id
}

module "eventhub-namespace" {
  source = "../azurerm-eventhub-namespace"

  capacity                      = var.eventhub_namespace_capacity
  location                      = var.eventhub_namespace_location
  name                          = var.eventhub_namespace_name
  public_network_access_enabled = var.eventhub_namespace_public_network_access_enabled
  resource_group_name           = var.eventhub_namespace_resource_group_name
  sku                           = var.eventhub_namespace_sku
  tags                          = var.eventhub_namespace_tags
}

module "eventhub" {
  source = "../azurerm-eventhub"

  message_retention = var.eventhub_message_retention
  name              = var.eventhub_name
  namespace_id      = module.eventhub-namespace.this.id
  partition_count   = var.eventhub_partition_count
  status            = var.eventhub_status
}

locals {
  permissions = [
    {
      id     = "write"
      listen = false
      manage = false
      send   = true
    },
    {
      id     = "read"
      listen = true
      manage = false
      send   = false
    }
  ]
}

module "eventhub-authorizations" {
  source = "../azurerm-eventhub-namespace-authorization-rule"

  for_each = { for permission in local.permissions : permission.id => permission }

  listen              = each.value.listen
  manage              = each.value.manage
  name                = "dsfhub_${each.key}_permissions"
  namespace_name      = module.eventhub-namespace.this.name
  resource_group_name = var.eventhub_namespace_resource_group_name
  send                = each.value.send
}

module "azure-eventhub-asset" {
  source = "../dsfhub-azure-eventhub"

  admin_email        = var.azure_eventhub_admin_email
  asset_display_name = module.eventhub.this.name
  asset_id           = module.eventhub.this.id
  # audit_pull_enabled set to 'null' so as to be treated as a computed value
  # eventhub asset will be connected when assets using this eventhub as a log aggregator are connected
  audit_pull_enabled       = null
  auth_mechanism           = "default"
  azure_storage_account    = module.storage-account.this.name
  azure_storage_container  = module.storage-container.this.name
  azure_storage_secret_key = module.storage-account.this.primary_access_key
  eventhub_access_key      = module.eventhub-authorizations["read"].this.primary_key
  eventhub_access_policy   = module.eventhub-authorizations["read"].this.name
  eventhub_name            = module.eventhub.this.name
  eventhub_namespace       = module.eventhub.this.namespace_name
  format                   = var.azure_eventhub_format
  gateway_id               = var.azure_eventhub_gateway_id
  parent_asset_id          = var.azure_eventhub_parent_asset_id
  reason                   = "default"
  region                   = var.azure_eventhub_region
  server_host_name         = "${module.eventhub-namespace.this.name}.servicebus.windows.net"
}
