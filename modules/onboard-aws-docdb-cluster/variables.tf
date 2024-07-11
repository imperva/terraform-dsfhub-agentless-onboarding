# AWS DocumentDB Parameter Group variables
variable "parameter_group_description" {
  description = "The description of the DocumentDB cluster parameter group."
  type        = string
  default     = "Managed by Terraform"
}

variable "parameter_group_family" {
  description = "Database family version, e.g. \"docdb5.0\""
  type        = string
  default     = "docdb5.0"
}

variable "parameter_group_name" {
  description = "The name of the DocumentDB cluster parameter group."
  type        = string
  default     = "docdb-parameter-group"
}

variable "parameter_group_parameters" {
  description = "List of objects containing parameters for the DocumentDB parameter group."
  type = list(
    object({
      name         = string
      apply_method = optional(string, "immediate")
      value        = any
    })
  )
  default = [{
    name         = "audit_logs"
    value        = "all"
    apply_method = "immediate"
  }]
}

variable "parameter_group_tags" {
  description = "A map of tags to assign to the cluster."
  type        = map(string)
  default     = null
}

# AWS DocumentDB Cluster and AWS DocumentDB Instance shared variables
variable "cluster_identifier" {
  description = "Identifier of DocumentDB Cluster."
  type        = string
}

# AWS DocumentDB Cluster variables
variable "cluster_apply_immediately" {
  description = "Specifies whether any cluster modifications are applied immediately, or during the next maintenance window."
  type        = bool
  default     = true
}

variable "cluster_db_subnet_group_name" {
  description = "A DB subnet group to associate with this DB instance."
  type        = string
}

variable "cluster_deletion_protection" {
  description = "A value that indicates whether the DB cluster has deletion protection enabled. The database can't be deleted when deletion protection is enabled."
  type        = bool
  default     = false
}

variable "cluster_enabled_cloudwatch_logs_exports" {
  description = "List of log types to export to CloudWatch."
  type        = list(string)
  default     = ["audit"]
  validation {
    condition     = alltrue([for log in var.cluster_enabled_cloudwatch_logs_exports : log == "audit" || log == "profiler"])
    error_message = "Invalid value in cluster_enabled_cloudwatch_logs_exports. Allowed values are (audit, profiler)."
  }
  validation {
    condition     = length(var.cluster_enabled_cloudwatch_logs_exports) == length(distinct(var.cluster_enabled_cloudwatch_logs_exports))
    error_message = "Duplicate item in cluster_enabled_cloudwatch_logs_exports. Allowed values are 'audit' or 'profiler'. Please ensure that each log type is unique."
  }
}

variable "cluster_engine_version" {
  description = "Database engine version, e.g. \"5.0.0\""
  type        = string
  default     = "5.0.0"
}

variable "cluster_final_snapshot_identifier" {
  description = "The name of your final DB snapshot when this DB cluster is deleted. If omitted, no final snapshot will be made. Must be provided if skip_final_snapshot is set to false."
  type        = string
  default     = null
}

variable "cluster_master_password" {
  description = "Password for the master DB user."
  type        = string
}

variable "cluster_master_username" {
  description = "Master DB username."
  type        = string
  default     = "docdb"
}

variable "cluster_port" {
  description = "The port on which the DB accepts connections."
  type        = number
  default     = 27017
}

variable "cluster_skip_final_snapshot" {
  description = "Determines whether a final DB snapshot is created before the DB cluster is deleted. If true is specified, no DB snapshot is created. If false is specified, a DB snapshot is created before the DB cluster is deleted, using the value from final_snapshot_identifier"
  type        = bool
  default     = true
}

variable "cluster_storage_type" {
  description = "The storage type to associate with the DB cluster."
  type        = string
  default     = "standard"
  validation {
    condition     = can(regex("^(iopt1|standard)$", var.cluster_storage_type))
    error_message = "Invalid value for storage_type. Allowed values are 'iopt1' or 'standard'."
  }
}

variable "cluster_tags" {
  description = "A map of tags to assign to the DB cluster."
  type        = map(string)
  default     = null
}

variable "cluster_vpc_security_group_ids" {
  description = "List of VPC security groups to associate with the Cluster"
  type        = list(string)
}

# AWS DocumentDB Instance variables
variable "instance_apply_immediately" {
  description = "Specifies whether any cluster modifications are applied immediately, or during the next maintenance window."
  type        = bool
  default     = true
}

variable "instance_count" {
  description = "The number of instances to create in the DocumentDB cluster."
  type        = number
  default     = 1
}

variable "instance_instance_class" {
  description = "The instance type of the DocumentDB cluster. Example: 'db.r5.large'. Reference: https://docs.aws.amazon.com/documentdb/latest/developerguide/db-instance-classes.html#db-instance-class-specs"
  type        = string
  default     = "db.r5.large"
}

variable "instance_promotion_tier" {
  description = "Failover Priority setting on instance level. The reader who has lower tier has higher priority to get promoted to a writer in case of failover."
  type        = number
  default     = 0
}

variable "instance_tags" {
  description = "A map of tags to assign to the DocumentDB instance."
  type        = map(string)
  default     = null
}

# AWS CloudWatch Log Group variables
variable "log_group_retention_in_days" {
  description = "The number of days to retain log events."
  type        = number
  default     = 7
}

# DSFHUB AWS DocumentDB Cluster asset variables
variable "aws_docdb_cluster_admin_email" {
  description = "The email address to notify about the asset."
  type        = string
}

variable "aws_docdb_cluster_gateway_id" {
  description = "Unique identifier (UID) attached to the jSonar machine controlling the asset"
  type        = string
}

variable "aws_docdb_cluster_region" {
  description = "AWS region of the DocumentDB Cluster."
  type        = string
}

variable "aws_docdb_cluster_parent_asset_id" {
  description = "The asset_id that contains this asset (e.g. Asset ID of the database sending audit events)"
  type        = string
}

# DSFHUB CloudWatch Log Group variables
variable "aws_log_group_admin_email" {
  description = "The email address to notify about the asset."
  type        = string
}

variable "aws_log_group_audit_pull_enabled" {
  description = "If true, sonargateway will collect the audit logs for this system if it can."
  type        = bool
  default     = false
}

variable "aws_log_group_gateway_id" {
  description = "Unique identifier (UID) attached to the jSonar machine controlling the asset"
  type        = string
}

variable "aws_log_group_reason" {
  description = "Used to differentiate connections that belong to the same asset"
  type        = string
  default     = "default"
}

variable "aws_log_group_region" {
  description = "AWS region of the log group"
  type        = string
}
