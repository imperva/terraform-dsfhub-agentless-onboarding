terraform {
  required_providers {
    dsfhub = {
      source = "imperva/dsfhub"
    }
  }
}

resource "dsfhub_secret_manager" "this" {
  server_type = "HASHICORP"

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
      auth_mechanism = var.auth_mechanism
      reason         = "default"

      ### Required fields
      # role_name required for all but root_token auth_mechanism
      role_name = var.auth_mechanism != "root_token" ? var.role_name : null

      # secret_key required for all but ec2 auth_mechanism
      secret_key = var.auth_mechanism != "ec2" ? var.secret_key : null

      # iam_role auth_mechanism
      access_id         = var.auth_mechanism == "iam_role" ? var.access_id : null
      aws_iam_server_id = var.auth_mechanism == "iam_role" ? var.aws_iam_server_id : null

      ### Optional fields
      headers               = var.headers
      namespace             = var.namespace
      nonce                 = var.auth_mechanism != "ec2" ? var.nonce : null
      protocol              = var.protocol
      self_signed           = var.self_signed
      store_aws_credentials = var.store_aws_credentials
      ssl                   = var.ssl
      v2_key_engine         = var.v2_key_engine
    }
  }
}
