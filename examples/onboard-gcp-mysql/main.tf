locals {
  admin_email           = "test@example.com"
  gateway_id            = "a1b2c3d4-e5f6-g8h9-wxyz-123456790"
  pubsub_auth_mechanism = "default"

  gcp_mysql_instance_authorized_networks = [
    {
      name  = "local"
      value = "127.0.0.1"
    }
  ]
  gcp_project_id           = "my-gcp-project"
  gcp_service_account_name = "dsf-service-account"

  excluded_traffic_filter = [
    {
      name   = "exclude-internal-traffic"
      filter = "textPayload:\"[root]\" OR \"__google_connectivity_prober\""
    }
  ]
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

provider "dsfhub" {}

################################################################################
# Prerequisites
# 1. A service account with permissions to read from the PubSub subscription
# 2. A Google sink router, PubSub topic and subscription
################################################################################
module "service-account" {
  source = "../../modules/google-service-account-dsf"

  account_id     = local.gcp_service_account_name
  auth_mechanism = local.pubsub_auth_mechanism
  description    = "MySQL audit pull service account"
  project        = local.gcp_project_id
  project_roles = [
    "roles/pubsub.subscriber",
    "roles/pubsub.viewer"
  ]
}

module "gcp-pubsub-1" {
  source = "../../modules/onboard-gcp-pubsub"

  gcp_pubsub_admin_email    = local.admin_email
  gcp_pubsub_audit_type     = "MYSQL"
  gcp_pubsub_auth_mechanism = local.pubsub_auth_mechanism
  gcp_pubsub_gateway_id     = local.gateway_id

  project = local.gcp_project_id

  pubsub_subscription_name = "tf-mysql-sub-1"

  pubsub_topic_name = "tf-mysql-topic-1"

  sink_router_description = "MySQL 8.0 sink"
  sink_router_exclusions  = local.excluded_traffic_filter
  sink_router_filter      = <<EOF
    resource.type="cloudsql_database"
    resource.labels.database_id="${local.gcp_project_id}:tf-mysql-8"
    logName="projects/${local.gcp_project_id}/logs/cloudsql.googleapis.com%2Fmysql-general.log"
  EOF
  sink_router_name        = "tf-mysql-sink-1"
}

module "gcp-pubsub-2-audit" {
  source = "../../modules/onboard-gcp-pubsub"

  gcp_pubsub_admin_email    = local.admin_email
  gcp_pubsub_audit_type     = "MYSQL"
  gcp_pubsub_auth_mechanism = local.pubsub_auth_mechanism
  gcp_pubsub_gateway_id     = local.gateway_id

  project = local.gcp_project_id

  pubsub_subscription_name = "tf-mysql-sub-2-audit"

  pubsub_topic_name = "tf-mysql-topic-2-audit"

  sink_router_description = "MySQL 5.7 audit log sink"
  sink_router_exclusions  = local.excluded_traffic_filter
  sink_router_filter      = <<EOF
    resource.type="cloudsql_database"
    resource.labels.database_id="${local.gcp_project_id}:tf-mysql-5-7-slow-query"
    logName="projects/${local.gcp_project_id}/logs/cloudsql.googleapis.com%2Fmysql-general.log"
  EOF
  sink_router_name        = "tf-mysql-sink-2-audit"
}

module "gcp-pubsub-2-slow-query" {
  source = "../../modules/onboard-gcp-pubsub"

  gcp_pubsub_admin_email        = local.admin_email
  gcp_pubsub_audit_pull_enabled = true
  gcp_pubsub_audit_type         = "GCP_MYSQL_SLOW"
  gcp_pubsub_auth_mechanism     = local.pubsub_auth_mechanism
  gcp_pubsub_content_type       = "GCP MYSQL"
  gcp_pubsub_gateway_id         = local.gateway_id

  project = local.gcp_project_id

  pubsub_subscription_name = "tf-mysql-sub-2-slow-query"

  pubsub_topic_name = "tf-mysql-topic-2-slow-query"

  sink_router_description = "MySQL 5.7 slow query sink"
  sink_router_exclusions  = local.excluded_traffic_filter
  sink_router_filter      = <<EOF
    resource.type="cloudsql_database"
    resource.labels.database_id="${local.gcp_project_id}:tf-mysql-5-7-slow-query"
    logName="projects/${local.gcp_project_id}/logs/cloudsql.googleapis.com%2Fmysql-slow.log"
  EOF
  sink_router_name        = "tf-mysql-sink-2-slow-query"
}

module "gcp-pubsub-3" {
  source = "../../modules/onboard-gcp-pubsub"

  gcp_pubsub_admin_email    = local.admin_email
  gcp_pubsub_audit_type     = "MYSQL"
  gcp_pubsub_auth_mechanism = local.pubsub_auth_mechanism
  gcp_pubsub_gateway_id     = local.gateway_id

  project = local.gcp_project_id

  pubsub_subscription_name = "tf-mysql-sub-3"

  pubsub_topic_name = "tf-mysql-topic-3"

  sink_router_description = "MySQL 8.0 many-to-one sink"
  sink_router_exclusions  = local.excluded_traffic_filter
  sink_router_filter      = <<EOF
    resource.type="cloudsql_database"
    resource.labels.database_id="${local.gcp_project_id}:tf-mysql-dev" OR 
    resource.labels.database_id="${local.gcp_project_id}:tf-mysql-prod" OR 
    resource.labels.database_id="${local.gcp_project_id}:tf-mysql-uat"
    logName="projects/${local.gcp_project_id}/logs/cloudsql.googleapis.com%2Fmysql-general.log"
  EOF
  sink_router_name        = "tf-mysql-sink-3"
}

################################################################################
# GCP MySQL 8.0
################################################################################
module "gcp-mysql-1" {
  source = "../../modules/onboard-gcp-mysql"

  gcp_mysql_admin_email               = local.admin_email
  gcp_mysql_audit_pull_enabled        = true
  gcp_mysql_gateway_id                = local.gateway_id
  gcp_mysql_logs_destination_asset_id = module.gcp-pubsub-1.gcp-pubsub-asset.asset_id

  instance_authorized_networks = local.gcp_mysql_instance_authorized_networks
  instance_database_version    = "MYSQL_8_0"
  instance_name                = "tf-mysql-8"
  instance_region              = "us-west1"
}

################################################################################
# GCP MySQL 5.7 with slow query monitoring
################################################################################
module "gcp-mysql-2" {
  source = "../../modules/onboard-gcp-mysql"

  gcp_mysql_admin_email               = local.admin_email
  gcp_mysql_audit_pull_enabled        = true
  gcp_mysql_gateway_id                = local.gateway_id
  gcp_mysql_logs_destination_asset_id = module.gcp-pubsub-2-audit.gcp-pubsub-asset.asset_id

  instance_authorized_networks = local.gcp_mysql_instance_authorized_networks
  instance_database_version    = "MYSQL_5_7"
  instance_database_flags = [
    {
      "name" : "log_output",
      "value" : "FILE"
    },
    {
      "name" : "general_log",
      "value" : "on"
    },
    {
      "name" : "slow_query_log",
      "value" : "on"
    },
    {
      "name" : "long_query_time",
      "value" : "10"
    }
  ]
  instance_name   = "tf-mysql-5-7-slow-query"
  instance_region = "us-west1"
}

################################################################################
# GCP MySQL 8.0 Many-to-one
################################################################################
locals {
  mysql_types = toset([
    "dev",
    "prod",
    "uat"
  ])
}

module "gcp-mysql-3" {
  source = "../../modules/onboard-gcp-mysql"

  for_each = local.mysql_types

  gcp_mysql_admin_email               = local.admin_email
  gcp_mysql_audit_pull_enabled        = true
  gcp_mysql_gateway_id                = local.gateway_id
  gcp_mysql_logs_destination_asset_id = module.gcp-pubsub-3.gcp-pubsub-asset.asset_id

  instance_authorized_networks = local.gcp_mysql_instance_authorized_networks
  instance_database_version    = "MYSQL_8_0"
  instance_name                = "tf-mysql-${each.key}"
  instance_region              = "us-west1"
}
