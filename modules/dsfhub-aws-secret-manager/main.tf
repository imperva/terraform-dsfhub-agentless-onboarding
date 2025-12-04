terraform {
  required_providers {
    dsfhub = {
      source  = "imperva/dsfhub"
      version = ">= 1.4.0"
    }
  }
}

resource "dsfhub_secret_manager" "this" {
  server_type = "AWS"

  admin_email          = var.admin_email
  asset_display_name   = var.asset_display_name
  asset_id             = var.asset_id
  available_regions    = var.available_regions
  credentials_endpoint = var.credentials_endpoint
  gateway_id           = var.gateway_id
  proxy                = var.proxy

  aws_proxy_config {
    http  = var.http
    https = var.https
  }

  service_endpoints {
    logs = var.logs
  }

  dynamic "asset_connection" {
    # If auth_mechanism is not defined, do not create a connection
    for_each = var.auth_mechanism != null ? [0] : []

    content {
      auth_mechanism = var.auth_mechanism
      reason         = "default"
      region         = var.region

      # Optional parameters
      access_id     = var.auth_mechanism == "key" ? var.access_id : null
      ca_certs_path = var.ca_certs_path
      external_id   = var.auth_mechanism == "iam_role" ? var.external_id : null
      secret_key    = var.auth_mechanism == "key" ? var.secret_key : null
      session_token = var.auth_mechanism == "key" ? var.session_token : null
      ssl           = var.ssl
      username      = var.auth_mechanism == "profile" ? var.profile_name : null
    }
  }
}
