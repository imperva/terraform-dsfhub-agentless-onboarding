variable "allocated_storage" {
  description = "The allocated storage in gibibytes. If max_allocated_storage is configured, this argument represents the initial storage allocation and differences from the configuration will be ignored automatically when Storage Autoscaling occurs. If replicate_source_db is set, the value is ignored during the creation of the instance."
  type        = number
  default     = 20
}

variable "apply_immediately" {
  description = "Specifies whether any database modifications are applied immediately, or during the next maintenance window."
  type        = bool
  default     = true
}

variable "db_name" {
  description = "The name of the database to create when the DB instance is created."
  type        = string
  default     = "testdb"
}

variable "subnet_group_name" {
  description = "Name of DB subnet group. DB instance will be created in the VPC associated with the DB subnet group. If unspecified, will be created in the default VPC, or in EC2 Classic, if available."
  type        = string
}

variable "deletion_protection" {
  description = "If the DB instance should have deletion protection enabled. The database can't be deleted when this value is set to true."
  type        = bool
  default     = false
}

variable "enabled_cloudwatch_logs_exports" {
  description = "Set of log types to enable for exporting to CloudWatch logs. If omitted, no logs will be exported."
  type        = list(string)
  default     = null
}

variable "engine" {
  description = "The database engine to use. For supported values, see the Engine parameter in https://docs.aws.amazon.com/AmazonRDS/latest/APIReference/API_CreateDBInstance.html"
}

variable "engine_version" {
  description = "Database engine version, e.g. \"8.0\""
  type        = string
  default     = null
}

variable "final_snapshot_identifier" {
  description = "The name of your final DB snapshot when this DB instance is deleted. Must be provided if skip_final_snapshot is set to false."
  type        = string
  default     = null
}

variable "identifier" {
  description = "Identifier of RDS instance"
  type        = string
}

variable "instance_class" {
  description = "The instance type of the RDS instance."
  type        = string
  default     = "db.t3.small"
}

variable "license_model" {
  description = "License model information for this DB instance."
  type        = string
  default     = null
}

variable "max_allocated_storage" {
  description = "When configured, the upper limit to which Amazon RDS can automatically scale the storage of the DB instance. Configuring this will automatically ignore differences to allocated_storage."
  type        = number
  default     = null
}

variable "option_group_name" {
  description = "Name of the option group to associate with the RDS instance."
  type        = string
  default     = null
}

variable "parameter_group_name" {
  description = "Name of the parameter group to associate with the RDS instance."
  type        = string
  default     = null
}

variable "password" {
  description = "Password for the master DB user. Note that this may show up in logs, and it will be stored in the state file."
  type        = string
}

variable "port" {
  description = "The port on which the DB accepts connections."
  type        = string
  default     = null
}

variable "publicly_accessible" {
  description = "Bool to control if instance is publicly accessible."
  type        = bool
  default     = true
}

variable "skip_final_snapshot" {
  description = "Determines whether a final DB snapshot is created before the DB instance is deleted. If true is specified, no DBSnapshot is created. If false is specified, a DB snapshot is created before the DB instance is deleted, using the value from final_snapshot_identifier."
  type        = bool
  default     = true
}

variable "tags" {
  description = "A map of tags to assign to the RDS instance."
  type        = map(string)
  default     = null
}

variable "username" {
  description = "Username for the master DB user."
  type        = string
  default     = "admin"
}

variable "vpc_security_group_ids" {
  description = "List of VPC security groups to associate."
  type        = list(string)
  default     = null
}
