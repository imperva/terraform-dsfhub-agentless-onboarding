terraform {
  required_providers {
    dsfhub = {
      source  = "imperva/dsfhub"
      version = ">= 1.3.7"
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

  storage_auto_grow_enabled   = var.server_auto_grow_enabled
  storage_io_scaling_enabled  = var.server_io_scaling_enabled
  storage_iops                = var.server_iops
  storage_log_on_disk_enabled = var.server_log_on_disk_enabled
  storage_size_gb             = var.server_size_gb
}

locals {
  enabled_log = var.server_config_slow_query_log ? [{ category = "MySqlSlowLogs" }, { category = "MySqlAuditLogs" }] : [{ category = "MySqlAuditLogs" }]
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
      value = var.server_config_require_secure_transport ? "ON" : "OFF"
    },
    {
      name  = "slow_query_log"
      value = var.server_config_slow_query_log ? "ON" : "OFF"
    },
    {
      name  = "long_query_time"
      value = var.server_config_slow_query_time
    }
  ]
  firewall_rules = var.server_firewall_rules
}

resource "azurerm_mysql_flexible_server_firewall_rule" "this" {
  for_each = local.firewall_rules != null && length(local.firewall_rules) > 0 ? { for rule in local.firewall_rules : rule.name => rule } : {}

  name                = each.value.name
  server_name         = module.azure-mysql-flexible-server.this.name
  resource_group_name = module.azure-mysql-flexible-server.this.resource_group_name
  start_ip_address    = each.value.start_ip
  end_ip_address      = each.value.end_ip
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

  enabled_log                    = local.enabled_log
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
