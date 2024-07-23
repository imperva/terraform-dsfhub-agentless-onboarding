# Cluster Parameter group variables
variable "cluster_parameter_group_name" {
  description = "The name of the DB cluster parameter group"
  type        = string
}

variable "cluster_parameter_group_family" {
  description = "The family of the DB cluster parameter group."
  type        = string
  default     = "aurora-mysql8.0"
}

variable "cluster_parameter_group_description" {
  description = "The description of the DB cluster parameter group."
  type        = string
  default     = "RDS aurora mysql cluster parameter group"
}

variable "cluster_parameter_group_parameters" {
  description = "List of objects containing parameters for the DB cluster parameter group."
  type = list(
    object({
      name         = string
      apply_method = optional(string, "immediate")
      value        = any
    })
  )
  default = [
    {
      name  = "server_audit_logging"
      value = 1
    },
    {
      name  = "server_audit_excl_users"
      value = "rdsadmin"
    },
    {
      name  = "server_audit_events"
      value = "CONNECT,QUERY,QUERY_DCL,QUERY_DDL,QUERY_DML"
    },
    {
      name  = "slow_query_log"
      value = 1
    },
    {
      name  = "long_query_time"
      value = 0
    },
    {
      name  = "log_slow_admin_statements"
      value = 1
    }
  ]
}

variable "cluster_parameter_group_tags" {
  description = "A map of tags to assign to the resource."
  type        = map(string)
  default     = null
}

# Aurora MySQL Cluster variables
variable "cluster_db_enabled_cloudwatch_logs_exports" {
  description = "Set of log types to enable for exporting to CloudWatch logs. Valid values: audit, error, general, slowquery."
  type        = list(any)
  default     = ["audit", "slowquery"]
}

variable "cluster_db_engine" {
  description = "Cluster engine i.e, aurora-mysql"
  type        = string
  default     = "aurora-mysql"
}

variable "cluster_db_engine_version" {
  description = "Database engine version, i.e. 8.0.mysql_aurora.3.05.1"
  type        = string
  default     = "8.0.mysql_aurora.3.04.1"
}

variable "cluster_cluster_id" {
  description = "The name of the aurora mysql cluster"
  type        = string
}

variable "cluster_backup_retention" {
  description = "Days to retain backups for, Default is 1 day."
  type        = number
  default     = 1
}

variable "cluster_db_master_username" {
  description = "Username for the master DB user, must not use rdsadmin as that is reserved."
  type        = string
}

variable "cluster_db_master_password" {
  description = "Password for the master DB user. Note that this may show up in logs, and it will be stored in the state file. Cannot be set if manage_master_user_password is set to true"
  type        = string
}

variable "cluster_network_type" {
  description = " Network type of the cluster. Valid values: IPV4, DUAL"
  type        = string
  default     = "IPV4"
}

variable "cluster_db_subnet_group_name" {
  description = "Name of DB subnet group. DB instance will be created in the VPC associated with the DB subnet group. If unspecified, will be created in the default VPC, or in EC2 Classic, if available."
  type        = string
  default     = null
}

variable "cluster_vpc_security_group_ids" {
  description = "List of VPC security groups to associate."
  type        = list(any)
  default     = null
}

variable "cluster_maintenance_schedule" {
  description = "Weekly time range during which system maintenance can occur, in (UTC)."
  type        = string
  default     = "sun:18:00-sun:21:00"
}

variable "cluster_final_snapshot" {
  description = "Determines whether a final DB snapshot is created before the DB cluster is deleted. If true is specified, no DB snapshot is created. If false is specified, a DB snapshot is created before the DB cluster is deleted, using the value from final_snapshot_identifier. Default is false"
  type        = bool
  default     = true
}
variable "cluster_db_port" {
  description = "Port on which the DB accepts connections."
  type        = number
  default     = 3306
}
variable "cluster_apply_immediately" {
  description = "Specifies whether any cluster modifications are applied immediately, or during the next maintenance window. Default is true"
  type        = bool
  default     = true
}

# Aurora MySQL Instance variables
variable "instance_identifier" {
  description = "The name of the aurora mysql cluster instance"
  type        = string
}

variable "instance_db_instance_class" {
  description = "The instance type of the RDS cluster. Example: 'db.t3.micro'"
  type        = string
  default     = "db.t3.medium"
}

variable "instance_minor_version_upgrade" {
  description = "Indicates that minor engine upgrades will be applied automatically to the DB instance during the maintenance window."
  type        = bool
  default     = false
}

variable "instance_publicly_accessible" {
  description = "If instance is publicly accessible. Default false"
  type        = bool
  default     = false
}

# AWS CloudWatch variables
variable "log_group_retention_in_days" {
  description = "Specifies the number of days you want to retain log events in the specified log group. If you select 0, the events in the log group are always retained and never expire."
  type        = number
  default     = 7
}

# DSFHUB asset variables
variable "aws_aurora_mysql_cluster_admin_email" {
  description = "The email address to notify about the assets."
  type        = string
  default     = null
}

variable "aws_aurora_mysql_cluster_gateway_id" {
  description = "Unique identifier (UID) attached to the jSonar machine controlling the asset"
  type        = string
  default     = null
}

variable "aws_aurora_mysql_cluster_parent_asset_id" {
  description = "The asset_id of the cloud account with auth-mech such as key-pair, iam-role etc."
  type        = string
  default     = null
}

variable "aws_aurora_mysql_cluster_region" {
  description = "AWS region containing the instance."
  type        = string
}

variable "aws_log_group_audit_type" {
  description = "Used to indicate what mechanism should be used to fetch logs on systems supporting multiple ways to get logs, see asset specific documentation for details"
  type        = string
  default     = "LOG_GROUP"
  validation {
    condition     = contains(["AGGREGATED", "LOG_GROUP"], var.aws_log_group_audit_type)
    error_message = "Invalid Value. Select from LOG_GROUP or AGGREGATED."
  }
}

variable "aws_log_group_audit_pull_enabled" {
  description = "Turn on/off auditing on the data source and log aggregator"
  type        = bool
  default     = false
}
