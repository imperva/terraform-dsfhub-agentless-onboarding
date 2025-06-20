module "gcp-mysql-instance" {
  source = "../google-sql-database-instance"

  authorized_networks     = var.instance_authorized_networks
  database_flags          = var.instance_database_flags
  database_version        = var.instance_database_version
  deletion_protection     = var.instance_deletion_protection
  name                    = var.instance_name
  project                 = var.instance_project
  region                  = var.instance_region
  root_password           = null
  sql_server_audit_config = null
  tier                    = var.instance_tier
}

module "gcp-mysql-asset" {
  source = "../dsfhub-gcp-mysql"

  admin_email               = var.gcp_mysql_admin_email
  asset_display_name        = module.gcp-mysql-instance.this.name
  asset_id                  = "${module.gcp-mysql-instance.this.project}:${module.gcp-mysql-instance.this.region}:${module.gcp-mysql-instance.this.name}"
  audit_pull_enabled        = var.gcp_mysql_audit_pull_enabled
  gateway_id                = var.gcp_mysql_gateway_id
  logs_destination_asset_id = var.gcp_mysql_logs_destination_asset_id
  parent_asset_id           = var.gcp_mysql_parent_asset_id
  server_host_name          = "4.3.2.1.bc.googleusercontent.com"
  server_ip                 = module.gcp-mysql-instance.this.ip_address.0.ip_address
}
