resource "google_sql_database_instance" "this" {
  database_version    = var.database_version
  deletion_protection = var.deletion_protection
  name                = var.name
  project             = var.project
  region              = var.region
  root_password       = var.root_password

  settings {
    tier = var.tier

    dynamic "database_flags" {
      for_each = var.database_flags != null ? var.database_flags : []

      content {
        name  = database_flags.value.name
        value = database_flags.value.value
      }
    }

    ip_configuration {
      dynamic "authorized_networks" {
        for_each = var.authorized_networks != null ? var.authorized_networks : []

        content {
          expiration_time = authorized_networks.value.expiration_time
          name            = authorized_networks.value.name
          value           = authorized_networks.value.value
        }
      }
    }

    dynamic "sql_server_audit_config" {
      for_each = var.sql_server_audit_config != null ? [0] : []

      content {
        bucket             = var.sql_server_audit_config.bucket
        upload_interval    = var.sql_server_audit_config.upload_interval
        retention_interval = var.sql_server_audit_config.retention_interval
      }
    }
  }
}
