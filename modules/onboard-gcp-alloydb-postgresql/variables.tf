variable "cluster_allocated_ip_range" {
  description = "The name of the allocated IP range for the private IP AlloyDB cluster. For example: 'google-managed-services-default'. If set, the instance IPs for this cluster will be created in the allocated range."
  type        = string
  default     = null
}

variable "cluster_database_version" {
  description = "The database engine major version. This is an optional field and it's populated at the Cluster creation time. Note: Changing this field to a higer version results in upgrading the AlloyDB cluster which is an irreversible change."
  type        = string
  default     = null
}

variable "cluster_display_name" {
  description = "User-settable and human-readable display name for the Cluster."
  type        = string
}

variable "cluster_id" {
  description = "The ID of the alloydb cluster."
  type        = string
}

variable "cluster_labels" {
  description = "Labels to apply to backups created using this configuration."
  type        = map(string)
  default     = {}
}

variable "cluster_location" {
  description = "The location where the alloydb cluster should reside."
  type        = string
}

variable "cluster_network" {
  description = "The resource link for the VPC network in which cluster resources are created and from which they are accessible via Private IP. The network must belong to the same project as the cluster. It is specified in the form: 'projects/{projectNumber}/global/networks/{network_id}'."
  type        = string
  default     = null
}

variable "cluster_password" {
  description = "The password for the initial user."
  type        = string
  default     = null
}

variable "cluster_project" {
  description = "The ID of the project in which the resource belongs. If it is not provided, the provider project is used."
  type        = string
}

variable "cluster_subscription_type" {
  description = "The subscription type of cluster. Possible values are: TRIAL, STANDARD. Default value is STANDARD."
  type        = string
  validation {
    condition     = can(contains(["STANDARD", "TRIAL"], var.cluster_subscription_type))
    error_message = "Invalid subscription type. Supported values: STANDARD, TRIAL"
  }
  default = "STANDARD"
}

variable "cluster_type" {
  description = "The type of cluster. If not set, defaults to PRIMARY. Default value is PRIMARY. Possible values are: PRIMARY, SECONDARY"
  type        = string
  validation {
    condition     = can(contains(["PRIMARY", "SECONDARY"], var.cluster_type))
    error_message = "Invalid cluster type. Supported values: PRIMARY, SECONDARY"
  }
  default = "PRIMARY"
}

variable "cluster_user" {
  description = "The initial user for the cluster. Default is 'postgres'."
  type        = string
  default     = "postgres"
}

variable "primary_instance_cidr_range" {
  description = "CIDR range for one authorized network of the instance."
  type        = string
  default     = null
}

variable "primary_instance_database_flags" {
  description = "List of database flags to assign to the instance."
  type        = map(string)
  default = {
    "alloydb.enable_pgaudit"      = "on"
    "log_error_verbosity"         = "verbose"
    "log_connections"             = "on"
    "log_disconnections"          = "on"
    "log_hostname"                = "on"
    "pgaudit.log"                 = "all"
    "password.enforce_complexity" = "on"
  }
}

variable "primary_instance_display_name" {
  description = "User-settable and human-readable display name for the Instance."
  type        = string
}

variable "primary_instance_enable_outbound_public_ip" {
  description = "Whether to enable outbound public IP for the instance. Default is false."
  type        = bool
  default     = false
}

variable "primary_instance_enable_public_ip" {
  description = "Enabling public ip for the instance. If a user wishes to disable this, please also clear the list of the authorized external networks set on the same instance. Default is false."
  type        = bool
  default     = false
}

variable "primary_instance_id" {
  description = "The ID of the alloydb instance."
  type        = string
}

variable "primary_instance_labels" {
  description = "Labels to apply to this instance."
  type        = map(string)
  default     = {}
}

variable "read_pool_instance_cidr_range" {
  description = "CIDR range for one authorized network of the instance."
  type        = string
  default     = null
}

variable "read_pool_instance_database_flags" {
  description = "List of database flags to assign to the instance."
  type        = map(string)
  default = {
    "alloydb.enable_pgaudit" = "on"
    "log_error_verbosity"    = "verbose"
    "log_connections"        = "on"
    "log_disconnections"     = "on"
    "log_hostname"           = "on"
    "pgaudit.log"            = "all"
  }
}

variable "read_pool_instance_display_name" {
  description = "User-settable and human-readable display name for the Instance."
  type        = string
}

variable "read_pool_instance_enable_outbound_public_ip" {
  description = "Whether to enable outbound public IP for the instance. Default is false."
  type        = bool
  default     = false
}

