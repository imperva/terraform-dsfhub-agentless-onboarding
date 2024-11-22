resource "google_storage_bucket" "this" {
  force_destroy = var.force_destroy
  location      = var.location
  name          = var.name
  project       = var.project
  storage_class = var.storage_class
}
