terraform {
  required_providers {
    dsfhub = {
      source = "imperva/dsfhub"
    }
  }
}

resource "dsfhub_cloud_account" "aws" {
  server_type = "AWS"

  admin_email        = var.admin_email
  asset_display_name = var.asset_display_name
  asset_id           = var.asset_id
  gateway_id         = var.gateway_id

  asset_connection {
    auth_mechanism = var.auth_mechanism
    username       = var.auth_mechanism == "profile" ? var.profile_name : null
    access_id      = var.auth_mechanism == "key" ? var.aws_access_key : null
    secret_key     = var.auth_mechanism == "key" ? var.aws_secret_key : null
    reason         = "default"
    region         = var.region
  }
}
