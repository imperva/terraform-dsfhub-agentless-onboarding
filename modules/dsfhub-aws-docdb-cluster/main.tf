terraform {
  required_providers {
    dsfhub = {
      source = "imperva/dsfhub"
    }
  }
}

resource "dsfhub_data_source" "this" {
  server_type = "AWS DOCUMENTDB CLUSTER"

  admin_email        = var.admin_email
  asset_display_name = var.asset_display_name
  asset_id           = var.asset_id
  audit_type         = "LOG_GROUP"
  cluster_id         = var.cluster_id
  gateway_id         = var.gateway_id
  parent_asset_id    = var.parent_asset_id
  region             = var.region
  server_host_name   = var.server_host_name
  server_ip          = var.server_ip
  server_port        = var.server_port
}
