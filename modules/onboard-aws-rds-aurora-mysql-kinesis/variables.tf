variable "aws_aurora_mysql_cluster_admin_email" {
  description = "The email address to notify about this asset"
  type        = string
}

variable "aws_aurora_mysql_cluster_parent_asset_id" {
  description = "The asset_id of the cloud account with auth-mech such as key-pair, iam-role etc."
  type        = string
}

variable "aws_aurora_mysql_cluster_region" {
  description = "AWS region containing the cluster."
  type        = string
  default     = null
}

variable "aws_aurora_mysql_cluster_gateway_id" {
  description = "Unique identifier (UID) attached to the jSonar machine controlling the asset"
  type        = string
}

variable "aws_kinesis_admin_email" {
  description = "The email address to notify about the asset."
  type        = string
}

variable "aws_kinesis_audit_pull_enabled" {
  description = "If true, sonargateway will collect the audit logs for this system if it can."
  type        = bool
  default     = false
}

variable "aws_kinesis_gateway_id" {
  description = "The jsonarUid unique identifier of the agentless gateway. Example: '7a4af7cf-4292-89d9-46ec-183756ksdjd'."
  type        = string
}

variable "aws_kinesis_reason" {
  description = "Used to differentiate connections that belong to the same asset"
  type        = string
  default     = "default"
}

variable "aws_kinesis_region" {
  description = "AWS region of the kinesis stream"
  type        = string
  default     = null
}

variable "cluster_db_enabled_cloudwatch_logs_exports" {
  description = "Set of log types to enable for exporting to CloudWatch logs. Valid values: audit, error, general, slowquery."
  type        = list(any)
  default     = null
}

variable "cluster_db_engine_version" {
  description = "Database engine version, i.e. 8.0.mysql_aurora.3.05.1"
  type        = string
  default     = null
}

variable "cluster_id" {
  description = "The name of the Aurora MySQL cluster"
  type        = string
}

variable "cluster_backup_retention" {
  description = "Days to retain backups for, Default is 1 day."
  type        = number
  default     = null
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
  default     = null
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
  default     = null
}

variable "cluster_final_snapshot" {
  description = "Determines whether a final DB snapshot is created before the DB cluster is deleted. If true is specified, no DB snapshot is created. If false is specified, a DB snapshot is created before the DB cluster is deleted, using the value from final_snapshot_identifier. Default is false"
  type        = bool
  default     = null
}

variable "cluster_db_port" {
  description = "Port on which the DB accepts connections."
  type        = number
  default     = null
}

variable "cluster_apply_immediately" {
  description = "Specifies whether any cluster modifications are applied immediately, or during the next maintenance window. Default is true"
  type        = bool
  default     = null
}

variable "cluster_parameter_group_name" {
  description = "Cluster parameter group associated with the cluster"
  type        = string
  default     = null
}

variable "instance_identifier" {
  description = "The name of the aurora mysql cluster instance"
  type        = string
}

variable "instance_publicly_accessible" {
  description = "If instance is publicly accessible. Default false"
  type        = bool
  default     = null
}

variable "db_instance_class" {
  description = "The instance type of the RDS cluster. Supported instance classes for database activity streams can be found at https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/DBActivityStreams.Overview.html#DBActivityStreams.Overview.requirements.classes."
  type        = string
  default     = "db.r5.large"
  validation {
    # Class must be one of supported for database activity streams
    condition = (
      can(regex("^db.r7g.*large$", var.db_instance_class)) ||
      can(regex("^db.r6g.*large$", var.db_instance_class)) ||
      can(regex("^db.r6i.*large$", var.db_instance_class)) ||
      can(regex("^db.r5.*large$", var.db_instance_class)) ||
      can(regex("^db.x2g.*$", var.db_instance_class))
    )
    error_message = "Invalid instance class for database activity streams. Supported instance classes for database activity streams can be found at https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/DBActivityStreams.Overview.html#DBActivityStreams.Overview.requirements.classes."
  }
}

variable "instance_maintenance_schedule" {
  description = "Weekly time range during which system maintenance can occur, in (UTC)."
  type        = string
  default     = null
}

variable "instance_apply_immediately" {
  description = "Specifies whether any cluster modifications are applied immediately, or during the next maintenance window. Default is true"
  type        = bool
  default     = true
}

variable "instance_minor_version_upgrade" {
  description = "Indicates that minor engine upgrades will be applied automatically to the DB instance during the maintenance window."
  type        = bool
  default     = null
}

variable "key_custom_master_key_spec" {
  description = "Specifies whether the key contains a symmetric key or an asymmetric key pair and the encryption algorithms or signing algorithms that the key supports. Valid values: SYMMETRIC_DEFAULT, RSA_2048, RSA_3072, RSA_4096, HMAC_256, ECC_NIST_P256, ECC_NIST_P384, ECC_NIST_P521, or ECC_SECG_P256K1."
  type        = string
  default     = "SYMMETRIC_DEFAULT"
}

variable "key_deletion_window_in_days" {
  description = "The waiting period, specified in number of days. After the waiting period ends, AWS KMS deletes the KMS key. If you specify a value, it must be between 7 and 30, inclusive."
  type        = number
  default     = 30
}

variable "key_description" {
  description = "The description of the key as viewed in AWS console."
  type        = string
  default     = "AWS KMS Key to encrypt Aurora Mysql Database Activity Stream."
}

variable "key_is_enabled" {
  description = "Specifies whether the key is enabled."
  type        = bool
  default     = true
}

variable "key_usage" {
  description = "Specifies the intended use of the key. Valid values: ENCRYPT_DECRYPT, SIGN_VERIFY, GENERATE_VERIFY_MAC."
  type        = string
  default     = "ENCRYPT_DECRYPT"
}

variable "key_multi_region" {
  description = " Indicates whether the KMS key is a multi-Region (true) or regional (false) key."
  type        = bool
  default     = false
}

variable "key_tags" {
  description = "A map of tags to assign to the object."
  type        = map(string)
  default     = null
}

variable "stream_mode" {
  description = "Specifies the mode of the database activity stream. Database events such as a change or access generate an activity stream event. The database session can handle these events either synchronously or asynchronously. One of: sync, async."
  type        = string
  default     = "async"
  validation {
    condition     = contains(["sync", "async"], var.stream_mode)
    error_message = "Invalid value, select either 'sync' or 'async'."
  }
}

