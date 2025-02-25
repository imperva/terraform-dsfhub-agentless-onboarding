variable "cluster_cluster_id" {
  description = "The ID of the alloydb cluster."
  type        = string
}

variable "cluster_cluster_type" {
  description = "The type of cluster. If not set, defaults to PRIMARY. Default value is PRIMARY. Possible values are: PRIMARY, SECONDARY"
  type        = string
  validation {
    condition     = can(contains(["PRIMARY", "SECONDARY"], var.cluster_type))
    error_message = "Invalid cluster type. Supported values: PRIMARY, SECONDARY"
  }
  default = "PRIMARY"
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

variable "cluster_labels" {
  description = "Labels to apply to backups created using this configuration."
  type        = map(string)
  default     = {}
}

variable "cluster_location" {
  description = "The location where the alloydb cluster should reside."
  type        = string
}

variable "cluster_password" {
  description = "The initial password for the user."
  type        = string
}

variable "cluster_project" {
  description = "The ID of the project in which the resource belongs. If it is not provided, the provider project is used."
  type        = string
}

variable "cluster_subscription_type" {
  description = "The subscription type of cluster. Possible values are: TRIAL, STANDARD. Default value is STANDARD."
  type        = string
  validation {
    condition     = can(contains(["STANDARD", "TRIAL"], var.subscription_type))
    error_message = "Invalid subscription type. Supported values: STANDARD, TRIAL"
  }
  default = "STANDARD"
}

variable "cluster_user" {
  description = "The database username."
  type        = string
}

variable "instance_cluster" {
  description = "Identifies the alloydb cluster. Must be in the format 'projects/{project}/locations/{location}/clusters/{cluster_id}'."
  type        = string
  validation {
    condition     = can(regex("projects/.+/locations/.+/clusters/.+", var.cluster))
    error_message = "Invalid cluster ID. Must be in the format 'projects/{project}/locations/{location}/clusters/{cluster_id}'."
  }
}

variable "instance_database_flags" {
  description = "List of database flags to assign to the instance."
  type = list(
    object(
      {
        name  = string
        value = string
      }
    )
  )
  default = [
    {
      name  = "alloydb.enable_pgaudit"
      value = "on"
    },
    {
      name  = "log_error_verbosity"
      value = "verbose"
    },
    {
      name  = "log_connections"
      value = "on"
    },
    {
      name  = "log_disconnections"
      value = "on"
    },
    {
      name  = "log_hostname"
      value = "on"
    },
    {
      name  = "pgaudit.log"
      value = "all"
    }
    # {
    #   name  = "log_line_prefix"
    #   value = "SONAR_AUDIT=1|TIMESTAMP=%m|APPLICATION_NAME=%a|USER=%u|DATABASE=%d|REMOTE_HOST_AND_PORT=%r|SQL_STATE=%e|SESSION_ID=%c|SESSION_START=%s|PROCESS_ID=[%p]|VIRTUAL_TRANSACTION_ID=%v|TRANSACTION_ID=%x| "
    # }
  ]
}

variable "instance_display_name" {
  description = "User-settable and human-readable display name for the Instance."
  type        = string
}

variable "instance_instance_id" {
  description = "The ID of the alloydb instance."
  type        = string
}

variable "instance_instance_type" {
  description = "The type of the instance. If the instance type is READ_POOL, provide the associated PRIMARY/SECONDARY instance in the depends_on meta-data attribute. If the instance type is SECONDARY, point to the cluster_type of the associated secondary cluster instead of mentioning SECONDARY. Example: {instance_type = google_alloydb_cluster..cluster_type} instead of {instance_type = SECONDARY} If the instance type is SECONDARY, the terraform delete instance operation does not delete the secondary instance but abandons it instead. Use deletion_policy = \"FORCE\" in the associated secondary cluster and delete the cluster forcefully to delete the secondary cluster as well its associated secondary instance. Users can undo the delete secondary instance action by importing the deleted secondary instance by calling terraform import. Possible values are: PRIMARY, READ_POOL, SECONDARY."
  type        = string
  default     = "PRIMARY"
  validation {
    condition     = can(contains(["PRIMARY", "READ_POOL", "SECONDARY"], var.instance_type))
    error_message = "Invalid instance type. Supported values: PRIMARY, READ_POOL, SECONDARY"
  }
}

variable "instance_labels" {
  description = "Labels to apply to this instance."
  type        = map(string)
  default     = {}
}

variable "gcp_alloydb_postgresql_cluster_admin_email" {
  description = "The email address to notify about the asset."
  type        = string
}

variable "gcp_alloydb_postgresql_cluster_asset_display_name" {
  description = "User-friendly name of the asset, defined by user"
  type        = string
}

variable "gcp_alloydb_postgresql_cluster_asset_id" {
  description = "Unique identifier for the AlloyDB for PostgreSQL database service in the form 'projects/<project>/locations/<location>/clusters/<cluster_id>/instances/<instance_id>'."
  type        = string
  validation {
    condition     = can(regex("projects/.+/locations/.+/clusters/.+/instances/.+", var.asset_id))
    error_message = "Invalid asset ID. Must be in the form 'projects/<project>/locations/<location>/clusters/<cluster_id>/instances/<instance_id>'."
  }
}

variable "gcp_alloydb_postgresql_cluster_audit_pull_enabled" {
  description = "If true, sonargateway will collect the audit logs for this system if it can."
  type        = bool
  default     = false
}

variable "gcp_alloydb_postgresql_cluster_cluster_id" {
  description = "The name of the AlloyDB for PostgreSQL cluster"
  type        = string
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

variable "gcp_alloydb_postgresql_cluster_pubsub_subscription" {
  description = "ID of the Google PubSub Subscription containing the AlloyDB for PostgreSQL audit logs in the form 'projects/{{project}}/subscriptions/{{name}}'."
  type        = string
  validation {
    condition     = can(regex("projects/.+/subscriptions/.+", var.pubsub_subscription))
    error_message = "Invalid pubsub subscription ID. Must be in the form 'projects/{{project}}/subscriptions/{{name}}'."
  }
}

variable "gcp_alloydb_postgresql_cluster_server_host_name" {
  description = "Hostname of the AlloyDB for PostgreSQL instance."
  type        = string
}

variable "gcp_alloydb_postgresql_cluster_server_ip" {
  description = "IP address / hostname of the AlloyDB for PostgreSQL instance."
  type        = string
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
      var.auth_mechanism == null ||
      can(contains(["password"], var.auth_mechanism))
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

variable "gcp_alloydb_postgresql_asset_display_name" {
  description = "User-friendly name of the asset, defined by user"
  type        = string
}

variable "gcp_alloydb_postgresql_asset_id" {
  description = "Unique identifier for the AlloyDB for PostgreSQL database service in the form 'projects/<project>/locations/<location>/clusters/<cluster_id>/instances/<instance_id>'."
  type        = string
  validation {
    condition     = can(regex("projects/.+/locations/.+/clusters/.+/instances/.+", var.asset_id))
    error_message = "Invalid asset ID. Must be in the form 'projects/<project>/locations/<location>/clusters/<cluster_id>/instances/<instance_id>'."
  }
}

variable "gcp_alloydb_postgresql_audit_pull_enabled" {
  description = "If true, sonargateway will collect the audit logs for this system if it can."
  type        = bool
  default     = false
}

variable "gcp_alloydb_postgresql_cluster_id" {
  description = "The name of the AlloyDB for PostgreSQL cluster"
  type        = string
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

variable "gcp_alloydb_postgresql_pubsub_subscription" {
  description = "ID of the Google PubSub Subscription containing the AlloyDB for PostgreSQL audit logs in the form 'projects/{{project}}/subscriptions/{{name}}'."
  type        = string
  validation {
    condition     = can(regex("projects/.+/subscriptions/.+", var.pubsub_subscription))
    error_message = "Invalid pubsub subscription ID. Must be in the form 'projects/{{project}}/subscriptions/{{name}}'."
  }
}

variable "gcp_alloydb_postgresql_server_host_name" {
  description = "Hostname of the AlloyDB for PostgreSQL instance."
  type        = string
}

variable "gcp_alloydb_postgresql_server_ip" {
  description = "IP address / hostname of the AlloyDB for PostgreSQL instance."
  type        = string
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
      var.auth_mechanism == null ||
      can(contains(["password"], var.auth_mechanism))
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
