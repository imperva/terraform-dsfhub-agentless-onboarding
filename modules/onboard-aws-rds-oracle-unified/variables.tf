variable "aws_rds_oracle_admin_email" {
  description = "The email address to notify about this asset"
  type        = string
}

variable "aws_rds_oracle_audit_pull_enabled" {
  description = "If true, sonargateway will collect the audit logs for this system if it can."
  type        = bool
  default     = false
}

variable "aws_rds_oracle_audit_type" {
  description = "Used to indicate what mechanism should be used to fetch logs on systems supporting multiple ways to get logs, see asset specific documentation for details"
  type        = string
  default     = "UNIFIED"
  validation {
    condition     = contains(["UNIFIED", "UNIFIED_AGGREGATED"], var.aws_rds_oracle_audit_type)
    error_message = "Invalid Value. Select from UNIFIED, or UNIFIED_AGGREGATED."
  }
}

variable "aws_rds_oracle_auth_mechanism" {
  description = "Specifies the auth mechanism used by the connection"
  type        = string
  default     = "password"
  validation {
    condition     = contains(["password", "oracle_wallet"], var.aws_rds_oracle_auth_mechanism)
    error_message = "Invalid auth mechanism. Pick either password, or oracle_wallet."
  }
}

variable "aws_rds_oracle_dsn" {
  description = "Datasource name to use in odbc.ini. If using the asset for SDM, keep a dummy DSN value."
  type        = string
  default     = null
}

variable "aws_rds_oracle_gateway_id" {
  description = "Unique identifier (UID) attached to the jSonar machine controlling the asset"
  type        = string
}

variable "aws_rds_oracle_password" {
  description = "Password to use to connect to Oracle database. Must not include semicolons."
  type        = string
}

variable "aws_rds_oracle_reason" {
  description = "Used to differentiate connections that belong to the same asset"
  type        = string
  default     = "default"
}

variable "aws_rds_oracle_region" {
  description = "AWS region containing the instance."
  type        = string
  default     = null
}

variable "aws_rds_oracle_username" {
  description = "Username to use to connect to Oracle database."
  type        = string
}

variable "aws_rds_oracle_wallet_dir" {
  description = "Path to the Oracle wallet directory"
  type        = string
  default     = null
}

variable "parameter_group_description" {
  description = "The description of the DB parameter group."
  type        = string
  default     = null
}

variable "parameter_group_family" {
  description = "The family of the DB parameter group. For example, 'oracle-ee', 'postgres', etc."
  type        = string
}

variable "parameter_group_name" {
  description = "The name of the DB parameter group."
  type        = string
  default     = null
}

variable "parameter_group_parameters" {
  description = "List of objects containing parameters for the DB parameter group."
  type = list(
    object({
      name         = string
      apply_method = optional(string, "immediate")
      value        = any
    })
  )
  default = [
    {
      name         = "audit_trail"
      value        = "DB,EXTENDED"
      apply_method = "pending-reboot"
    },
    {
      name         = "audit_sys_operations"
      value        = "TRUE"
      apply_method = "pending-reboot"
    }
  ]
}

variable "parameter_group_tags" {
  description = "A map of tags to assign to the resource."
  type        = map(string)
  default     = null
}

variable "instance_allocated_storage" {
  description = "The allocated storage in gibibytes. If max_allocated_storage is configured, this argument represents the initial storage allocation and differences from the configuration will be ignored automatically when Storage Autoscaling occurs. If replicate_source_db is set, the value is ignored during the creation of the instance."
  type        = number
  default     = 20
}

variable "instance_apply_immediately" {
  description = "Specifies whether any database modifications are applied immediately, or during the next maintenance window."
  type        = bool
  default     = true
}

variable "instance_db_name" {
  description = "The Oracle System ID (SID) of the created RDS Custom DB instance."
  type        = string
  default     = "ORCL"
}

variable "instance_subnet_group_name" {
  description = "Name of DB subnet group. DB instance will be created in the VPC associated with the DB subnet group. If unspecified, will be created in the default VPC, or in EC2 Classic, if available."
  type        = string
}

variable "instance_deletion_protection" {
  description = "If the DB instance should have deletion protection enabled. The database can't be deleted when this value is set to true."
  type        = bool
  default     = false
}

variable "instance_enabled_cloudwatch_logs_exports" {
  description = "Set of log types to enable for exporting to CloudWatch logs. If omitted, no logs will be exported."
  type        = list(string)
  default     = null
}

variable "instance_engine_version" {
  description = "Database engine version, e.g. \"8.0\""
  type        = string
  default     = null
}

variable "instance_final_snapshot_identifier" {
  description = "The name of your final DB snapshot when this DB instance is deleted. Must be provided if skip_final_snapshot is set to false."
  type        = string
  default     = null
}

variable "instance_identifier" {
  description = "Identifier of RDS instance"
  type        = string
}

variable "instance_instance_class" {
  description = "The instance type of the RDS instance."
  type        = string
  default     = "db.t3.small"
}

variable "instance_max_allocated_storage" {
  description = "When configured, the upper limit to which Amazon RDS can automatically scale the storage of the DB instance. Configuring this will automatically ignore differences to allocated_storage."
  type        = number
  default     = null
}

variable "instance_option_group_name" {
  description = "Name of the option group to associate with the RDS instance."
  type        = string
  default     = null
}

variable "instance_password" {
  description = "Password for the master DB user. Note that this may show up in logs, and it will be stored in the state file."
  type        = string
}

variable "instance_port" {
  description = "The port on which the DB accepts connections."
  type        = string
  default     = null
}

variable "instance_publicly_accessible" {
  description = "Bool to control if instance is publicly accessible."
  type        = bool
  default     = true
}

variable "instance_skip_final_snapshot" {
  description = "Determines whether a final DB snapshot is created before the DB instance is deleted. If true is specified, no DBSnapshot is created. If false is specified, a DB snapshot is created before the DB instance is deleted, using the value from final_snapshot_identifier."
  type        = bool
  default     = true
}

variable "instance_tags" {
  description = "A map of tags to assign to the RDS instance."
  type        = map(string)
  default     = null
}

variable "instance_username" {
  description = "Username for the master DB user."
  type        = string
  default     = "admin"
}

variable "instance_vpc_security_group_ids" {
  description = "List of VPC security groups to associate."
  type        = list(string)
  default     = null
}
