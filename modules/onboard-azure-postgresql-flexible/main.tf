terraform {
  required_providers {
    dsfhub = {
      source  = "imperva/dsfhub"
      version = ">= 1.3.2"
    }
  }
}

module "azure-postgresql-flexible-server" {
  source = "../azurerm-postgresql-flexible-server"

  administrator_login           = var.server_administrator_login
  administrator_password        = var.server_administrator_password
  location                      = var.server_location
  name                          = var.server_name
  postgres_version              = var.server_postgres_version
  public_network_access_enabled = var.server_public_network_access_enabled
  resource_group_name           = var.server_resource_group_name
  sku_name                      = var.server_sku_name
  storage_mb                    = var.server_storage_mb
  storage_tier                  = var.server_storage_tier
  tags                          = var.server_tags
}

resource "azurerm_postgresql_flexible_server_firewall_rule" "this" {
  for_each = var.server_firewall_rules != null && length(var.server_firewall_rules) > 0 ? { for rule in var.server_firewall_rules : rule.name => rule } : {}

  name             = each.value.name
  server_id        = module.azure-postgresql-flexible-server.this.id
  start_ip_address = each.value.start_ip
  end_ip_address   = each.value.end_ip
}

resource "azurerm_postgresql_flexible_server_configuration" "this" {
  for_each = { for configuration in var.server_configurations : configuration.name => configuration }

  name      = each.value.name
  server_id = module.azure-postgresql-flexible-server.this.id
  value     = each.value.value
}

module "postgresql-diagnostic-setting" {
  source = "../azurerm-monitor-diagnostic-setting"

  depends_on = [azurerm_postgresql_flexible_server_configuration.this]

  enabled_log                    = [{ category = "PostgreSQLLogs" }]
  eventhub_authorization_rule_id = var.diagnostic_setting_eventhub_authorization_rule_id
  eventhub_name                  = var.diagnostic_setting_eventhub_name
  metric                         = null
  name                           = var.diagnostic_setting_name
  storage_account_id             = null
  target_resource_id             = module.azure-postgresql-flexible-server.this.id
}

module "azure-postgresql-flexible-asset" {
  source = "../dsfhub-azure-postgresql-flexible"

  depends_on = [azurerm_postgresql_flexible_server_configuration.this, module.postgresql-diagnostic-setting]

  admin_email               = var.azure_postgresql_flexible_admin_email
  asset_display_name        = module.azure-postgresql-flexible-server.this.name
  asset_id                  = module.azure-postgresql-flexible-server.this.id
  audit_pull_enabled        = var.azure_postgresql_flexible_audit_pull_enabled
  gateway_id                = var.azure_postgresql_flexible_gateway_id
  location                  = var.azure_postgresql_flexible_location
  logs_destination_asset_id = var.azure_postgresql_flexible_logs_destination_asset_id
  parent_asset_id           = var.azure_postgresql_flexible_parent_asset_id
  server_host_name          = module.azure-postgresql-flexible-server.this.fqdn
}
