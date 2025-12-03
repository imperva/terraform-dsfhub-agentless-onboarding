terraform {
  required_providers {
    dsfhub = {
      source = "imperva/dsfhub"
    }
  }
}

resource "dsfhub_data_source" "this" {
  count = var.db_instance_count

  server_type = "AWS RDS MS SQL SERVER"

  admin_email               = var.admin_email
  asset_display_name        = var.asset_display_name
  asset_id                  = var.asset_id
  audit_pull_enabled        = var.audit_pull_enabled
  database_name             = var.database_name
  gateway_id                = var.gateway_id
  logs_destination_asset_id = var.logs_destination_asset_id
  parent_asset_id           = var.parent_asset_id
  region                    = var.region
  server_host_name          = var.server_host_name
  server_port               = var.server_port
  service_name              = "MSSQLSERVER"
  asset_version             = var.db_engine_version
}
