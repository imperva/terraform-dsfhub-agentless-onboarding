terraform {
  required_providers {
    dsfhub = {
      source  = "imperva/dsfhub"
      version = ">= 1.3.2"
    }
  }
}

module "azure-mysql-flexible-server" {
  source = "../azurerm-mysql-flexible-server"

  administrator_login    = var.server_administrator_login
  administrator_password = var.server_administrator_password
  location               = var.server_location
  name                   = var.server_name
  mysql_version          = var.server_mysql_version
  public_network_access  = var.server_public_network_access
  resource_group_name    = var.server_resource_group_name
  sku_name               = var.server_sku_name
  tags                   = var.server_tags

  azure_mysql_flexible_auto_grow_enabled   = var.server_auto_grow_enabled
  azure_mysql_flexible_io_scaling_enabled  = var.server_io_scaling_enabled
  azure_mysql_flexible_iops                = var.server_iops
  azure_mysql_flexible_log_on_disk_enabled = var.server_log_on_disk_enabled
  azure_mysql_flexible_size_gb             = var.server_size_gb
}

locals {
  server_configurations = [
    {
      name  = "audit_log_enabled"
      value = "ON"
    },
    {
      name  = "audit_log_events"
      value = "GENERAL,CONNECTION_V2,TABLE_ACCESS"
    },
    {
      name  = "audit_log_exclude_users"
      value = "azure_superuser"
    },
    {
      name  = "require_secure_transport"
      value = var.require_secure_transport ? "ON" : "OFF"
    },
    {
      name  = "slow_query_log"
      value = var.slow_query_log ? "ON" : "OFF"
    },
    {
      name  = "long_query_time"
      value = var.slow_query_time
    }
  ]
  enabled_log = var.slow_query_log ? [{ category = "MySqlSlowLogs" }, { category = "MySqlAuditLogs" }] : [{ category = "MySqlAuditLogs" }]
}

resource "azurerm_mysql_flexible_server_configuration" "this" {
  for_each = { for configuration in local.server_configurations : configuration.name => configuration }

  name                = each.value.name
  server_name         = module.azure-mysql-flexible-server.this.name
  resource_group_name = module.azure-mysql-flexible-server.this.resource_group_name
  value               = each.value.value
}

module "mysql-diagnostic-setting" {
  source = "../azurerm-monitor-diagnostic-setting"

  depends_on = [azurerm_mysql_flexible_server_configuration.this]

  enabled_log = local.enabled_log

  eventhub_authorization_rule_id = var.diagnostic_setting_eventhub_authorization_rule_id
  eventhub_name                  = var.diagnostic_setting_eventhub_name
  metric                         = null
  name                           = var.diagnostic_setting_name
  storage_account_id             = null
  target_resource_id             = module.azure-mysql-flexible-server.this.id
}

module "azure-mysql-flexible-asset" {
  source = "../dsfhub-azure-mysql-flexible"

  depends_on = [azurerm_mysql_flexible_server_configuration.this, module.mysql-diagnostic-setting]

  admin_email               = var.azure_mysql_flexible_admin_email
  asset_display_name        = module.azure-mysql-flexible-server.this.name
  asset_id                  = module.azure-mysql-flexible-server.this.id
  audit_pull_enabled        = var.azure_mysql_flexible_audit_pull_enabled
  gateway_id                = var.azure_mysql_flexible_gateway_id
  location                  = var.azure_mysql_flexible_location
  logs_destination_asset_id = var.azure_mysql_flexible_logs_destination_asset_id
  parent_asset_id           = var.azure_mysql_flexible_parent_asset_id
  server_host_name          = module.azure-mysql-flexible-server.this.fqdn
}
