terraform {
  required_providers {
    dsfhub = {
      source  = "imperva/dsfhub"
      version = ">= 1.3.3"
    }
  }
}

resource "dsfhub_cloud_account" "this" {
  server_type = "AZURE"

  admin_email        = var.admin_email
  asset_display_name = var.asset_display_name
  asset_id           = var.asset_id
  gateway_id         = var.gateway_id

  dynamic "asset_connection" {
    # If auth_mechanism is not defined, do not create a connection
    for_each = var.auth_mechanism != null ? [0] : []

    content {
      auth_mechanism = var.auth_mechanism # "client_secret", "auth_file", "managed_identity"

      application_id  = var.auth_mechanism == "client_secret" ? var.application_id : null
      client_secret   = var.auth_mechanism == "client_secret" ? var.client_secret : null
      directory_id    = var.auth_mechanism == "client_secret" ? var.directory_id : null
      key_file        = var.auth_mechanism == "auth_file" ? var.key_file : null
      reason          = var.reason
      subscription_id = (var.auth_mechanism == "client_secret" || var.auth_mechanism == "managed_identity") ? var.subscription_id : null
    }
  }
}
