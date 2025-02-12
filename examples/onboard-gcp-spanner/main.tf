locals {
  admin_email           = "test@example.com"
  gateway_id            = "a1b2c3d4-e5f6-g8h9-wxyz-123456790"
  pubsub_auth_mechanism = "default"

  gcp_project_id           = "my-gcp-project"
  gcp_service_account_name = "dsf-service-account"
  gcp_spanner_config       = "us-west1"

  pubsub_subscription_name = "tf-spanner-sub"
  pubsub_topic_name        = "tf-spanner-topic"
  sink_router_name         = "tf-spanner-sink"
}

################################################################################
# Providers
################################################################################
terraform {
  required_providers {
    dsfhub = {
      source = "imperva/dsfhub"
    }
  }
}

provider "google" {
  # Authenticated via "gcloud" CLI
  project = local.gcp_project_id
}

variable "dsfhub_host" {}  # TF_VAR_dsfhub_host env variable
variable "dsfhub_token" {} # TF_VAR_dsfhub_token env variable

provider "dsfhub" {
  dsfhub_host  = var.dsfhub_host
  dsfhub_token = var.dsfhub_token
}

################################################################################
# Prerequisites
# 1. A service account with permissions to read from the PubSub subscription
# 2. A Google sink router, PubSub topic and subscription
################################################################################
module "service-account" {
  source = "../../modules/google-service-account-dsf"

  account_id     = local.gcp_service_account_name
  auth_mechanism = local.pubsub_auth_mechanism
  description    = "Spanner audit pull service account"
  project        = local.gcp_project_id
  project_roles = [
    "roles/pubsub.subscriber",
    "roles/pubsub.viewer"
  ]
}

module "gcp-pubsub" {
  source = "../../modules/onboard-gcp-pubsub"

  gcp_pubsub_admin_email    = local.admin_email
  gcp_pubsub_audit_type     = "SPANNER"
  gcp_pubsub_auth_mechanism = local.pubsub_auth_mechanism
  gcp_pubsub_gateway_id     = local.gateway_id

  project = local.gcp_project_id

  pubsub_subscription_name = local.pubsub_subscription_name

  pubsub_topic_name = local.pubsub_topic_name

  sink_router_description = "Spanner sink"
  sink_router_exclusions  = null
  sink_router_filter      = <<EOF
    resource.type="spanner_instance"
  EOF
  sink_router_name        = local.sink_router_name
}

################################################################################
# GCP Spanner
################################################################################
module "gcp-spanner-1" {
  source = "../../modules/onboard-gcp-spanner"

  gcp_spanner_admin_email               = local.admin_email
  gcp_spanner_audit_pull_enabled        = true
  gcp_spanner_gateway_id                = local.gateway_id
  gcp_spanner_logs_destination_asset_id = module.gcp-pubsub.gcp-pubsub-asset.asset_id

  instance_name   = "my-spanner-instance"
  instance_config = local.gcp_spanner_config
}

################################################################################
# GCP Spanner with Slow Query
################################################################################
module "gcp-spanner-2" {
  source = "../../modules/onboard-gcp-spanner"

  gcp_spanner_admin_email               = local.admin_email
  gcp_spanner_audit_pull_enabled        = true
  gcp_spanner_duration_threshold        = "1000" # seconds
  gcp_spanner_gateway_id                = local.gateway_id
  gcp_spanner_logs_destination_asset_id = module.gcp-pubsub.gcp-pubsub-asset.asset_id

  instance_name   = "my-spanner-slow-query-instance"
  instance_config = local.gcp_spanner_config
}
