variable "gcp_pubsub_admin_email" {
  description = "The email address to notify about the asset."
  type        = string
}

variable "gcp_pubsub_audit_pull_enabled" {
  description = "If true, sonargateway will collect the audit logs for this system if it can."
  type        = bool
  default     = null
}

variable "gcp_pubsub_audit_type" {
  description = "Identifier for the type of audit data contained within the PubSub Subscription. Supported values: ALLOYDB_POSTGRESQL, BIGQUERY, BIGTABLE, GCP_MYSQL_SLOW, MYSQL, MSSQL, POSTGRESQL, SPANNER."
  type        = string
  default     = null
  validation {
    condition = contains(
      [
        "ALLOYDB_POSTGRESQL",
        "BIGQUERY",
        "BIGTABLE",
        "GCP_MYSQL_SLOW",
        "MYSQL",
        "MSSQL",
        "POSTGRESQL",
        "SPANNER"
      ],
      var.gcp_pubsub_audit_type
    )
    error_message = "Invalid audit_type. Supported values: ALLOYDB_POSTGRESQL, BIGQUERY, BIGTABLE, MYSQL, MYSQL_SLOW, MSSQL, POSTGRESQL, SPANNER."
  }
}

variable "gcp_pubsub_auth_mechanism" {
  description = "Specifies the auth mechanism used by the connection. Supported values: default, service_account."
  type        = string
  default     = "default"
  validation {
    condition     = contains(["default", "service_account"], var.gcp_pubsub_auth_mechanism)
    error_message = "Invalid authentication mechanism. Supported values: default, service_account."
  }
}

variable "gcp_pubsub_content_type" {
  description = "Desired 'parent' asset 'Server Type' which is the one tha tuses this asset as a destination for logs. NOTE: The content_type field will take precedence on the lookup for parent_asset_id field when checking which server is sending logs to this asset."
  type        = string
  default     = null
}

variable "gcp_pubsub_gateway_id" {
  description = "Unique identifier (UID) attached to the jSonar machine controlling the asset"
  type        = string
}

variable "gcp_pubsub_key_file" {
  description = "Path to JSON file with credentials info (service account's key) residing on your Agentless Gateway. File must be accessible by the sonarw OS user. Required when auth_mechanism is set to 'service_account'."
  type        = string
  default     = null
}

variable "gcp_pubsub_reason" {
  description = "Used to differentiate connections that belong to the same asset"
  type        = string
  default     = "default"
}

variable "project" {
  description = "The ID of the project to create the resources in. If omitted, the project associated with the provider is used."
  type        = string
  default     = null
}

variable "pubsub_subscription_message_retention_duration" {
  description = "How long to retain unacknowledged messages in the subscription's backlog, from the moment a message is published. If retain_acked_messages is true, then this also configures the retention of acknowledged messages. Defaults to 7 days."
  type        = string
  default     = "604800s"
  validation {
    condition     = can(regex("[0-9]+?s", var.pubsub_subscription_message_retention_duration))
    error_message = "Invalid message_retention_duration. Value must be in the form '123s'"
  }
}

variable "pubsub_subscription_name" {
  description = "Name of the subscription."
  type        = string
}

variable "pubsub_subscription_retain_acked_messages" {
  description = "Indicates whether to retain acknowledged messages. If true, then messages are not expunged from the subscription's backlog, even if they are acknowledged, until they fall out of the messageRetentionDuration window. Defaults to false."
  type        = bool
  default     = false
}

variable "pubsub_topic_name" {
  description = "Name of the topic."
  type        = string
}

variable "sink_router_description" {
  description = "A description of this sink. The maximum length of the description is 8000 characters."
  type        = string
  default     = ""
}

variable "sink_router_exclusions" {
  description = <<EOF
  A list of exclusion objects as defined below.

  exclusion:
  - description: (Optional) A description of this exclusion.
  - filter:  An advanced logs filter that matches the log entries to be excluded.
  - name: A client-assigned identifier for the exclusion filter.
  EOF
  type = list(
    object(
      {
        description = optional(string)
        filter      = string
        name        = string
      }
    )
  )
  default = null
}

variable "sink_router_filter" {
  description = "The filter to apply when exporting logs. Only log entries that match the filter are exported."
  type        = string
}

variable "sink_router_name" {
  description = "The name of the logging sink."
  type        = string
}
