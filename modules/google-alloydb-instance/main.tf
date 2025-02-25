resource "google_alloydb_instance" "this" {
  cluster        = var.cluster
  database_flags = var.database_flags
  display_name   = var.display_name
  instance_id    = var.instance_id
  instance_type  = var.instance_type
  labels         = var.labels

  #   network_config {
  #     allocated_ip_range = var.allocated_ip_range
  #     network            = var.network
  #   }
}
