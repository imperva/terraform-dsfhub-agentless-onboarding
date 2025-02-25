terraform {
  required_providers {
    dsfhub = {
      source = "imperva/dsfhub"
    }
  }
}

resource "dsfhub_data_source" "this" {
  server_type = "GCP ALLOYDB POSTGRESQL CLUSTER"

  admin_email               = var.admin_email
  asset_display_name        = var.asset_display_name
  asset_id                  = var.asset_id
  audit_pull_enabled        = var.audit_pull_enabled
  cluster_id                = var.cluster_id
  gateway_id                = var.gateway_id
  logs_destination_asset_id = var.logs_destination_asset_id
  parent_asset_id           = var.parent_asset_id
  pubsub_subscription       = var.pubsub_subscription
  server_host_name          = var.server_host_name
  server_ip                 = var.server_ip
  server_port               = var.server_port

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
