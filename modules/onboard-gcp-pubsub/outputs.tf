output "pubsub-topic" {
  description = "Google PubSub Topic."
  value = module.pubsub-topic.this
}

output "pubsub-subscription" {
  description = "Google PubSub Subscription."
  value = module.pubsub-subscription.this
}

output "sink-router" {
  description = "Google Log Router."
  value = module.sink-router.this
}

output "topic-binding" {
  description = "Google PubSub Topic IAM Binding."
  value = google_pubsub_topic_iam_binding.topic_binding
}

output "gcp-pubsub-asset" {
  description = "GCP PUBSUB asset."
  value = module.gcp-pubsub-asset.this
}
