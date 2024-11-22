module "gcp-ms-sql-server-instance" {
  source = "../google-sql-database-instance"

  authorized_networks     = var.instance_authorized_networks
  database_flags          = var.instance_database_flags
  database_version        = var.instance_database_version
  deletion_protection     = var.instance_deletion_protection
  name                    = var.instance_name
  project                 = var.instance_project
  region                  = var.instance_region
  root_password           = var.instance_root_password
  sql_server_audit_config = var.instance_sql_server_audit_config
  tier                    = var.instance_tier
}

module "gcp-ms-sql-server-asset" {
  source = "../dsfhub-gcp-ms-sql-server"

  admin_email               = var.gcp_ms_sql_server_admin_email
  asset_display_name        = module.gcp-ms-sql-server-instance.this.name
  asset_id                  = "${module.gcp-ms-sql-server-instance.this.project}:${module.gcp-ms-sql-server-instance.this.region}:${module.gcp-ms-sql-server-instance.this.name}"
  audit_pull_enabled        = var.gcp_ms_sql_server_audit_pull_enabled
  audit_type                = "BUCKET"
  gateway_id                = var.gcp_ms_sql_server_gateway_id
  logs_destination_asset_id = var.gcp_ms_sql_server_logs_destination_asset_id
  parent_asset_id           = var.gcp_ms_sql_server_parent_asset_id
  server_host_name          = module.gcp-ms-sql-server-instance.this.ip_address.0.ip_address
  server_ip                 = module.gcp-ms-sql-server-instance.this.ip_address.0.ip_address
}

# Allow SQL server service account to write to bucket
resource "google_storage_bucket_iam_member" "this" {
  bucket = var.storage_bucket_name
  role   = "roles/storage.objectAdmin"
  member = "serviceAccount:${module.gcp-ms-sql-server-instance.this.service_account_email_address}"
}
