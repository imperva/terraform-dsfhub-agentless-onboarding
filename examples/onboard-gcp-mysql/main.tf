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
# 2. A Google sink router, PubSub topic and subscription (handled below)
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

################################################################################
# GCP MySQL 8.0
################################################################################
locals {
  gcp_mysql_1_instance_name = "tf-mysql-8"
}

module "gcp-pubsub-1" {
  source = "../../modules/onboard-gcp-pubsub"

  gcp_pubsub_admin_email    = local.admin_email
  gcp_pubsub_audit_type     = "MYSQL"
  gcp_pubsub_auth_mechanism = local.pubsub_auth_mechanism
  gcp_pubsub_gateway_id     = local.gateway_id

  project = local.gcp_project_id

  pubsub_subscription_name = "${local.gcp_mysql_1_instance_name}-sub"

  pubsub_topic_name = "${local.gcp_mysql_1_instance_name}-topic"

  sink_router_description = "MySQL 8.0 sink"
  sink_router_exclusions  = local.excluded_traffic_filter
  sink_router_filter      = <<EOF
    resource.type="cloudsql_database"
    resource.labels.database_id="${local.gcp_project_id}:${local.gcp_mysql_1_instance_name}"
    logName="projects/${local.gcp_project_id}/logs/cloudsql.googleapis.com%2Fmysql-general.log"
  EOF
  sink_router_name        = "${local.gcp_mysql_1_instance_name}-sink"
}

module "gcp-mysql-1" {
  source = "../../modules/onboard-gcp-mysql"

  gcp_mysql_admin_email               = local.admin_email
  gcp_mysql_audit_pull_enabled        = true
  gcp_mysql_gateway_id                = local.gateway_id
  gcp_mysql_logs_destination_asset_id = module.gcp-pubsub-1.gcp-pubsub-asset.asset_id

  instance_authorized_networks = local.gcp_mysql_instance_authorized_networks
  instance_database_version    = "MYSQL_8_0"
  instance_name                = local.gcp_mysql_1_instance_name
  instance_region              = "us-west1"
}

################################################################################
# GCP MySQL 5.7 with slow query monitoring
#
# Notes:
# The Pubsub containing audit data will be associated with the GCP MySQL asset
# via the "logs_destination_asset_id" and will get connected to gateway when the
# database asset does.
# 
# The Pubsub containing slow query data will be treated as a "standalone" pubsub
# and will get connected to gateway by setting the "audit_pull_enabled" field to
# true directly on the asset. It utilizes the "content_type" field to indicate
# that the data within the pubsub is coming from a GCP MySQL instance.
################################################################################
locals {
  gcp_mysql_2_instance_name = "tf-mysql-5-7-slow-query"
}

module "gcp-pubsub-2-audit" {
  source = "../../modules/onboard-gcp-pubsub"

  gcp_pubsub_admin_email    = local.admin_email
  gcp_pubsub_audit_type     = "MYSQL"
  gcp_pubsub_auth_mechanism = local.pubsub_auth_mechanism
  gcp_pubsub_gateway_id     = local.gateway_id

  project = local.gcp_project_id

  pubsub_subscription_name = "${local.gcp_mysql_2_instance_name}-audit-sub"

  pubsub_topic_name = "${local.gcp_mysql_2_instance_name}-audit-topic"

  sink_router_description = "MySQL 5.7 audit log sink"
  sink_router_exclusions  = local.excluded_traffic_filter
  sink_router_filter      = <<EOF
    resource.type="cloudsql_database"
    resource.labels.database_id="${local.gcp_project_id}:${local.gcp_mysql_2_instance_name}"
    logName="projects/${local.gcp_project_id}/logs/cloudsql.googleapis.com%2Fmysql-general.log"
  EOF
  sink_router_name        = "${local.gcp_mysql_2_instance_name}-audit-sink"
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

  pubsub_subscription_name = "${local.gcp_mysql_2_instance_name}-slow-query-sub"

  pubsub_topic_name = "${local.gcp_mysql_2_instance_name}-slow-query-topic"

  sink_router_description = "MySQL 5.7 slow query sink"
  sink_router_exclusions  = local.excluded_traffic_filter
  sink_router_filter      = <<EOF
    resource.type="cloudsql_database"
    resource.labels.database_id="${local.gcp_project_id}:${local.gcp_mysql_2_instance_name}"
    logName="projects/${local.gcp_project_id}/logs/cloudsql.googleapis.com%2Fmysql-slow.log"
  EOF
  sink_router_name        = "${local.gcp_mysql_2_instance_name}-slow-query-sink"
}

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
  instance_name   = local.gcp_mysql_2_instance_name
  instance_region = "us-west1"
}

################################################################################
# GCP MySQL 8.0 Many-to-one
################################################################################
locals {
  gcp_mysql_3_instance_name_prefix = "tf-mysql-multi"
  gcp_mysql_3_instance_types = toset([
    "dev",
    "prod",
    "uat",
  ])

  # Build instance names
  gcp_mysql_3_instance_names = toset([
    for i, type in local.gcp_mysql_3_instance_types : "${local.gcp_mysql_3_instance_name_prefix}-${type}"
  ])

  # Build database IDs
  gcp_mysql_3_database_ids = [
    for i, name in local.gcp_mysql_3_instance_names : "\"${local.gcp_project_id}:${name}\""
  ]

  # Build sink filter
  gcp_mysql_3_filter = join(
    "",
    [
      "resource.type=\"cloudsql_database\"\n",
      "logName=\"projects/${local.gcp_project_id}/logs/cloudsql.googleapis.com%2Fmysql-general.log\"\n",
      "resource.labels.database_id=(",
      join(
        " OR ",
        local.gcp_mysql_3_database_ids
      ),
      ")",
    ]
  )
}

module "gcp-pubsub-3" {
  source = "../../modules/onboard-gcp-pubsub"

  gcp_pubsub_admin_email    = local.admin_email
  gcp_pubsub_audit_type     = "MYSQL"
  gcp_pubsub_auth_mechanism = local.pubsub_auth_mechanism
  gcp_pubsub_gateway_id     = local.gateway_id

  project = local.gcp_project_id

  pubsub_subscription_name = "${local.gcp_mysql_3_instance_name_prefix}-sub"

  pubsub_topic_name = "${local.gcp_mysql_3_instance_name_prefix}-topic"

  sink_router_description = "MySQL 8.0 many-to-one sink"
  sink_router_exclusions  = local.excluded_traffic_filter
  sink_router_filter      = local.gcp_mysql_3_filter
  sink_router_name        = "${local.gcp_mysql_3_instance_name_prefix}-sink"
}

module "gcp-mysql-3" {
  source = "../../modules/onboard-gcp-mysql"

  for_each = local.gcp_mysql_3_instance_names

  gcp_mysql_admin_email               = local.admin_email
  gcp_mysql_audit_pull_enabled        = true
  gcp_mysql_gateway_id                = local.gateway_id
  gcp_mysql_logs_destination_asset_id = module.gcp-pubsub-3.gcp-pubsub-asset.asset_id

  instance_authorized_networks = local.gcp_mysql_instance_authorized_networks
  instance_database_version    = "MYSQL_8_0"
  instance_name                = each.key
  instance_region              = "us-west1"
}
