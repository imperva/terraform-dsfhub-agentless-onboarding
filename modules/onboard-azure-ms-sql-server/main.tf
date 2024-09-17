terraform {
  required_providers {
    dsfhub = {
      source = "imperva/dsfhub"
    }
  }
}

module "sql-server-instance" {
  source = "../azurerm-mssql-server"

  administrator_login           = var.server_administrator_login
  administrator_login_password  = var.server_administrator_login_password
  location                      = var.server_location
  name                          = var.server_name
  public_network_access_enabled = var.server_public_network_access_enabled
  resource_group_name           = var.server_resource_group_name
  server_version                = var.server_version
  tags                          = var.server_tags
}

module "sql-server-extended-server-audit-policy" {
  source = "../azurerm-mssql-server-extended-auditing-policy"

  enabled   = var.audit_policy_enabled
  server_id = module.sql-server-instance.this.id
}

# Allow time for 'master' database to initialize before creating diagnostic setting
resource "time_sleep" "wait" {
  depends_on = [module.sql-server-instance]

  create_duration = "5m"
}

data "azurerm_mssql_database" "master" {
  depends_on = [time_sleep.wait]

  server_id = module.sql-server-instance.this.id
  name      = "master"
}

module "sql-server-diagnostic-setting" {
  source = "../azurerm-monitor-diagnostic-setting"

  enabled_log                    = [{ category = "SQLSecurityAuditEvents" }]
  eventhub_authorization_rule_id = var.diagnostic_setting_eventhub_authorization_rule_id
  eventhub_name                  = var.diagnostic_setting_eventhub_name
  metric                         = [{ category = "AllMetrics" }]
  name                           = var.diagnostic_setting_name
  target_resource_id             = data.azurerm_mssql_database.master.id
}

module "azure-ms-sql-server-asset" {
  depends_on = [module.sql-server-diagnostic-setting]
  source     = "../dsfhub-azure-ms-sql-server"

  admin_email               = var.azure_ms_sql_server_admin_email
  asset_display_name        = module.sql-server-instance.this.name
  asset_id                  = module.sql-server-instance.this.id
  audit_pull_enabled        = var.azure_ms_sql_server_audit_pull_enabled
  database_name             = var.azure_ms_sql_server_database_name
  gateway_id                = var.azure_ms_sql_server_gateway_id
  location                  = var.azure_ms_sql_server_location
  logs_destination_asset_id = var.azure_ms_sql_server_logs_destination_asset_id
  parent_asset_id           = var.azure_ms_sql_server_parent_asset_id
  server_host_name          = module.sql-server-instance.this.fully_qualified_domain_name
  server_ip                 = module.sql-server-instance.this.fully_qualified_domain_name
  server_port               = "1433"
}
