terraform {
  required_providers {
    dsfhub = {
      source = "imperva/dsfhub"
    }
  }
}

resource "dsfhub_cloud_account" "this" {
  server_type = "GCP"

  admin_email        = var.admin_email
  asset_display_name = var.asset_display_name
  asset_id           = var.asset_id
  gateway_id         = var.gateway_id

  asset_connection {
    auth_mechanism = var.auth_mechanism
    reason         = var.reason
    key_file       = var.auth_mechanism == "service_account" ? var.key_file : null
  }
}
