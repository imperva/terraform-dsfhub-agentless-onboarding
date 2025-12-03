locals {
  gcp_project_id           = "my-gcp-project"
  pubsub_subscription_name = "tf-bigquery-sub"
  pubsub_topic_name        = "tf-bigquery-topic"
  service_account_name     = "dsf-service-account"
  sink_router_name         = "tf-bigquery-sink"

  admin_email    = "test@example.com"
  auth_mechanism = "default"
  gateway_id     = "a1b2c3d4-e5f6-g8h9-wxyz-123456790"
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

  account_id     = local.service_account_name
  auth_mechanism = local.auth_mechanism
  description    = "BigQuery audit pull service account"
  project        = local.gcp_project_id
  project_roles = [
    "roles/pubsub.subscriber",
    "roles/pubsub.viewer"
  ]
}

################################################################################
# GCP BigQuery
################################################################################
module "gcp-pubsub-1" {
  source = "../../modules/onboard-gcp-pubsub"

  gcp_pubsub_admin_email    = local.admin_email
  gcp_pubsub_audit_type     = "BIGQUERY"
  gcp_pubsub_auth_mechanism = local.auth_mechanism
  gcp_pubsub_gateway_id     = local.gateway_id

  project = local.gcp_project_id

  pubsub_subscription_name = local.pubsub_subscription_name

  pubsub_topic_name = local.pubsub_topic_name

  sink_router_description = "BigQuery sink"
  sink_router_exclusions  = null
  sink_router_filter      = <<EOF
    resource.type="bigquery_resource"
  EOF
  sink_router_name        = local.sink_router_name
}

module "gcp-bigquery-1" {
  source = "../../modules/dsfhub-gcp-bigquery"

  admin_email               = local.admin_email
  asset_display_name        = "projects/${local.gcp_project_id}"
  asset_id                  = "projects/${local.gcp_project_id}"
  audit_pull_enabled        = true
  gateway_id                = local.gateway_id
  logs_destination_asset_id = module.gcp-pubsub-1.gcp-pubsub-asset.asset_id
  pubsub_subscription       = module.gcp-pubsub-1.gcp-pubsub-asset.asset_id
}

################################################################################
# GCP BigQuery with Slow Query monitoring
################################################################################
module "gcp-pubsub-2" {
  source = "../../modules/onboard-gcp-pubsub"

  gcp_pubsub_admin_email    = local.admin_email
  gcp_pubsub_audit_type     = "BIGQUERY"
  gcp_pubsub_auth_mechanism = "service_account"
  gcp_pubsub_gateway_id     = local.gateway_id
  gcp_pubsub_key_file       = "/path/to/JSONAR_LOCALDIR/credentials/service-account-private-key.json"

  project = local.gcp_project_id

  pubsub_subscription_name = "${local.pubsub_subscription_name}-slow"

  pubsub_topic_name = "${local.pubsub_topic_name}-slow"

  sink_router_description = "BigQuery sink with slow query monitoring"
  sink_router_exclusions  = null
  sink_router_filter      = <<EOF
    resource.type="bigquery_resource"
  EOF
  sink_router_name        = "${local.sink_router_name}-slow"
}

module "gcp-bigquery-2" {
  source = "../../modules/dsfhub-gcp-bigquery"

  admin_email               = local.admin_email
  asset_display_name        = "projects/${local.gcp_project_id}"
  asset_id                  = "projects/${local.gcp_project_id}"
  audit_pull_enabled        = true
  duration_threshold        = 1 # milliseconds
  gateway_id                = local.gateway_id
  logs_destination_asset_id = module.gcp-pubsub-2.gcp-pubsub-asset.asset_id
  pubsub_subscription       = module.gcp-pubsub-2.gcp-pubsub-asset.asset_id
}
