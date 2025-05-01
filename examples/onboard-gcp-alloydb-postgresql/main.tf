locals {
  admin_email           = "test@example.com"
  gateway_id            = "a1b2c3d4-e5f6-g8h9-wxyz-123456790"
  pubsub_auth_mechanism = "service_account"

  gcp_project_id           = "my-gcp-project"
  gcp_network              = "default"
  gcp_service_account_name = "dsf-service-account"

  pubsub_subscription_name = "tf-alloydb-sub"
  pubsub_topic_name        = "tf-alloydb-topic"
  sink_router_name         = "tf-alloydb-sink"

  cluster_id       = "my-alloydb-postgresql-cluster"
  cluster_location = "us-west1"

  user     = "postgres"
  password = "@S3cureP@ssw0rd"
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

variable "dsfhub_host" {}
variable "dsfhub_token" {}

provider "dsfhub" {
  dsfhub_host  = var.dsfhub_host
  dsfhub_token = var.dsfhub_token
}

data "http" "my-ip" {
  url = "http://icanhazip.com"
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
  description    = "AlloyDB audit pull service account"
  project        = local.gcp_project_id
  project_roles = [
    "roles/pubsub.subscriber",
    "roles/pubsub.viewer"
  ]
}


resource "terraform_data" "configure_database_1" {
  depends_on = [module.gcp-alloydb-postgresql-1]

  provisioner "local-exec" {

    environment = {
      PGHOST     = module.gcp-alloydb-postgresql-1.gcp-alloydb-primary-instance.public_ip_address
      PGUSER     = local.user
      PGPASSWORD = local.password
      PGPORT     = "5432"
      PGDATABASE = "postgres"
    }

    command = "./configure_database.sh"

    on_failure = fail
  }
}

# One-to-one monitoring
module "gcp-pubsub-one-to-one" {
  source = "../../modules/onboard-gcp-pubsub"

  gcp_pubsub_admin_email    = local.admin_email
  gcp_pubsub_audit_type     = "ALLOYDB_POSTGRESQL"
  gcp_pubsub_auth_mechanism = local.pubsub_auth_mechanism
  gcp_pubsub_gateway_id     = local.gateway_id
  gcp_pubsub_key_file       = "/path/to/JSONAR_LOCALDIR/credentials/service-account-private-key.json"

  project = local.gcp_project_id

  pubsub_subscription_name = local.pubsub_subscription_name

  pubsub_topic_name = local.pubsub_topic_name

  sink_router_description = "AlloyDB for PostgreSQL sink"
  sink_router_exclusions  = null
  sink_router_filter      = <<EOF
    resource.labels.cluster_id="${local.cluster_id}" AND
    logName=(
      "projects/${local.gcp_project_id}/logs/cloudaudit.googleapis.com%2Fdata_access" OR
      "projects/${local.gcp_project_id}/logs/cloudsql.googleapis.com%2Fpostgres.log"
    )
  EOF
  sink_router_name        = local.sink_router_name
}

################################################################################
# GCP AlloyDB for PostgreSQL with one-to-one monitoring
################################################################################
module "gcp-alloydb-postgresql-1" {
  source = "../../modules/onboard-gcp-alloydb-postgresql"

  gcp_alloydb_postgresql_cluster_admin_email               = local.admin_email
  gcp_alloydb_postgresql_cluster_audit_pull_enabled        = true
  gcp_alloydb_postgresql_cluster_gateway_id                = local.gateway_id
  gcp_alloydb_postgresql_cluster_logs_destination_asset_id = module.gcp-pubsub-one-to-one.gcp-pubsub-asset.asset_id

  gcp_alloydb_postgresql_admin_email               = local.admin_email
  gcp_alloydb_postgresql_audit_pull_enabled        = true
  gcp_alloydb_postgresql_gateway_id                = local.gateway_id
  gcp_alloydb_postgresql_logs_destination_asset_id = module.gcp-pubsub-one-to-one.gcp-pubsub-asset.asset_id

  cluster_location          = local.cluster_location
  cluster_project           = local.gcp_project_id
  cluster_subscription_type = "STANDARD"
  cluster_id                = local.cluster_id
  cluster_display_name      = local.cluster_id
  cluster_network           = "projects/${local.gcp_project_id}/global/networks/${local.gcp_network}"
  cluster_password          = local.password
  cluster_user              = local.user

  primary_instance_display_name              = "my-alloydb-postgresql-primary-instance"
  primary_instance_id                        = "my-primary-instance"
  primary_instance_cidr_range                = "${chomp(data.http.my-ip.response_body)}/32"
  primary_instance_enable_outbound_public_ip = false
  primary_instance_enable_public_ip          = true

  read_pool_instance_display_name     = "my-alloydb-postgresql-read-pool-instance"
  read_pool_instance_id               = "my-read-pool-instance"
  read_pool_instance_node_count       = 1
  read_pool_instance_enable_public_ip = false
}
