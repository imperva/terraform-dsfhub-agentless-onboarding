resource "google_pubsub_subscription" "this" {
  message_retention_duration = var.message_retention_duration
  name                       = var.name
  project                    = var.project
  retain_acked_messages      = var.retain_acked_messages
  topic                      = var.topic
}
