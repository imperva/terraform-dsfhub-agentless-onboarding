resource "google_pubsub_topic" "this" {
  name                       = var.name
  project                    = var.project
}
