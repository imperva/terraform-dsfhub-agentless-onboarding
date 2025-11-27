terraform {
  required_providers {
    dsfhub = {
      source  = "imperva/dsfhub"
      version = ">= 1.3.8"
    }
  }
}

resource "dsfhub_log_aggregator" "this" {
  server_type = "ALIBABA LOGSTORE"

  admin_email            = var.admin_email
  asset_display_name     = var.asset_display_name
  asset_id               = var.asset_id
  audit_data_type        = var.audit_data_type
  audit_pull_enabled     = var.audit_pull_enabled
  audit_type             = var.audit_type
  consumer_group         = var.consumer_group
  consumer_group_workers = var.consumer_group_workers
  consumer_worker_prefix = var.consumer_worker_prefix
  content_type           = var.content_type
  endpoint               = var.endpoint
  gateway_id             = var.gateway_id
  logstore               = var.logstore
  project                = var.project
  parent_asset_id        = var.parent_asset_id
  pull_type              = var.pull_type
  region                 = var.region

  asset_connection {
    auth_mechanism = "default"
    reason         = "default"
  }
}
