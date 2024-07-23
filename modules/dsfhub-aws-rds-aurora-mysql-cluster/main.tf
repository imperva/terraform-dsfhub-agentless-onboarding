terraform {
  required_providers {
    dsfhub = {
      source = "imperva/dsfhub"
    }
  }
}

resource "dsfhub_data_source" "this" {
  server_type = "AWS RDS AURORA MYSQL CLUSTER"

  admin_email        = var.admin_email
  asset_display_name = var.asset_display_name
  asset_id           = var.asset_id
  gateway_id         = var.gateway_id
  server_host_name   = var.server_host_name
  parent_asset_id    = var.parent_asset_id
  region             = var.region
  server_port        = var.server_port

  dynamic "asset_connection" {
    # If auth_mechanism is not defined, do not create a connection
    for_each = var.auth_mechanism != null ? [0] : []

    content {
      auth_mechanism = var.auth_mechanism != null ? var.auth_mechanism : null
      username       = var.username
      password       = var.password
      reason         = "default"
    }
  }
}
