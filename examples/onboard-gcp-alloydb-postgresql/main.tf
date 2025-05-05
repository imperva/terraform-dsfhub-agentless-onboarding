locals {
  admin_email           = "test@example.com"
  gateway_id            = "a1b2c3d4-e5f6-g8h9-wxyz-123456790"
  pubsub_auth_mechanism = "service_account"

  gcp_alloydb_instance_name_dsf_419 = "tf-alloydb-dsf-419"
  gcp_alloydb_instance_name_dsf_150 = "tf-alloydb-dsf-150"
  gcp_authorized_cidr_range         = "${chomp(data.http.my-ip.response_body)}/32"
  gcp_network                       = "default"
  gcp_project_id                    = "my-gcp-project"
  gcp_service_account_name          = "dsf-service-account"

  cluster_id_dsf_419 = "my-alloydb-postgresql-cluster-dsf-419"
  cluster_id_dsf_150 = "my-alloydb-postgresql-cluster-dsf-150"
  cluster_location   = "us-west1"

  alloydb_admin          = "postgres"
  alloydb_admin_password = "@S3cureP@ssw0rd"

  required_database_flags = {
    "4.19" = {
      "alloydb.enable_pgaudit"      = "on"
      "log_error_verbosity"         = "verbose"
      "log_connections"             = "on"
      "log_disconnections"          = "on"
      "log_hostname"                = "on"
      "pgaudit.log"                 = "all"
      "password.enforce_complexity" = "on" # Required for connecting to the database with the initial user and running the pgaudit configuration script
    }
    "15.0" = {
      "alloydb.enable_pgaudit"      = "on"
      "log_error_verbosity"         = "verbose"
      "log_connections"             = "on"
      "log_disconnections"          = "on"
      "log_hostname"                = "on"
      "pgaudit.log"                 = "all"
      "password.enforce_complexity" = "on" # Required for connecting to the database with the initial user and running the pgaudit configuration script
      "log_line_prefix"             = "SONAR_AUDIT=1|TIMESTAMP=%m|APPLICATION_NAME=%a|USER=%u|DATABASE=%d|REMOTE_HOST_AND_PORT=%r|SQL_STATE=%e|SESSION_ID=%c|SESSION_START=%s|PROCESS_ID=[%p]|VIRTUAL_TRANSACTION_ID=%v|TRANSACTION_ID=%x| "
    }
  }
}

################################################################################
# Providers
################################################################################
terraform {
  required_providers {
    dsfhub = {
      source  = "imperva/dsfhub"
      version = ">= 1.3.7"
    }
  }
}

provider "google" {
  # Authenticated via "gcloud" CLI
  project = local.gcp_project_id
}

provider "dsfhub" {}

data "http" "my-ip" {
  url = "http://icanhazip.com"
}

################################################################################
# Prerequisites
# 1. A service account with permissions to read from the PubSub subscription
# 2. A Google sink router, PubSub topic and subscription
# 3. A method to create 'pgaudit' extension on the AlloyDB instance. (handled 
#    below for each example)
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

################################################################################
# GCP AlloyDB for PostgreSQL (14) for DSF version 4.19
################################################################################

module "gcp-pubsub-1" {
  source = "../../modules/onboard-gcp-pubsub"

  gcp_pubsub_admin_email    = local.admin_email
  gcp_pubsub_audit_type     = "ALLOYDB_POSTGRESQL"
  gcp_pubsub_auth_mechanism = local.pubsub_auth_mechanism
  gcp_pubsub_gateway_id     = local.gateway_id
  gcp_pubsub_key_file       = "/path/to/JSONAR_LOCALDIR/credentials/service-account-private-key.json"

  project = local.gcp_project_id

  pubsub_subscription_name = "${local.gcp_alloydb_instance_name_dsf_419}-sub"

  pubsub_topic_name = "${local.gcp_alloydb_instance_name_dsf_419}-topic"

  sink_router_description = "AlloyDB for PostgreSQL sink for DSF version 4.19"
  sink_router_exclusions  = null
  sink_router_filter      = <<EOF
    resource.labels.cluster_id="${local.cluster_id_dsf_419}" AND
    logName=(
      "projects/${local.gcp_project_id}/logs/cloudaudit.googleapis.com%2Fdata_access" OR
      "projects/${local.gcp_project_id}/logs/cloudsql.googleapis.com%2Fpostgres.log"
    )
  EOF
  sink_router_name        = "${local.gcp_alloydb_instance_name_dsf_419}-sink"
}

module "gcp-alloydb-postgresql-1" {
  source = "../../modules/onboard-gcp-alloydb-postgresql"

  gcp_alloydb_postgresql_cluster_admin_email               = local.admin_email
  gcp_alloydb_postgresql_cluster_audit_pull_enabled        = true
  gcp_alloydb_postgresql_cluster_gateway_id                = local.gateway_id
  gcp_alloydb_postgresql_cluster_logs_destination_asset_id = module.gcp-pubsub-1.gcp-pubsub-asset.asset_id

  gcp_alloydb_postgresql_admin_email = local.admin_email
  gcp_alloydb_postgresql_gateway_id  = local.gateway_id

