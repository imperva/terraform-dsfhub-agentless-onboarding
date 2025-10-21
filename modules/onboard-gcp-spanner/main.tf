module "gcp-spanner-instance" {
  source = "../google-spanner-instance"

  default_backup_schedule_type = var.instance_default_backup_schedule_type
  config                       = "projects/${var.instance_project}/instanceConfigs/${var.instance_config}"
  display_name                 = var.instance_display_name
  edition                      = var.instance_edition
  force_destroy                = var.instance_force_destroy
  labels                       = var.instance_labels
  name                         = var.instance_name
  num_nodes                    = var.instance_num_nodes
  project                      = var.instance_project
}

module "gcp-spanner-asset" {
  source = "../dsfhub-gcp-spanner"

  admin_email               = var.gcp_spanner_admin_email
  asset_display_name        = module.gcp-spanner-instance.this.display_name
  asset_id                  = "${module.gcp-spanner-instance.this.project}:${replace(module.gcp-spanner-instance.this.config, "/^.*/instanceConfigs/(?:regional-|dual-region-)([^/]+)$/", "$1")}:${module.gcp-spanner-instance.this.name}"
  audit_pull_enabled        = var.gcp_spanner_audit_pull_enabled
  duration_threshold        = var.gcp_spanner_duration_threshold
  gateway_id                = var.gcp_spanner_gateway_id
  logs_destination_asset_id = var.gcp_spanner_logs_destination_asset_id
  parent_asset_id           = var.gcp_spanner_parent_asset_id
  server_host_name          = module.gcp-spanner-instance.this.name
  server_ip                 = module.gcp-spanner-instance.this.name
}
