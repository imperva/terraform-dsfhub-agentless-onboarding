terraform {
  required_providers {
    dsfhub = {
      source = "imperva/dsfhub"
    }
  }
}

resource "dsfhub_log_aggregator" "this" {
  server_type = "AZURE EVENTHUB"

  admin_email        = var.admin_email
  asset_display_name = var.asset_display_name
  asset_id           = var.asset_id
  audit_pull_enabled = var.audit_pull_enabled
  gateway_id         = var.gateway_id
  parent_asset_id    = var.parent_asset_id
  region             = var.region
  server_host_name   = var.server_host_name
  server_port        = "443"

  dynamic "asset_connection" {
    # If auth_mechanism is not defined, do not create a connection
    for_each = var.auth_mechanism != null ? [0] : []

    content {
      auth_mechanism           = var.auth_mechanism
      azure_storage_account    = var.azure_storage_account
      azure_storage_container  = var.azure_storage_container
      azure_storage_secret_key = var.auth_mechanism == "default" ? var.azure_storage_secret_key : null
      eventhub_access_key      = var.auth_mechanism == "default" ? var.eventhub_access_key : null
      eventhub_access_policy   = var.auth_mechanism == "default" ? var.eventhub_access_policy : null
      eventhub_name            = var.eventhub_name
      eventhub_namespace       = var.eventhub_namespace
      format                   = var.format
      reason                   = var.reason
    }
  }
}
