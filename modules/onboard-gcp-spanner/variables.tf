variable "gcp_spanner_admin_email" {
  description = "The email address to notify about the asset."
  type        = string
}

variable "gcp_spanner_audit_pull_enabled" {
  description = "If true, sonargateway will collect the audit logs for this system if it can."
  type        = bool
  default     = false
}

variable "gcp_spanner_duration_threshold" {
  description = "How long (in seconds) is a query's duration before it should be flagged as slow."
  type        = int
  default     = null
}

variable "gcp_spanner_gateway_id" {
  description = "Unique identifier (UID) attached to the jSonar machine controlling the asset"
  type        = string
}

variable "gcp_spanner_logs_destination_asset_id" {
  description = "The asset_id of the GCP PUSUB asset that this asset is sending its audit logs to."
  type        = string
  default     = null
}

variable "gcp_spanner_parent_asset_id" {
  description = "The asset_id of the GCP asset representing the GCP account where this data source is located."
  type        = string
  default     = null
}

variable "instance_config" {
  description = "The name of the instance's configuration (similar but not quite the same as a region) which defines the geographic placement and replication of your databases in this instance. It determines where your data is stored. Values are typically of the form `regional-europe-west1` , `us-central` etc. In order to obtain a valid list please consult the [Configuration section of the docs](https://cloud.google.com/spanner/docs/instances)."
  type        = string
  default     = null
}

variable "instance_display_name" {
  description = "The descriptive name for this instance as it appears in UIs."
  type        = string
  default     = null
  validation {
    condition     = length(var.display_name) >= 4 && length(var.display_name) <= 30
    error_message = "The display name must be between 4 and 30 characters in length."
  }
}

variable "instance_edition" {
  description = "The edition selected for this instance. Different editions provide different capabilities at different price points. Possible values are: EDITION_UNSPECIFIED, STANDARD, ENTERPRISE, ENTERPRISE_PLUS."
  type        = string
  default     = "STANDARD"
  validation {
    condition     = can(regexall("EDITION_UNSPECIFIED|STANDARD|ENTERPRISE|ENTERPRISE_PLUS", var.edition))
    error_message = "The edition must be one of EDITION_UNSPECIFIED, STANDARD, ENTERPRISE, ENTERPRISE_PLUS."
  }
}

variable "instance_labels" {
  description = "An object containing a list of key/value pairs."
  type        = map(string)
  default     = {}
}

variable "instance_name" {
  description = "A unique identifier for the instance, which cannot be changed after the instance is created. If not provided, a random string starting with `tf-` will be selected."
  type        = string
  validation {
    condition     = length(var.name) >= 6 && length(var.name) <= 30
    error_message = "The name must be between 6 and 30 characters in length."
  }
}

variable "instance_num_nodes" {
  description = "The number of nodes allocated to this instance. Exactly one of either node_count or processing_units must be present in terraform."
  type        = number
  default     = 1
}

variable "instance_project" {
  description = "The ID of the project in which the resource belongs. If it is not provided, the provider project is used."
  type        = string
  default     = null
}
