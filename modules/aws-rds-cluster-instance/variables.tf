variable "identifier" {
  description = "The name of the aurora cluster instance"
  type        = string
}

variable "db_engine" {
  description = "Cluster engine e.g., aurora-mysql"
  type        = string
  default     = null
}

variable "cluster_id" {
  description = "The name of the RDS cluster"
  type        = string
}

variable "publicly_accessible" {
  description = "If instance is publicly accessible. Default false"
  type        = bool
  default     = null
}

variable "db_subnet_group_name" {
  description = "Name of DB subnet group. DB instance will be created in the VPC associated with the DB subnet group. If unspecified, will be created in the default VPC, or in EC2 Classic, if available."
  type        = string
  default     = null
}

variable "db_instance_class" {
  description = "The instance type of the RDS cluster. Example: 'db.t3.micro'"
  type        = string
  default     = null
}

variable "maintenance_schedule" {
  description = "Weekly time range during which system maintenance can occur, in (UTC)."
  type        = string
  default     = null
}

variable "apply_immediately" {
  description = "Specifies whether any cluster modifications are applied immediately, or during the next maintenance window. Default is true"
  type        = bool
  default     = null
}

variable "minor_version_upgrade" {
  description = "Indicates that minor engine upgrades will be applied automatically to the DB instance during the maintenance window."
  type        = bool
  default     = null
}

