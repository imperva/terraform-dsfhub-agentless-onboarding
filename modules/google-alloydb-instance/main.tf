resource "google_alloydb_instance" "this" {
  cluster        = var.cluster
  database_flags = var.database_flags
  display_name   = var.display_name
  instance_id    = var.instance_id
  instance_type  = var.instance_type
  labels         = var.labels

  dynamic "client_connection_config" {
    for_each = var.ssl_mode != null ? [0] : []

    content {
      ssl_config {
        ssl_mode = var.ssl_mode
      }
    }
  }

  network_config {
    authorized_external_networks {
      cidr_range = var.cidr_range
    }
    enable_outbound_public_ip = var.enable_outbound_public_ip
    enable_public_ip          = var.enable_public_ip
  }

  read_pool_config {
    node_count = var.node_count
  }
}
