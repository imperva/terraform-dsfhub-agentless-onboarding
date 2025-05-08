terraform {
  required_providers {
    dsfhub = {
      source  = "imperva/dsfhub"
      version = ">= 1.3.7"
    }
  }
}

module "gcp-alloydb-cluster" {
  source = "../google-alloydb-cluster"

  allocated_ip_range = var.cluster_allocated_ip_range
  cluster_id         = var.cluster_id
  cluster_type       = var.cluster_type
  database_version   = var.cluster_database_version
  display_name       = var.cluster_id
  labels             = var.cluster_labels
  location           = var.cluster_location
  network            = var.cluster_network
  password           = var.cluster_password
  project            = var.cluster_project
  subscription_type  = var.cluster_subscription_type
  user               = var.cluster_user
}

module "gcp-alloydb-primary-instance" {
  source = "../google-alloydb-instance"

  cidr_range                = var.primary_instance_cidr_range
  cluster                   = module.gcp-alloydb-cluster.this.name
  database_flags            = var.primary_instance_database_flags
  display_name              = var.primary_instance_id
  enable_outbound_public_ip = var.primary_instance_enable_outbound_public_ip
  instance_id               = var.primary_instance_id
  instance_type             = "PRIMARY"
  labels                    = var.primary_instance_labels

  # Fields required to allow initial user to connect and run pgaudit configuration script
  enable_public_ip = "true"
  ssl_mode         = "ALLOW_UNENCRYPTED_AND_ENCRYPTED"
}

module "gcp-alloydb-read-pool-instance" {
  source = "../google-alloydb-instance"

  depends_on = [module.gcp-alloydb-primary-instance]

  count = var.read_pool_instance_count

  cidr_range     = var.read_pool_instance_cidr_range
  cluster        = module.gcp-alloydb-cluster.this.name
  database_flags = var.read_pool_instance_database_flags
  display_name              = "${var.read_pool_instance_id}-${count.index+1}"
  enable_outbound_public_ip = var.read_pool_instance_enable_outbound_public_ip
  enable_public_ip          = var.read_pool_instance_enable_public_ip
  instance_id               = "${var.read_pool_instance_id}-${count.index+1}"
  instance_type             = "READ_POOL"
  labels                    = var.read_pool_instance_labels
  node_count                = var.read_pool_instance_node_count
}

module "gcp-alloydb-postgresql-cluster-asset" {
  source = "../dsfhub-gcp-alloydb-postgresql-cluster"

  depends_on = [module.gcp-alloydb-cluster, module.gcp-alloydb-primary-instance]

  admin_email               = var.gcp_alloydb_postgresql_cluster_admin_email
  asset_display_name        = var.primary_instance_id
  asset_id                  = "projects/${var.cluster_project}/locations/${var.cluster_location}/clusters/${var.cluster_id}/instances/${var.primary_instance_id}"
  audit_pull_enabled        = var.gcp_alloydb_postgresql_cluster_audit_pull_enabled
  cluster_id                = var.cluster_id
  cluster_member_id         = var.primary_instance_id
  gateway_id                = var.gcp_alloydb_postgresql_cluster_gateway_id
  logs_destination_asset_id = var.gcp_alloydb_postgresql_cluster_logs_destination_asset_id
  parent_asset_id           = var.gcp_alloydb_postgresql_cluster_parent_asset_id
  server_host_name          = module.gcp-alloydb-primary-instance.this.ip_address
  server_ip                 = module.gcp-alloydb-primary-instance.this.ip_address
  server_port               = var.gcp_alloydb_postgresql_cluster_server_port
}

module "gcp-alloydb-postgresql-asset" {
  source = "../dsfhub-gcp-alloydb-postgresql"

  depends_on = [module.gcp-alloydb-cluster, module.gcp-alloydb-read-pool-instance]

  count = var.read_pool_instance_count

  admin_email        = var.gcp_alloydb_postgresql_admin_email
  asset_display_name = "${var.read_pool_instance_id}-${count.index+1}"
  asset_id           = "projects/${var.cluster_project}/locations/${var.cluster_location}/clusters/${var.cluster_id}/instances/${var.read_pool_instance_id}-${count.index+1}"
  audit_pull_enabled = var.gcp_alloydb_postgresql_cluster_audit_pull_enabled
  cluster_id         = var.cluster_id
  cluster_member_id  = "${var.read_pool_instance_id}-${count.index+1}"
  gateway_id         = var.gcp_alloydb_postgresql_gateway_id
  parent_asset_id    = var.gcp_alloydb_postgresql_parent_asset_id
  server_host_name   = module.gcp-alloydb-read-pool-instance[count.index].this.ip_address
  server_ip          = module.gcp-alloydb-read-pool-instance[count.index].this.ip_address
  server_port        = var.gcp_alloydb_postgresql_server_port
}
