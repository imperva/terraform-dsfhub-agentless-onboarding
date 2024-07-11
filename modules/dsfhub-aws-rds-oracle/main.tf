terraform {
  required_providers {
    dsfhub = {
      source = "imperva/dsfhub"
    }
  }
}

resource "dsfhub_data_source" "this" {
  server_type = "AWS RDS ORACLE"

  admin_email        = var.admin_email
  asset_display_name = var.asset_display_name
  asset_id           = var.asset_id
  audit_pull_enabled = var.audit_pull_enabled
  audit_type         = var.audit_type
  gateway_id         = var.gateway_id
  parent_asset_id    = var.parent_asset_id
  region             = var.region
  server_host_name   = var.server_host_name
  service_name       = var.service_name
  server_port        = var.server_port

  dynamic "asset_connection" {
    # If auth_mechanism is not defined, do not create a connection
    for_each = var.auth_mechanism != null ? [0] : []

    content {
      auth_mechanism = var.auth_mechanism
      dsn            = var.auth_mechanism == "oracle_wallet" ? var.dsn : null
      password       = var.password
      reason         = var.reason
      username       = var.username
      wallet_dir     = var.auth_mechanism == "oracle_wallet" ? var.wallet_dir : null
    }
  }
}
