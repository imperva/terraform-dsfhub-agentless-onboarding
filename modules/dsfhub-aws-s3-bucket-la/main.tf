terraform {
  required_providers {
    dsfhub = {
      source  = "imperva/dsfhub"
      version = ">= 1.3.7"
    }
  }
}

resource "dsfhub_log_aggregator" "this" {
  server_type = "AWS S3"

  admin_email                  = var.admin_email
  arn                          = var.arn
  asset_display_name           = var.asset_display_name
  asset_id                     = var.asset_id
  audit_pull_enabled           = var.audit_pull_enabled
  audit_type                   = var.audit_type
  available_bucket_account_ids = var.available_bucket_account_ids
  available_regions            = var.available_regions
  bucket_account_id            = var.bucket_account_id
  gateway_id                   = var.gateway_id
  parent_asset_id              = var.parent_asset_id
  region                       = var.region
  server_host_name             = var.server_host_name
  server_port                  = var.server_port
  s3_provider                  = var.s3_provider

  asset_connection {
    auth_mechanism = "default"
    reason         = "default"
  }
}