  cluster_database_version  = "POSTGRES_14"
  cluster_location          = local.cluster_location
  cluster_project           = local.gcp_project_id
  cluster_subscription_type = "STANDARD"
  cluster_id                = local.cluster_id_dsf_419
  cluster_network           = "projects/${local.gcp_project_id}/global/networks/${local.gcp_network}"
  cluster_password          = local.alloydb_admin_password
  cluster_user              = local.alloydb_admin

  primary_instance_id                        = "${local.gcp_alloydb_instance_name_dsf_419}-primary"
  primary_instance_cidr_range                = local.gcp_authorized_cidr_range
  primary_instance_enable_outbound_public_ip = false
  primary_instance_enable_public_ip          = true

  read_pool_instance_id               = "${local.gcp_alloydb_instance_name_dsf_419}-read-pool"
  read_pool_instance_node_count       = 1
  read_pool_instance_enable_public_ip = false
}

resource "terraform_data" "configure_database_1" {
  depends_on = [module.gcp-alloydb-postgresql-1]

  provisioner "local-exec" {

    environment = {
      PGHOST     = module.gcp-alloydb-postgresql-1.gcp-alloydb-primary-instance.public_ip_address
      PGUSER     = local.alloydb_admin
      PGPASSWORD = local.alloydb_admin_password
      PGPORT     = "5432"
      PGDATABASE = "postgres"
    }

    command = "./configure_database.sh"

    on_failure = fail
  }
}

################################################################################
# GCP AlloyDB for PostgreSQL (15) for DSF version 15.0
################################################################################
module "gcp-pubsub-2" {
  source = "../../modules/onboard-gcp-pubsub"

  gcp_pubsub_admin_email    = local.admin_email
  gcp_pubsub_audit_type     = "ALLOYDB_POSTGRESQL"
  gcp_pubsub_auth_mechanism = local.pubsub_auth_mechanism
  gcp_pubsub_gateway_id     = local.gateway_id
  gcp_pubsub_key_file       = "/path/to/JSONAR_LOCALDIR/credentials/service-account-private-key.json"

  project = local.gcp_project_id

  pubsub_subscription_name = "${local.gcp_alloydb_instance_name_dsf_150}-sub"

  pubsub_topic_name = "${local.gcp_alloydb_instance_name_dsf_150}-topic"

  sink_router_description = "AlloyDB for PostgreSQL sink for DSF version 15.0"
  sink_router_exclusions  = null
  sink_router_filter      = <<EOF
    resource.labels.cluster_id="${local.cluster_id_dsf_150}" AND
    logName=(
      "projects/${local.gcp_project_id}/logs/cloudaudit.googleapis.com%2Fdata_access" OR
      "projects/${local.gcp_project_id}/logs/cloudsql.googleapis.com%2Fpostgres.log"
    )
  EOF
  sink_router_name        = "${local.gcp_alloydb_instance_name_dsf_150}-sink"
}

module "gcp-alloydb-postgresql-2" {
  source = "../../modules/onboard-gcp-alloydb-postgresql"

  gcp_alloydb_postgresql_cluster_admin_email               = local.admin_email
  gcp_alloydb_postgresql_cluster_audit_pull_enabled        = true
  gcp_alloydb_postgresql_cluster_gateway_id                = local.gateway_id
  gcp_alloydb_postgresql_cluster_logs_destination_asset_id = module.gcp-pubsub-2.gcp-pubsub-asset.asset_id

  gcp_alloydb_postgresql_admin_email = local.admin_email
  gcp_alloydb_postgresql_gateway_id  = local.gateway_id

  cluster_database_version  = "POSTGRES_15"
  cluster_location          = local.cluster_location
  cluster_project           = local.gcp_project_id
  cluster_subscription_type = "STANDARD"
  cluster_id                = local.cluster_id_dsf_150
  cluster_network           = "projects/${local.gcp_project_id}/global/networks/${local.gcp_network}"
  cluster_password          = local.alloydb_admin_password
  cluster_user              = local.alloydb_admin

  primary_instance_id                        = "${local.gcp_alloydb_instance_name_dsf_150}-primary"
  primary_instance_cidr_range                = local.gcp_authorized_cidr_range
  primary_instance_database_flags            = local.required_database_flags["15.0"]
  primary_instance_enable_outbound_public_ip = false
  primary_instance_enable_public_ip          = true

  read_pool_instance_database_flags   = local.required_database_flags["15.0"]
  read_pool_instance_id               = "${local.gcp_alloydb_instance_name_dsf_150}-read-pool"
  read_pool_instance_node_count       = 1
  read_pool_instance_enable_public_ip = false
}

resource "terraform_data" "configure_database_2" {
  depends_on = [module.gcp-alloydb-postgresql-2]

  provisioner "local-exec" {

    environment = {
      PGHOST     = module.gcp-alloydb-postgresql-2.gcp-alloydb-primary-instance.public_ip_address
      PGUSER     = local.alloydb_admin
      PGPASSWORD = local.alloydb_admin_password
      PGPORT     = "5432"
      PGDATABASE = "postgres"
    }

    command = "./configure_database.sh"

    on_failure = fail
  }
}
