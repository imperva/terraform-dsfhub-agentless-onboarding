terraform {
  required_providers {
    dsfhub = {
      source  = "imperva/dsfhub"
      version = ">= 1.3.7"
    }
  }
}

resource "dsfhub_data_source" "this" {
  server_type = "AZURE MYSQL FLEXIBLE"

  admin_email               = var.admin_email
  asset_display_name        = var.asset_display_name
  asset_id                  = var.asset_id
  audit_pull_enabled        = var.audit_pull_enabled
  gateway_id                = var.gateway_id
  location                  = var.location
  logs_destination_asset_id = var.logs_destination_asset_id
  parent_asset_id           = var.parent_asset_id
  server_host_name          = var.server_host_name
  server_ip                 = null
  server_port               = "3306"
  audit_type                = "MYSQL_FLEXIBLE"

  dynamic "asset_connection" {
    # If auth_mechanism is not defined, do not create a connection
    for_each = var.auth_mechanism != null ? [0] : []

    content {
      auth_mechanism = var.auth_mechanism
      password       = var.password
      reason         = var.reason
      username       = var.username
    }
  }
}
