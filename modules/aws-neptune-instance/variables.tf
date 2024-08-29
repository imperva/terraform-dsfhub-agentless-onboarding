variable "apply_immediately" {
  description = "Specifies whether any instance modifications are applied immediately, or during the next maintenance window."
  type        = bool
  default     = null
}

variable "auto_minor_version_upgrade" {
  description = "Indicates that minor engine upgrades will be applied automatically to the instance during the maintenance window."
  type        = bool
  default     = null
}

variable "cluster_identifier" {
  description = "The identifier of the aws_neptune_cluster in which to launch this instance."
  type        = string
  default     = null
}

variable "identifier" {
  description = "The identifier for the neptune instance."
  type        = string
}

variable "class" {
  description = "The instance class to use."
  type        = string
  default     = null
}

variable "neptune_subnet_group_name" {
  description = "A subnet group to associate with this neptune instance. NOTE: This must match the neptune_subnet_group_name of the attached aws_neptune_cluster"
  type        = string
  default     = null
}

variable "neptune_parameter_group_name" {
  description = "The name of the neptune parameter group to associate with this instance"
  type        = string
  default     = null
}

variable "port" {
  description = "The port on which the DB accepts connections."
  type        = number
  default     = null
}

variable "publicly_accessible" {
  description = "Bool to control if instance is publicly accessible."
  type        = bool
  default     = null
}
