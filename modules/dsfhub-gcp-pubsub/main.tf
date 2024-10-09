terraform {
  required_providers {
    dsfhub = {
      source = "imperva/dsfhub"
    }
  }
}

resource "dsfhub_log_aggregator" "this" {
  server_type = "GCP PUBSUB"

  admin_email         = var.admin_email
  asset_display_name  = var.asset_display_name
  asset_id            = var.asset_id
  audit_pull_enabled  = var.audit_pull_enabled
  audit_type          = var.audit_type
  gateway_id          = var.gateway_id
  server_host_name    = "pubsub.googleapis.com"
  server_ip           = "pubsub.googleapis.com"
  server_port         = "443"

  asset_connection {
    auth_mechanism = var.auth_mechanism
    reason         = var.reason
    key_file       = var.auth_mechanism == "service_account" ? var.key_file : null
  }
}
