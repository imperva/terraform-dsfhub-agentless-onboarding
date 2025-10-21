terraform {
  required_providers {
    dsfhub = {
      source = "imperva/dsfhub"
    }
  }
}

resource "dsfhub_log_aggregator" "this" {
  server_type = "GCP CLOUD STORAGE BUCKET"

  admin_email        = var.admin_email
  asset_display_name = var.asset_display_name
  asset_id           = var.asset_id
  audit_pull_enabled = var.audit_pull_enabled
  audit_data_type    = var.audit_data_type
  audit_type         = var.audit_type
  content_type       = var.content_type
  gateway_id         = var.gateway_id
  parent_asset_id    = var.parent_asset_id
  server_host_name   = "storage.googleapis.com"
  server_ip          = "storage.googleapis.com"
  server_port        = "443"

  asset_connection {
    auth_mechanism = "default"
    reason         = "default"
  }
}
