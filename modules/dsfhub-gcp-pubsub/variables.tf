variable "admin_email" {
  description = "The email address to notify about the asset."
  type        = string
}

variable "asset_display_name" {
  description = "User-friendly name of the asset, defined by user"
  type        = string
}

variable "asset_id" {
  description = "Unique identifier of the Google PubSub Subscription in the form 'projects/{{project}}/subscriptions/{{name}}'."
  type        = string
}

variable "audit_pull_enabled" {
  description = "If true, sonargateway will collect the audit logs for this system if it can."
  type        = bool
  default     = false
}

variable "audit_type" {
  description = "Identifier for the type of audit data contained within the PubSub Subscription. Supported values: ALLOYDB_POSTGRESQL, BIGQUERY, BIGTABLE, MYSQL, MYSQL_SLOW, MSSQL, POSTGRESQL, SPANNER."
  type        = string
  default     = null
  validation {
    condition = contains(
      [
        "ALLOYDB_POSTGRESQL",
        "BIGQUERY",
        "BIGTABLE",
        "MYSQL",
        "MYSQL_SLOW",
        "MSSQL",
        "POSTGRESQL",
        "SPANNER"
      ],
      var.audit_type
    )
    error_message = "Invalid audit_type. Supported values: ALLOYDB_POSTGRESQL, BIGQUERY, BIGTABLE, MYSQL, MYSQL_SLOW, MSSQL, POSTGRESQL, SPANNER."
  }
}

variable "auth_mechanism" {
  description = "Specifies the auth mechanism used by the connection. Supported values: default, service_account."
  type        = string
  default     = "default"
  validation {
    condition     = contains(["default", "service_account"], var.auth_mechanism)
    error_message = "Invalid authentication mechanism. Supported values: default, service_account."
  }
}

variable "gateway_id" {
  description = "Unique identifier (UID) attached to the jSonar machine controlling the asset"
  type        = string
}

variable "key_file" {
  description = "Path to JSON file with credentials info (service account's key) residing on your Agentless Gateway. File must be accessible by the sonarw OS user. Required when auth_mechanism is set to 'service_account'."
  type        = string
  default     = null
}

variable "pubsub_subscription" {
  description = "ID of the Google PubSub Subscription in the form 'projects/{{project}}/subscriptions/{{name}}'."
  type        = string
  validation {
    condition     = can(regex("projects/.+/subscriptions/.+", var.pubsub_subscription))
    error_message = "Invalid pubsub subscription ID. Must be in the form 'projects/{{project}}/subscriptions/{{name}}'."
  }
}

variable "reason" {
  description = "Used to differentiate connections that belong to the same asset"
  type        = string
  default     = "default"
}
