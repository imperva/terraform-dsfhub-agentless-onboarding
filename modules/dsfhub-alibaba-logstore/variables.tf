variable "admin_email" {
  description = "The email address to notify about the asset."
  type        = string
}

variable "asset_display_name" {
  description = "User-friendly name of the asset, defined by user"
  type        = string
}

variable "asset_id" {
  description = "Alibaba log store ARN"
  type        = string
}

variable "audit_pull_enabled" {
  description = "If true, sonargateway will collect the audit logs for this system if it can."
  type        = bool
  default     = false
}

variable "audit_data_type" {
  description = "Used to indicate what mechanism should be used to fetch logs on systems supporting multiple ways to get logs, see asset specific documentation for details"
  type        = string
  default     = null
}

variable "audit_type" {
  description = "Used to indicate what mechanism should be used to fetch logs on systems supporting multiple ways to get logs, see asset specific documentation for details"
  type        = string
  default     = null
}

variable "consumer_group" {
  description = "The name of the consumer group to use for the pull. Only applies to pull_type: consumer_group. Version 4.19+"
  type        = string
  default     = null
}

variable "consumer_group_workers" {
  description = "The number of workers. Has to be an integer between 1 and 64 (inclusive). We also support the string \"dynamic\" which will automatically retrieve the number of shards and set the workers to that number. Defaults to 2."
  type        = string
  default     = "2"
}

variable "consumer_worker_prefix" {
  description = "The prefix to use for the consumer group workers. By default the name of the consumer group is used. Version 4.19+."
  type        = string
  default     = null
}

variable "content_type" {
  description = "When combined with \"content_type\" field, it accepts all the \"audit_type\" fields allowed by the 'parent' asset server_type. Defaults to the associated db asset."
  type        = string
  default     = null
}

variable "endpoint" {
  description = "The endpoint of the Logstore."
  type        = string
}

variable "gateway_id" {
  description = "The jsonarUid unique identifier of the agentless gateway. Example: '7a4af7cf-4292-89d9-46ec-183756ksdjd'."
  type        = string
}

variable "logstore" {
  description = "The name of the Logstore."
  type        = string
}

variable "parent_asset_id" {
  description = "The asset_id that contains this asset (e.g. Asset ID of the database sending audit events). The parent must either be an AWS account, or have a parent which is an AWS account."
  type        = string
}

variable "project" {
  description = "Project separates different resources of multiple users and control access to specific resources."
  type        = string
}

variable "pull_type" {
  description = "The method used to pull data from the logstore. Possible values: \"log_client\", \"consumer_group\". Defaults to \"log_client\"."
  type        = string
  default     = "log_client"
}

variable "region" {
  description = "Alibaba region of the log store"
  type        = string
}
