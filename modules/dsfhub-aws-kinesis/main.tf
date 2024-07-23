terraform {
  required_providers {
    dsfhub = {
      source = "imperva/dsfhub"
    }
  }
}

resource "dsfhub_log_aggregator" "this" {
  server_type = "AWS KINESIS"

  admin_email        = var.admin_email
  asset_display_name = var.asset_display_name
  asset_id           = var.asset_id
  audit_pull_enabled = var.audit_pull_enabled
  audit_type         = var.audit_type
  gateway_id         = var.gateway_id
  parent_asset_id    = var.parent_asset_id

  asset_connection {
    auth_mechanism = "default"

    reason = var.reason
    region = var.region

  }
}
