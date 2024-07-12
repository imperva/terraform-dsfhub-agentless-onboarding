terraform {
  required_providers {
    dsfhub = {
      source = "imperva/dsfhub"
    }
  }
}

resource "dsfhub_data_source" "this" {
  server_type = "AWS NEPTUNE CLUSTER"

  admin_email        = var.admin_email
  asset_display_name = var.asset_display_name
  asset_id           = var.asset_id
  gateway_id         = var.gateway_id
  server_host_name   = var.server_host_name
  server_port        = var.server_port
  region             = var.region
  audit_type         = var.audit_type
  parent_asset_id    = var.parent_asset_id

  asset_connection {
    auth_mechanism = "ec2"
    reason         = "default"
  }
}