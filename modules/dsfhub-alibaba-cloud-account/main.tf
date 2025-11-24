terraform {
  required_providers {
    dsfhub = {
      source = "imperva/dsfhub"
    }
  }
}

resource "dsfhub_cloud_account" "this" {
  server_type = "ALIBABA"

  admin_email        = var.admin_email
  asset_display_name = var.asset_display_name
  asset_id           = var.asset_id
  gateway_id         = var.gateway_id
  server_port        = "443"

  asset_connection {
    auth_mechanism = var.auth_mechanism
    access_id      = var.auth_mechanism == "key" ? var.access_id : null
    secret_key     = var.auth_mechanism == "key" ? var.access_key : null
    role_name      = var.auth_mechanism == "machine_role" ? var.role_name : null
    reason         = "default"
    region         = var.region
  }
}
