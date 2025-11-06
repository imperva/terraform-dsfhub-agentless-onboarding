resource "google_spanner_instance" "this" {
  config                       = var.config
  default_backup_schedule_type = var.default_backup_schedule_type
  display_name                 = var.display_name
  edition                      = var.edition
  force_destroy                = var.force_destroy
  labels                       = var.labels
  name                         = var.name
  num_nodes                    = var.num_nodes
  processing_units             = var.processing_units
  project                      = var.project
}
