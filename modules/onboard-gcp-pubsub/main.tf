terraform {
  required_providers {
    dsfhub = {
      source = "imperva/dsfhub"
    }
  }
}

# Pubsub topic
module "pubsub-topic" {
  source = "../google-pubsub-topic"

  name    = var.pubsub_topic_name
  project = var.project
}

# Pubsub subscription
module "pubsub-subscription" {
  source = "../google-pubsub-subscription"

  message_retention_duration = var.pubsub_subscription_message_retention_duration
  name                       = var.pubsub_subscription_name
  project                    = var.project
  retain_acked_messages      = var.pubsub_subscription_retain_acked_messages
  topic                      = module.pubsub-topic.this.id
}

# Logging sink router
module "sink-router" {
  source = "../google-logging-project-sink"

  description     = var.sink_router_description
  exclusions      = var.sink_router_exclusions
  filter          = var.sink_router_filter
  name            = var.sink_router_name
  project         = var.project
  pubsub_topic_id = module.pubsub-topic.this.id
}

# Allow sink service account to write to topic
resource "google_pubsub_topic_iam_binding" "topic_binding" {
  members = [module.sink-router.this.writer_identity]
  project = var.project
  role    = "roles/pubsub.publisher"
  topic   = module.pubsub-topic.this.name
}

# GCP PUBSUB asset
module "gcp-pubsub-asset" {
  source = "../dsfhub-gcp-pubsub"

  admin_email         = var.gcp_pubsub_admin_email
  asset_display_name  = module.pubsub-subscription.this.name
  asset_id            = module.pubsub-subscription.this.id
  audit_pull_enabled  = var.gcp_pubsub_audit_pull_enabled
  audit_type          = var.gcp_pubsub_audit_type
  auth_mechanism      = var.gcp_pubsub_auth_mechanism
  content_type        = var.gcp_pubsub_content_type
  gateway_id          = var.gcp_pubsub_gateway_id
  key_file            = var.gcp_pubsub_key_file
  pubsub_subscription = module.pubsub-subscription.this.id
  reason              = var.gcp_pubsub_reason
}
