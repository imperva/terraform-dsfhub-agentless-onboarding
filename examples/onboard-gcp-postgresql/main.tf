locals {
  admin_email           = "test@example.com"
  gateway_id            = "a1b2c3d4-e5f6-g8h9-wxyz-123456790"
  pubsub_auth_mechanism = "default"

  gcp_postgresql_instance_authorized_networks = [
    {
      name  = "local"
      value = "127.0.0.1"
    }
  ]
  gcp_project_id           = "my-gcp-project"
  gcp_service_account_name = "dsf-service-account"

  excluded_traffic_filter = [
    {
      name   = "exclude-cloudsqladmin-traffic"
      filter = "textPayload:\"user=cloudsqladmin\""
    }
  ]
  postgresql_admin = "admin"
  postgresql_admin_password = "Abcd1234"
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
# 3. A method to create 'pgaudit' extension on the postgresql instance. (handled 
#    below)
################################################################################
module "service-account" {
  source = "../../modules/google-service-account-dsf"

  account_id     = local.gcp_service_account_name
  auth_mechanism = local.pubsub_auth_mechanism
  description    = "PostgreSQL audit pull service account"
  project        = local.gcp_project_id
  project_roles = [
    "roles/pubsub.subscriber",
    "roles/pubsub.viewer"
  ]
}

################################################################################
# GCP PostgreSQL 16
################################################################################
locals {
  gcp_postgresql_1_instance_name = "tf-postgresql-16"
}

module "gcp-pubsub-1" {
  source = "../../modules/onboard-gcp-pubsub"

  gcp_pubsub_admin_email    = local.admin_email
  gcp_pubsub_audit_type     = "POSTGRESQL"
  gcp_pubsub_auth_mechanism = local.pubsub_auth_mechanism
  gcp_pubsub_gateway_id     = local.gateway_id

  project = local.gcp_project_id

  pubsub_subscription_name = "${local.gcp_postgresql_1_instance_name}-sub"

  pubsub_topic_name = "${local.gcp_postgresql_1_instance_name}-topic"

  sink_router_description = "PostgreSQL 16 sink"
  sink_router_exclusions  = local.excluded_traffic_filter
  sink_router_filter      = <<EOF
    resource.type="cloudsql_database"
    resource.labels.database_id="${local.gcp_project_id}:${local.gcp_postgresql_1_instance_name}"
    logName=(
      "projects/${local.gcp_project_id}/logs/cloudaudit.googleapis.com%2Fdata_access" OR
      "projects/${local.gcp_project_id}/logs/cloudsql.googleapis.com%2Fpostgres.log"
    )
  EOF
  sink_router_name        = "${local.gcp_postgresql_1_instance_name}-sink"
}

module "gcp-postgresql-1" {
  source = "../../modules/onboard-gcp-postgresql"

  gcp_postgresql_admin_email               = local.admin_email
  gcp_postgresql_audit_pull_enabled        = true
  gcp_postgresql_gateway_id                = local.gateway_id
  gcp_postgresql_logs_destination_asset_id = module.gcp-pubsub-1.gcp-pubsub-asset.asset_id

  instance_authorized_networks = local.gcp_postgresql_instance_authorized_networks
  instance_database_version    = "POSTGRES_16"
  instance_name                = local.gcp_postgresql_1_instance_name
  instance_region              = "us-west1"
}

# Create a user to be able to connect to the database and create the pgAudit
# extension. 
resource "google_sql_user" "gcp-postgresql-admin-user-1" {
  deletion_policy = "ABANDON"
  instance        = module.gcp-postgresql-1.gcp-postgresql-instance.name
  name            = local.postgresql_admin
  password        = local.postgresql_admin_password
}

resource "terraform_data" "configure_database_1" {
  depends_on = [module.gcp-postgresql-1, google_sql_user.gcp-postgresql-admin-user-1]

  provisioner "local-exec" {

    environment = {
      PGHOST     = module.gcp-postgresql-1.gcp-postgresql-instance.ip_address.0.ip_address
      PGUSER     = local.postgresql_admin
      PGPASSWORD = local.postgresql_admin_password
      PGPORT     = "5432"
      PGDATABASE = "postgres"
    }

    command = "./configure_database.sh"

    on_failure = fail
  }
}

################################################################################
# GCP PostgreSQL 15 with slow query monitoring
#
# Notes:
# The only difference needed to enable slow query monitoring is to set the 
# "log_min_duration_statement" database flag on the PostgreSQL instance. The rest
# of the flags are the default parameters required to enable auditing.
################################################################################
locals {
  gcp_postgresql_2_instance_name = "tf-postgresql-15-slow-query"
}

module "gcp-pubsub-2" {
  source = "../../modules/onboard-gcp-pubsub"

  gcp_pubsub_admin_email    = local.admin_email
  gcp_pubsub_audit_type     = "POSTGRESQL"
  gcp_pubsub_auth_mechanism = local.pubsub_auth_mechanism
  gcp_pubsub_gateway_id     = local.gateway_id

  project = local.gcp_project_id

  pubsub_subscription_name = "${local.gcp_postgresql_2_instance_name}-sub"

  pubsub_topic_name = "${local.gcp_postgresql_2_instance_name}-topic"

  sink_router_description = "PostgreSQL 15 w/ slow query sink"
  sink_router_exclusions  = local.excluded_traffic_filter
  sink_router_filter      = <<EOF
    resource.type="cloudsql_database"
    resource.labels.database_id="${local.gcp_project_id}:${local.gcp_postgresql_2_instance_name}"
    logName=(
      "projects/${local.gcp_project_id}/logs/cloudaudit.googleapis.com%2Fdata_access" OR
      "projects/${local.gcp_project_id}/logs/cloudsql.googleapis.com%2Fpostgres.log"
    )
  EOF
  sink_router_name        = "${local.gcp_postgresql_2_instance_name}-sink"
}

module "gcp-postgresql-2" {
  source = "../../modules/onboard-gcp-postgresql"

  gcp_postgresql_admin_email               = local.admin_email
  gcp_postgresql_audit_pull_enabled        = true
  gcp_postgresql_gateway_id                = local.gateway_id
  gcp_postgresql_logs_destination_asset_id = module.gcp-pubsub-2.gcp-pubsub-asset.asset_id

  instance_authorized_networks = local.gcp_postgresql_instance_authorized_networks
  instance_database_version    = "POSTGRES_15"
  instance_database_flags = [
    {
      name  = "cloudsql.enable_pgaudit"
      value = "on"
    },
    {
      name  = "log_error_verbosity"
      value = "verbose"
    },
    {
      name  = "log_connections"
      value = "on"
    },
    {
      name  = "log_disconnections"
      value = "on"
    },
    {
      name  = "log_hostname"
      value = "on"
    },
    {
      name  = "pgaudit.log"
      value = "all"
    },
    {
      name  = "log_line_prefix"
      value = "SONAR_AUDIT=1|TIMESTAMP=%m|APPLICATION_NAME=%a|USER=%u|DATABASE=%d|REMOTE_HOST_AND_PORT=%r|SQL_STATE=%e|SESSION_ID=%c|SESSION_START=%s|PROCESS_ID=[%p]|VIRTUAL_TRANSACTION_ID=%v|TRANSACTION_ID=%x| "
    },
    {
      name  = "log_min_duration_statement"
      value = "5000" # milliseconds
    }
  ]
  instance_name   = local.gcp_postgresql_2_instance_name
  instance_region = "us-west1"
  instance_tier   = "db-f1-micro"
}

# Create a user to be able to connect to the database and create the pgAudit
# extension. 
resource "google_sql_user" "gcp-postgresql-admin-user-2" {
  deletion_policy = "ABANDON"
  instance        = module.gcp-postgresql-2.gcp-postgresql-instance.name
  name            = local.postgresql_admin
  password        = local.postgresql_admin_password
}

resource "terraform_data" "configure_database_2" {
  depends_on = [module.gcp-postgresql-2, google_sql_user.gcp-postgresql-admin-user-2]

  provisioner "local-exec" {

    environment = {
      PGHOST     = module.gcp-postgresql-2.gcp-postgresql-instance.ip_address.0.ip_address
      PGUSER     = local.postgresql_admin
      PGPASSWORD = local.postgresql_admin_password
      PGPORT     = "5432"
      PGDATABASE = "postgres"
    }

    command = "./configure_database.sh"

    on_failure = fail
  }
}

################################################################################
# GCP PostgreSQL 16 Many-to-one
################################################################################
locals {
  gcp_postgresql_3_instance_name_prefix = "tf-postgresql-multi"
  gcp_postgresql_3_instance_types = toset([
    "dev",
    "prod",
    "uat",
  ])

  # Build instance names
  gcp_postgresql_3_instance_names = toset([
    for i, type in local.gcp_postgresql_3_instance_types : "${local.gcp_postgresql_3_instance_name_prefix}-${type}"
  ])

  # Build database IDs
  gcp_postgresql_3_database_ids = [
    for i, name in local.gcp_postgresql_3_instance_names : "\"${local.gcp_project_id}:${name}\""
  ]

  # Build sink filter
  gcp_postgresql_3_filter = join(
    "",
    [
      "resource.type=\"cloudsql_database\"\n",
      "logName=(\"projects/${local.gcp_project_id}/logs/cloudaudit.googleapis.com%2Fdata_access\" OR \"projects/${local.gcp_project_id}/logs/cloudsql.googleapis.com%2Fpostgres.log\")\n",
      "resource.labels.database_id=(",
      join(
        " OR ",
        local.gcp_postgresql_3_database_ids
      ),
      ")",
    ]
  )
}

module "gcp-pubsub-3" {
  source = "../../modules/onboard-gcp-pubsub"

  gcp_pubsub_admin_email    = local.admin_email
  gcp_pubsub_audit_type     = "POSTGRESQL"
  gcp_pubsub_auth_mechanism = local.pubsub_auth_mechanism
  gcp_pubsub_gateway_id     = local.gateway_id
  
  project = local.gcp_project_id

  pubsub_subscription_name = "${local.gcp_postgresql_3_instance_name_prefix}-sub"

  pubsub_topic_name = "${local.gcp_postgresql_3_instance_name_prefix}-topic"

  sink_router_description = "PostgreSQL 16 many-to-one sink"
  sink_router_exclusions  = local.excluded_traffic_filter
  sink_router_filter      = local.gcp_postgresql_3_filter
  sink_router_name        = "${local.gcp_postgresql_3_instance_name_prefix}-sink"
}

module "gcp-postgresql-3" {
  source = "../../modules/onboard-gcp-postgresql"

  for_each = local.gcp_postgresql_3_instance_names

  gcp_postgresql_admin_email               = local.admin_email
  gcp_postgresql_audit_pull_enabled        = true
  gcp_postgresql_gateway_id                = local.gateway_id
  gcp_postgresql_logs_destination_asset_id = module.gcp-pubsub-2.gcp-pubsub-asset.asset_id

  instance_authorized_networks = local.gcp_postgresql_instance_authorized_networks
  instance_database_version    = "POSTGRES_16"
  instance_name                = each.key
  instance_region              = "us-west1"
}

# Create users to be able to connect to the databases and create the pgAudit
# extension. 
resource "google_sql_user" "gcp-postgresql-admin-user-3" {
  depends_on = [module.gcp-postgresql-3]

  for_each = local.gcp_postgresql_3_instance_names

  deletion_policy = "ABANDON"
  instance        = each.key
  name            = local.postgresql_admin
  password        = local.postgresql_admin_password
}

resource "terraform_data" "configure_database_3" {
  depends_on = [module.gcp-postgresql-3, google_sql_user.gcp-postgresql-admin-user-3]

  for_each = module.gcp-postgresql-3

  provisioner "local-exec" {

    environment = {
      PGHOST     = each.value.gcp-postgresql-instance.ip_address.0.ip_address
      PGUSER     = local.postgresql_admin
      PGPASSWORD = local.postgresql_admin_password
      PGPORT     = "5432"
      PGDATABASE = "postgres"
    }

    command = "./configure_database.sh"

    on_failure = fail
  }
}
