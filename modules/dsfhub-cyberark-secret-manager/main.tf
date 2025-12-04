terraform {
  required_providers {
    dsfhub = {
      source  = "imperva/dsfhub"
      version = ">= 1.4.0"
    }
  }
}

resource "dsfhub_secret_manager" "this" {
  server_type = "CYBERARK"

  admin_email        = var.admin_email
  asset_display_name = var.asset_display_name
  asset_id           = var.asset_id
  gateway_id         = var.gateway_id
  server_host_name   = var.server_host_name
  server_ip          = var.server_ip
  server_port        = var.server_port

  dynamic "asset_connection" {
    # If auth_mechanism is not defined, do not create a connection
    for_each = var.auth_mechanism != null ? [0] : []

    content {
      auth_mechanism = "default"
      query          = var.query
      reason         = "default"

      # Optional parameters
      ca_certs_path = var.ca_certs_path
      cert_file     = var.cert_file
      key_file      = var.key_file
      protocol      = var.protocol
      self_signed   = var.self_signed
      ssl           = var.ssl
    }
  }
}
