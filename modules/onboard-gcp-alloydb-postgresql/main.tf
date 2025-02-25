module "gcp-alloydb-cluster" {
  source = "../google-alloydb-cluster"

  cluster_id       = var.cluster_cluster_id
  cluster_type     = var.cluster_cluster_type
  database_version = var.cluster_database_version
  display_name     = var.cluster_display_name
  labels           = var.cluster_labels
  location         = var.cluster_location
  #   network_config {
  #     allocated_ip_range = var.allocated_ip_range
  #     network            = var.network
  #   }
  password          = var.cluster_password
  project           = var.cluster_project
  subscription_type = var.cluster_subscription_type
  user              = var.cluster_user

}

module "gcp-alloydb-instance" {
  source = "../google-alloydb-instance"

  cluster        = var.instance_cluster
  database_flags = var.instance_database_flags
  display_name   = var.instance_display_name
  instance_id    = var.instance_instance_id
  instance_type  = var.instance_instance_type
  labels         = var.instance_labels
}

module "gcp-alloydb-postgresql-cluster-asset" {
  source = "../dsfhub-gcp-alloydb-postgresql-cluster"

  #   admin_email               = var.gcp_postgresql_admin_email
  #   asset_display_name        = module.gcp-postgresql-instance.this.name
  #   asset_id                  = "${module.gcp-postgresql-instance.this.project}:${module.gcp-postgresql-instance.this.region}:${module.gcp-postgresql-instance.this.name}"
  #   audit_pull_enabled        = var.gcp_postgresql_audit_pull_enabled
  #   gateway_id                = var.gcp_postgresql_gateway_id
  #   logs_destination_asset_id = var.gcp_postgresql_logs_destination_asset_id
  #   parent_asset_id           = var.gcp_postgresql_parent_asset_id
  #   server_host_name          = module.gcp-postgresql-instance.this.ip_address.0.ip_address
  #   server_ip                 = module.gcp-postgresql-instance.this.ip_address.0.ip_address
  admin_email               = var.gcp_alloydb_postgresql_cluster_admin_email
  asset_display_name        = var.gcp_alloydb_postgresql_cluster_asset_display_name
  asset_id                  = var.gcp_alloydb_postgresql_cluster_asset_id
  audit_pull_enabled        = var.gcp_alloydb_postgresql_cluster_audit_pull_enabled
  cluster_id                = var.gcp_alloydb_postgresql_cluster_cluster_id
  gateway_id                = var.gcp_alloydb_postgresql_cluster_gateway_id
  logs_destination_asset_id = var.gcp_alloydb_postgresql_cluster_logs_destination_asset_id
  parent_asset_id           = var.gcp_alloydb_postgresql_cluster_parent_asset_id
  pubsub_subscription       = var.gcp_alloydb_postgresql_cluster_pubsub_subscription
  server_host_name          = var.gcp_alloydb_postgresql_cluster_server_host_name
  server_ip                 = var.gcp_alloydb_postgresql_cluster_server_ip
  server_port               = var.gcp_alloydb_postgresql_cluster_server_port
}

module "gcp-alloydb-postgresql-asset" {
  source = "../dsfhub-gcp-alloydb-postgresql"

  #   admin_email               = var.gcp_postgresql_admin_email
  #   asset_display_name        = module.gcp-postgresql-instance.this.name
  #   asset_id                  = "${module.gcp-postgresql-instance.this.project}:${module.gcp-postgresql-instance.this.region}:${module.gcp-postgresql-instance.this.name}"
  #   audit_pull_enabled        = var.gcp_postgresql_audit_pull_enabled
  #   gateway_id                = var.gcp_postgresql_gateway_id
  #   logs_destination_asset_id = var.gcp_postgresql_logs_destination_asset_id
  #   parent_asset_id           = var.gcp_postgresql_parent_asset_id
  #   server_host_name          = module.gcp-postgresql-instance.this.ip_address.0.ip_address
  #   server_ip                 = module.gcp-postgresql-instance.this.ip_address.0.ip_address
  admin_email               = var.gcp_alloydb_postgresql_admin_email
  asset_display_name        = var.gcp_alloydb_postgresql_asset_display_name
  asset_id                  = var.gcp_alloydb_postgresql_asset_id
  audit_pull_enabled        = var.gcp_alloydb_postgresql_audit_pull_enabled
  cluster_id                = var.gcp_alloydb_postgresql_cluster_id
  gateway_id                = var.gcp_alloydb_postgresql_gateway_id
  logs_destination_asset_id = var.gcp_alloydb_postgresql_logs_destination_asset_id
  parent_asset_id           = var.gcp_alloydb_postgresql_parent_asset_id
  pubsub_subscription       = var.gcp_alloydb_postgresql_pubsub_subscription
  server_host_name          = var.gcp_alloydb_postgresql_server_host_name
  server_ip                 = var.gcp_alloydb_postgresql_server_ip
  server_port               = var.gcp_alloydb_postgresql_server_port
}
