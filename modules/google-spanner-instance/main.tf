resource "google_spanner_instance" "this" {
  name         = var.name
  config       = var.config
  display_name = var.display_name
}
