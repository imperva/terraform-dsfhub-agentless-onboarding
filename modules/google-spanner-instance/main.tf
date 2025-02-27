resource "google_spanner_instance" "this" {
  config           = var.config
  display_name     = var.display_name
  edition          = var.edition
  labels           = var.labels
  name             = var.name
  num_nodes        = var.num_nodes
  processing_units = var.processing_units
  project          = var.project
}
