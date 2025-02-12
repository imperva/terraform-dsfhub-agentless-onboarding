module "gcp-spanner-instance" {
  source = "../google-spanner-instance"

  config       = var.instance_config
  display_name = var.instance_display_name
  edition      = var.instance_edition
  labels       = var.instance_labels
  name         = var.instance_name
  num_nodes    = var.instance_num_nodes
  project      = var.instance_project
}

module "gcp-spanner-asset" {
  source = "../dsfhub-gcp-spanner"

  admin_email               = var.gcp_spanner_admin_email
  asset_display_name        = module.gcp-spanner-instance.this.display_name
  asset_id                  = "${module.gcp-spanner-instance.this.project}:${module.gcp-spanner-instance.this.config}:${module.gcp-spanner-instance.this.name}"
  audit_pull_enabled        = var.gcp_spanner_audit_pull_enabled
  duration_threshold        = var.gcp_spanner_duration_threshold
  gateway_id                = var.gcp_spanner_gateway_id
  logs_destination_asset_id = var.gcp_spanner_logs_destination_asset_id
  parent_asset_id           = var.gcp_spanner_parent_asset_id
  server_host_name          = module.gcp-spanner-instance.this.name
  server_ip                 = module.gcp-spanner-instance.this.name
}
