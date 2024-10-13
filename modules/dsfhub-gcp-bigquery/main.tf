terraform {
  required_providers {
    dsfhub = {
      source = "imperva/dsfhub"
    }
  }
}

resource "dsfhub_data_source" "this" {
	server_type = "GCP BIGQUERY"
	
	admin_email = var.admin_email	
	asset_display_name = var.asset_display_name	
	asset_id = var.asset_id	
	audit_pull_enabled = var.audit_pull_enabled	
	gateway_id = var.gateway_id	
	logs_destination_asset_id = var.logs_destination_asset_id	
	parent_asset_id = var.parent_asset_id	
	pubsub_subscription = var.pubsub_subscription	
	server_host_name = "bigquery.googleapis.com"
	server_ip = "bigquery.googleapis.com"
	server_port = "443"
}
