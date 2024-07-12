terraform {
  required_providers {
    dsfhub = {
      source  = "imperva/dsfhub"
      version = ">= 1.2.46"
    }
  }
}

resource "dsfhub_data_source" "this" {
  server_type = "AWS REDSHIFT"

  admin_email               = var.admin_email
  asset_display_name        = var.asset_display_name
  asset_id                  = var.asset_id
  audit_pull_enabled        = var.audit_pull_enabled
  audit_type                = var.audit_type
  bucket_account_id         = var.bucket_account_id
  database_name             = var.database_name
  gateway_id                = var.gateway_id
  logs_destination_asset_id = var.logs_destination_asset_id
  parent_asset_id           = var.parent_asset_id
  region                    = var.region
  server_host_name          = var.server_host_name
  server_ip                 = var.server_ip
  server_port               = var.server_port
  service_name              = var.service_name

  dynamic "asset_connection" {
    # If auth_mechanism is not defined, do not create a connection
    for_each = var.auth_mechanism != null ? [0] : []

    content {
      auth_mechanism = var.auth_mechanism
      reason         = "sonargateway"

      username      = var.auth_mechanism == "password" ? var.username : null
      password      = var.auth_mechanism == "password" ? var.password : null
      database_name = var.auth_mechanism == "password" ? var.database_name : null
      ssl           = var.auth_mechanism == "password" ? var.ssl : null

      access_id         = var.auth_mechanism == "aws_credentials" ? var.access_id : null
      aws_connection_id = var.auth_mechanism == "aws_credentials" ? var.aws_connection_id : null
      tmp_user          = var.auth_mechanism == "aws_credentials" ? var.tmp_user : null
    }
  }
}
