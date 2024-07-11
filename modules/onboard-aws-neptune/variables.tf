#AWS neptune cluster parameter group variables
variable "parameter_group_description" {
  description = "Neptune cluster parameter group"
  type        = string
  default     = "Neptune cluster parameter group"
}

variable "parameter_group_family" {
  description = "The family of the cluster parameter group."
  type        = string
  default     = "neptune1.3"
}

variable "parameter_group_name" {
  description = "The name of the cluster parameter group."
  type        = string
}

variable "parameter_group_parameters" {
  description = "List of objects containing parameters for the cluster parameter group."
  type = list(
    object({
      name         = string
      apply_method = optional(string, "immediate")
      value        = any
    })
  )
  default = [
    {
      name         = "neptune_enable_audit_log"
      value        = 1
      apply_method = "pending-reboot"
    }
  ]
}

variable "parameter_group_tags" {
  description = "A map of tags to assign to the resource."
  type        = map(string)
  default     = null
}

#AWS Neptune cluster variables 
variable "cluster_identifier" {
  description = "The cluster identifier"
  type        = string
}

variable "cluster_engine" {
  description = "The name of the database engine to be used for this Neptune cluster."
  type        = string
  default     = "neptune"
}

variable "cluster_engine_version" {
  description = "The database engine version."
  type        = string
  default     = "1.3.2.0"
}

variable "cluster_backup_retention_period" {
  description = "The days to retain backups for. Default is 1"
  type        = number
  default     = 1
}

variable "cluster_skip_final_snapshot" {
  description = "Determines whether a final Neptune snapshot is created before the Neptune cluster is deleted. If true is specified, no Neptune snapshot is created. If false is specified, a Neptune snapshot is created before the Neptune cluster is deleted, using the value from final_snapshot_identifier"
  type        = bool
  default     = true
}

variable "cluster_apply_immediately" {
  description = "Specifies whether any cluster modifications are applied immediately, or during the next maintenance window. "
  type        = bool
  default     = true
}

variable "cluster_enable_cloudwatch_logs_exports" {
  description = "A list of the log types this DB cluster is configured to export to Cloudwatch Logs. Currently only supports audit and slowquery"
  type        = list(string)
  default     = ["audit"]
}

variable "cluster_storage_type" {
  description = "Storage type associated with the cluster. Default: standard"
  type        = string
  default     = "standard"
  validation {
    condition     = contains(["standard", "standard/iopt1"], var.cluster_storage_type)
    error_message = "Invalid value. Pick either standard or standard/iopt1"
  }
}

variable "cluster_iam_database_authentication_enabled" {
  description = " Specifies whether or not mappings of AWS Identity and Access Management (IAM) accounts to database accounts is enabled."
  type        = bool
  default     = true
}

variable "cluster_preferred_maintenance_window" {
  description = "Weekly time range during which system maintenance can occur, in (UTC)."
  type        = string
  default     = "sun:18:00-sun:21:00"
}

variable "cluster_vpc_security_group_ids" {
  description = "List of VPC security groups to associate with the Cluster"
  type        = list(string)
  default     = null
}

#AWS Neptune instance variables
variable "instance_apply_immediately" {
  description = "Specifies whether any instance modifications are applied immediately, or during the next maintenance window."
  type        = bool
  default     = true
}

variable "instance_auto_minor_version_upgrade" {
  description = "Indicates that minor engine upgrades will be applied automatically to the instance during the maintenance window. Default is true"
  type        = bool
  default     = false
}

variable "instance_identifier" {
  description = "The identifier for the neptune instance."
  type        = string
}

variable "instance_class" {
  description = "The instance class to use."
  type        = string
  default     = "db.t3.medium"
}

variable "instance_neptune_subnet_group_name" {
  description = "A subnet group to associate with this neptune instance. NOTE: This must match the neptune_subnet_group_name of the attached aws_neptune_cluster"
  type        = string
  default     = null
}

variable "instance_neptune_parameter_group_name" {
  description = "The name of the neptune parameter group to associate with this instance"
  type        = string
  default     = "default.neptune1"
}

variable "instance_port" {
  description = "The port on which the DB accepts connections. Defaults to 8182"
  type        = number
  default     = 8182
}

variable "instance_publicly_accessible" {
  description = "Bool to control if instance is publicly accessible. Default is false"
  type        = bool
  default     = false
}

#AWS cloudwatch variables
variable "log_group_retention_in_days" {
  description = "Specifies the number of days you want to retain log events in the specified log group. If you select 0, the events in the log group are always retained and never expire."
  type        = number
  default     = 7
}

#DSFHUB variables
variable "aws_neptune_cluster_admin_email" {
  description = "The email address to notify about this asset"
  type        = string
}

variable "aws_neptune_cluster_gateway_id" {
  description = "Unique identifier (UID) attached to the jSonar machine controlling the asset"
  type        = string
}

variable "aws_neptune_cluster_parent_asset_id" {
  description = "The asset_id of AWS cloud account being used. E.g. Key-pair, iam_role, profile or default"
  type        = string
}

variable "aws_neptune_cluster_region" {
  description = "AWS region containing the instance."
  type        = string
}

variable "aws_log_group_audit_pull_enabled" {
  description = "If true, sonargateway will collect the audit logs for this system if it can."
  type        = bool
  default     = false
}



