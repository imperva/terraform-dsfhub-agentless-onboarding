terraform {
  required_providers {
    dsfhub = {
      source = "imperva/dsfhub"
    }
  }
}

resource "dsfhub_data_source" "this" {
  server_type = "AWS DYNAMODB"

  admin_email        = var.admin_email
  asset_display_name = var.asset_display_name
  asset_id           = var.asset_id
  arn                = var.auth_mechanism == "iam_role" ? var.iam_role_name : var.asset_id
  audit_pull_enabled = var.audit_pull_enabled
  audit_type         = var.audit_type
  available_regions  = var.available_regions
  gateway_id         = var.gateway_id
  parent_asset_id    = var.parent_asset_id
  region             = var.region
  server_host_name   = var.server_host_name
  server_ip          = var.server_host_name
  server_port        = var.server_port

  dynamic "asset_connection" {
    # If auth_mechanism is not defined, do not create a connection
    for_each = var.auth_mechanism != null ? [0] : []

    content {
      auth_mechanism = var.auth_mechanism
      username       = var.auth_mechanism == "profile" ? var.username : null
      access_id      = var.auth_mechanism == "key" ? var.access_id : null
      secret_key     = var.auth_mechanism == "key" ? var.secret_key : null
      reason         = "default"
      region         = var.region
    }
  }
}
