resource "google_logging_project_sink" "this" {
  description = var.description
  destination = "pubsub.googleapis.com/${var.pubsub_topic_id}"
  filter      = var.filter
  name        = var.name
  project     = var.project

  dynamic "exclusions" {
    # If exclusions is not defined, do not create
    for_each = var.exclusions != null ? [0] : []

    content {
      description = exclusions.value.description
      filter      = exclusions.value.filter
      name        = exclusions.value.name
    }
  }
}