variable "read_pool_instance_enable_public_ip" {
  description = "Enabling public ip for the instance. If a user wishes to disable this, please also clear the list of the authorized external networks set on the same instance. Default is false."
  type        = bool
  default     = false
}

variable "read_pool_instance_id" {
  description = "The ID of the alloydb instance."
  type        = string
}

variable "read_pool_instance_labels" {
  description = "Labels to apply to this instance."
  type        = map(string)
  default     = {}
}

variable "read_pool_instance_node_count" {
  description = "Number of nodes in the read pool."
  type        = number
  default     = 1
}

variable "gcp_alloydb_postgresql_cluster_admin_email" {
  description = "The email address to notify about the asset."
  type        = string
}

variable "gcp_alloydb_postgresql_cluster_audit_pull_enabled" {
  description = "If true, sonargateway will collect the audit logs for this system if it can."
  type        = bool
  default     = false
}

variable "gcp_alloydb_postgresql_cluster_gateway_id" {
  description = "Unique identifier (UID) attached to the jSonar machine controlling the asset"
  type        = string
}

variable "gcp_alloydb_postgresql_cluster_logs_destination_asset_id" {
  description = "The asset_id of the GCP PUSUB asset that this asset is sending its audit logs to."
  type        = string
  default     = null
}

variable "gcp_alloydb_postgresql_cluster_parent_asset_id" {
  description = "The asset_id of the GCP asset representing the GCP account where this data source is located."
  type        = string
  default     = null
}

variable "gcp_alloydb_postgresql_cluster_server_port" {
  description = "Port that the AlloyDB for PostgreSQL instance listens on."
  type        = string
  default     = "5432"
}

variable "gcp_alloydb_postgresql_cluster_auth_mechanism" {
  description = "Specifies the auth mechanism used by the connection"
  type        = string
  default     = null
  validation {
    condition = (
      var.gcp_alloydb_postgresql_cluster_auth_mechanism == null ||
      can(contains(["password"], var.gcp_alloydb_postgresql_cluster_auth_mechanism))
    )
    error_message = "Invalid authentication mechanism. Supported values: password"
  }
}

variable "gcp_alloydb_postgresql_cluster_password" {
  description = "Password to use to connect to the AlloyDB for PostgreSQL instance."
  type        = string
  default     = null
}

variable "gcp_alloydb_postgresql_cluster_reason" {
  description = "Used to differentiate connections that belong to the same asset"
  type        = string
  default     = "default"
}

variable "gcp_alloydb_postgresql_cluster_username" {
  description = "Username of AlloyDB for PostgreSQL database user to connect with."
  type        = string
  default     = null
}

variable "gcp_alloydb_postgresql_admin_email" {
  description = "The email address to notify about the asset."
  type        = string
}

variable "gcp_alloydb_postgresql_audit_pull_enabled" {
  description = "If true, sonargateway will collect the audit logs for this system if it can."
  type        = bool
  default     = false
}

variable "gcp_alloydb_postgresql_gateway_id" {
  description = "Unique identifier (UID) attached to the jSonar machine controlling the asset"
  type        = string
}

variable "gcp_alloydb_postgresql_logs_destination_asset_id" {
  description = "The asset_id of the GCP PUSUB asset that this asset is sending its audit logs to."
  type        = string
  default     = null
}

variable "gcp_alloydb_postgresql_parent_asset_id" {
  description = "The asset_id of the GCP asset representing the GCP account where this data source is located."
  type        = string
  default     = null
}

variable "gcp_alloydb_postgresql_server_port" {
  description = "Port that the AlloyDB for PostgreSQL instance listens on."
  type        = string
  default     = "5432"
}

variable "gcp_alloydb_postgresql_auth_mechanism" {
  description = "Specifies the auth mechanism used by the connection"
  type        = string
  default     = null
  validation {
    condition = (
      var.gcp_alloydb_postgresql_auth_mechanism == null ||
      can(contains(["password"], var.gcp_alloydb_postgresql_auth_mechanism))
    )
    error_message = "Invalid authentication mechanism. Supported values: password"
  }
}

variable "gcp_alloydb_postgresql_password" {
  description = "Password to use to connect to the AlloyDB for PostgreSQL instance."
  type        = string
  default     = null
}

variable "gcp_alloydb_postgresql_reason" {
  description = "Used to differentiate connections that belong to the same asset"
  type        = string
  default     = "default"
}

variable "gcp_alloydb_postgresql_username" {
  description = "Username of AlloyDB for PostgreSQL database user to connect with."
  type        = string
  default     = null
}
