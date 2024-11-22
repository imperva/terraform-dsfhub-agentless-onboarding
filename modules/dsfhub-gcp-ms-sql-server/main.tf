terraform {
  required_providers {
    dsfhub = {
      source = "imperva/dsfhub"
    }
  }
}

resource "dsfhub_data_source" "this" {
  server_type = "GCP MS SQL SERVER"

  admin_email               = var.admin_email
  asset_display_name        = var.asset_display_name
  asset_id                  = var.asset_id
  audit_pull_enabled        = var.audit_pull_enabled
  audit_type                = var.audit_type
  gateway_id                = var.gateway_id
  logs_destination_asset_id = var.logs_destination_asset_id
  parent_asset_id           = var.parent_asset_id
  server_host_name          = var.server_host_name
  server_ip                 = var.server_ip
  server_port               = "1433"
}
