locals {
  admin_email = "test@example.com"
  gateway_id  = "a1b2c3d4-e5f6-g8h9-wxyz-123456790"

  gcp_project_id      = "my-gcp-project"
  gcp_service_account = "dsf-service-account"

  instance_root_password          = "Abcd1234"
  instance_server_audit_name      = "tfmanagedsqlserveraudit"
  instance_server_audit_spec_name = "tfmanagedsqlserverauditspec"
  instance_authorized_networks = [
    {
      name  = "local"
      value = "127.0.0.1"
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

variable "dsfhub_host" {}  # TF_VAR_dsfhub_host env variable
variable "dsfhub_token" {} # TF_VAR_dsfhub_token env variable

provider "dsfhub" {
  dsfhub_host  = var.dsfhub_host
  dsfhub_token = var.dsfhub_token
}

################################################################################
# Prerequisites
# 1. A service account with permissions to read from the GCS bucket alongside a
#    GCP cloud account asset representing the service account onboarded to DSF 
#    Hub.
# 2. A Google Cloud Storage service (GCS) bucket in addition to a GCP CLOUD 
#    STORAGE BUCKET asset onboarded to DSF Hub (handled below).
# 3. A method to create the server audit and server audit specification on the 
#    newly created SQL Server instances (handled below). 
################################################################################
module "service-account" {
  source = "../../modules/google-service-account-dsf"

  account_id                   = local.gcp_service_account
  auth_mechanism               = "default"
  create_ignore_already_exists = false
  description                  = "SQL Server audit pull service account"
  disabled                     = false
  display_name                 = local.gcp_service_account
  project                      = local.gcp_project_id
  project_roles = [
    "roles/storage.objectUser",
    "roles/viewer"
  ]
}

module "gcp-account-asset" {
  source = "../../modules/dsfhub-gcp-cloud-account"

  admin_email        = local.admin_email
  asset_display_name = "default-gcp-account-asset"
  asset_id           = module.service-account.account.id
  auth_mechanism     = "default"
  gateway_id         = local.gateway_id
  reason             = "default"
}

################################################################################
# GCP SQL Server 2019
################################################################################
locals {
  bucket_name_1   = "tf-sql-server-bucket"
  instance_name_1 = "tf-sql-server"
  gcp_region_1    = "us-west1"
}

module "gcp-bucket-1" {
  source     = "../../modules/onboard-gcp-cloud-storage-bucket"
  depends_on = [module.gcp-account-asset]

  bucket_force_destroy = true
  bucket_location      = "US"
  bucket_name          = local.bucket_name_1
  bucket_project       = local.gcp_project_id
  bucket_storage_class = "STANDARD"

  gcp_cloud_storage_bucket_admin_email     = local.admin_email
  gcp_cloud_storage_bucket_gateway_id      = local.gateway_id
  gcp_cloud_storage_bucket_parent_asset_id = module.gcp-account-asset.this.asset_id
}

module "gcp-sql-server-1" {
  source     = "../../modules/onboard-gcp-ms-sql-server"
  depends_on = [module.gcp-bucket-1]

  gcp_ms_sql_server_admin_email               = local.admin_email
  gcp_ms_sql_server_audit_pull_enabled        = true
  gcp_ms_sql_server_gateway_id                = local.gateway_id
  gcp_ms_sql_server_logs_destination_asset_id = module.gcp-bucket-1.gcp-cloud-storage-bucket-asset.asset_id

  instance_authorized_networks = local.instance_authorized_networks
  instance_database_version    = "SQLSERVER_2019_STANDARD"
  instance_name                = local.instance_name_1
  instance_project             = local.gcp_project_id
  instance_region              = local.gcp_region_1
  instance_root_password       = local.instance_root_password
  instance_sql_server_audit_config = {
    bucket             = "gs://${module.gcp-bucket-1.gcs-bucket.name}/${local.gcp_region_1}/"
    upload_interval    = "300s"
    retention_interval = "86400s" # 24 hours
  }
  instance_tier = "db-custom-1-3840"

  storage_bucket_name = local.bucket_name_1
}

resource "terraform_data" "configure-database-1" {
  depends_on = [module.gcp-sql-server-1]

  provisioner "local-exec" {
    environment = {
      ADMIN_USER     = "sqlserver"
      ADMIN_PASSWORD = local.instance_root_password
      ENDPOINT       = module.gcp-sql-server-1.gcp-ms-sql-server-instance.ip_address.0.ip_address

      SERVER_AUDIT_NAME      = local.instance_server_audit_name
      SERVER_AUDIT_SPEC_NAME = local.instance_server_audit_spec_name
    }

    command = "./configure_database.sh"

    on_failure = fail
  }
}

################################################################################
# GCP SQL Server 2019 Many-to-one
################################################################################
locals {
  bucket_name_2        = "tf-sql-server-bucket-multi"
  instance_name_prefix = "tf-sql-server-multi"
  instances = {
    "dev"  = "us-west1"
    "prod" = "us-east1"
    "uat"  = "us-central1"
  }
}

module "gcp-bucket-2" {
  source     = "../../modules/onboard-gcp-cloud-storage-bucket"
  depends_on = [module.gcp-account-asset]

  bucket_force_destroy = true
  bucket_location      = "US"
  bucket_name          = local.bucket_name_2
  bucket_project       = local.gcp_project_id
  bucket_storage_class = "STANDARD"

  gcp_cloud_storage_bucket_admin_email     = local.admin_email
  gcp_cloud_storage_bucket_gateway_id      = local.gateway_id
  gcp_cloud_storage_bucket_parent_asset_id = module.gcp-account-asset.this.asset_id
}

module "gcp-sql-server-2" {
  source     = "../../modules/onboard-gcp-ms-sql-server"
  depends_on = [module.gcp-bucket-2]
  for_each   = local.instances

  gcp_ms_sql_server_admin_email               = local.admin_email
  gcp_ms_sql_server_audit_pull_enabled        = true
  gcp_ms_sql_server_gateway_id                = local.gateway_id
  gcp_ms_sql_server_logs_destination_asset_id = module.gcp-bucket-2.gcp-cloud-storage-bucket-asset.asset_id

  instance_authorized_networks = local.instance_authorized_networks
  instance_database_version    = "SQLSERVER_2019_STANDARD"
  instance_name                = "${local.instance_name_prefix}-${each.key}"
  instance_project             = local.gcp_project_id
  instance_region              = each.value
  instance_root_password       = local.instance_root_password
  instance_sql_server_audit_config = {
    bucket             = "gs://${module.gcp-bucket-2.gcs-bucket.name}/${each.value}/"
    upload_interval    = "300s"
    retention_interval = "86400s" # 24 hours
  }
  instance_tier = "db-custom-1-3840"

  storage_bucket_name = local.bucket_name_2
}

resource "terraform_data" "configure-database-2" {
  depends_on = [module.gcp-sql-server-2]
  for_each   = module.gcp-sql-server-2

  provisioner "local-exec" {
    environment = {
      ADMIN_USER     = "sqlserver"
      ADMIN_PASSWORD = local.instance_root_password
      ENDPOINT       = each.value.gcp-ms-sql-server-instance.ip_address.0.ip_address

      SERVER_AUDIT_NAME      = local.instance_server_audit_name
      SERVER_AUDIT_SPEC_NAME = local.instance_server_audit_spec_name
    }

    command = "./configure_database.sh"

    on_failure = fail
  }
}
