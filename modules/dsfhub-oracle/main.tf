terraform {
  required_providers {
    dsfhub = {
      source  = "imperva/dsfhub"
      version = ">= 1.4.0"
    }
  }
}

resource "dsfhub_data_source" "this" {
  server_type = "ORACLE"

  admin_email          = var.admin_email
  application          = var.application
  asset_display_name   = var.asset_display_name
  asset_id             = var.asset_id
  asset_version        = var.asset_version
  audit_pull_enabled   = var.audit_pull_enabled
  audit_type           = var.audit_type
  gateway_id           = var.gateway_id
  host_timezone_offset = var.host_timezone_offset
  marker_alias         = var.marker_alias
  max_concurrent_conn  = var.max_concurrent_conn
  region               = var.region
  server_host_name     = var.server_host_name
  server_ip            = var.server_ip
  server_port          = var.server_port
  service_name         = var.service_name

  dynamic "asset_connection" {
    # If auth_mechanism is not defined, do not create a connection
    for_each = var.auth_mechanism != null ? [0] : []

    content {
      auth_mechanism         = var.auth_mechanism
      autocommit             = var.auth_mechanism != null ? var.autocommit : null
      db_role                = var.auth_mechanism != null ? var.db_role : null
      driver                 = var.auth_mechanism != null ? var.driver : null
      net_service_name       = var.auth_mechanism != null ? var.net_service_name : null
      odbc_connection_string = var.auth_mechanism != null ? var.odbc_connection_string : null
      reason                 = var.auth_mechanism != null ? "default" : null
      sid                    = var.auth_mechanism != null ? var.sid : null
      ssl                    = var.auth_mechanism != null ? var.ssl : null
      ssl_server_cert        = var.auth_mechanism != null ? var.ssl_server_cert : null

      # required for password and oracle_wallet auth mechanisms
      username = var.auth_mechanism != null ? var.username : null
      password = var.auth_mechanism != null ? var.password : null

      # optional kerberos auth mechanism connection parameters
      cache_file             = var.auth_mechanism == "kerberos" ? var.cache_file : null
      external               = var.auth_mechanism == "kerberos" ? var.external : null
      extra_kinit_parameters = var.auth_mechanism == "kerberos" ? var.extra_kinit_parameters : null
      kerberos_kdc           = var.auth_mechanism == "kerberos" ? var.kerberos_kdc : null
      kerberos_service_kdc   = var.auth_mechanism == "kerberos" ? var.kerberos_service_kdc : null
      kerberos_service_realm = var.auth_mechanism == "kerberos" ? var.kerberos_service_realm : null
      kerberos_spn           = var.auth_mechanism == "kerberos" ? var.kerberos_spn : null
      keytab_file            = var.auth_mechanism == "kerberos" ? var.keytab_file : null
      kinit_program_path     = var.auth_mechanism == "kerberos" ? var.kinit_program_path : null
      principal              = var.auth_mechanism == "kerberos" ? var.principal : null
      use_keytab             = var.auth_mechanism == "kerberos" ? var.use_keytab : null

      # optional oracle_wallet auth mechanism connection parameters
      wallet_dir = var.auth_mechanism == "oracle_wallet" ? var.wallet_dir : null
      dn         = var.auth_mechanism == "oracle_wallet" ? var.dn : null
      dsn        = var.auth_mechanism == "oracle_wallet" ? var.dsn : null

      dynamic "amazon_secret" {
        for_each = var.secret_type == "amazon" ? [1] : []

        content {
          secret_asset_id = var.secret_asset_id
          secret_name     = var.secret_name
          field_mapping   = var.secret_field_mapping
        }
      }

      dynamic "cyberark_secret" {
        for_each = var.secret_type == "cyberark" ? [1] : []

        content {
          secret_asset_id = var.secret_asset_id
          secret_name     = var.secret_name
          field_mapping   = var.secret_field_mapping
        }
      }

      dynamic "hashicorp_secret" {
        for_each = var.secret_type == "hashicorp" ? [1] : []

        content {
          path            = var.path
          secret_asset_id = var.secret_asset_id
          secret_name     = var.secret_name
          field_mapping   = var.secret_field_mapping
        }
      }
    }
  }
}
