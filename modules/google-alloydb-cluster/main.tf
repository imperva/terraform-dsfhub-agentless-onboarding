resource "google_alloydb_cluster" "this" {
  cluster_id                       = var.cluster_id
  cluster_type                     = var.cluster_type
  database_version                 = var.database_version
  display_name                     = var.display_name
  labels                           = var.labels
  location                         = var.location
  project                          = var.project
  skip_await_major_version_upgrade = var.skip_await_major_version_upgrade
  subscription_type                = var.subscription_type

  initial_user {
    password = var.password
    user     = var.user
  }

  network_config {
    allocated_ip_range = var.allocated_ip_range
    network            = var.network
  }

  dynamic "secondary_config" {
    for_each = var.primary_cluster_name != null ? [0] : []

    content {
      primary_cluster_name = var.primary_cluster_name
    }
  }
}
