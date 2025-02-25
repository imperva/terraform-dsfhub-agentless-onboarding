resource "google_alloydb_cluster" "this" {
  cluster_id       = var.cluster_id
  cluster_type     = var.cluster_type
  database_version = var.database_version
  display_name     = var.display_name
  initial_user {
    password = var.password
    user     = var.user
  }
  labels   = var.labels
  location = var.location
  #   network_config {
  #     allocated_ip_range = var.allocated_ip_range
  #     network            = var.network
  #   }
  project           = var.project
  subscription_type = var.subscription_type
}
