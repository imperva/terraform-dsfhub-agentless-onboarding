module "gcp-postgresql-instance" {
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

locals {
  original_ip = module.gcp-postgresql-instance.this.ip_address.0.ip_address
  reversed_ip = join(".", reverse(split(".", local.original_ip)))
}

module "gcp-postgresql-asset" {
  source = "../dsfhub-gcp-postgresql"

  admin_email               = var.gcp_postgresql_admin_email
  asset_display_name        = module.gcp-postgresql-instance.this.name
  asset_id                  = "${module.gcp-postgresql-instance.this.project}:${module.gcp-postgresql-instance.this.region}:${module.gcp-postgresql-instance.this.name}"
  audit_pull_enabled        = var.gcp_postgresql_audit_pull_enabled
  gateway_id                = var.gcp_postgresql_gateway_id
  logs_destination_asset_id = var.gcp_postgresql_logs_destination_asset_id
  parent_asset_id           = var.gcp_postgresql_parent_asset_id
  server_host_name          = "${local.reversed_ip}.bc.googleusercontent.com"
  server_ip                 = module.gcp-postgresql-instance.this.ip_address.0.ip_address
}
