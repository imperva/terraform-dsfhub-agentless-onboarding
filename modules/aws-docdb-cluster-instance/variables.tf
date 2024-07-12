variable "apply_immediately" {
  description = "Specifies whether any cluster modifications are applied immediately, or during the next maintenance window."
  type        = bool
  default     = true
}

variable "cluster_identifier" {
  description = "Identifier of AWS DocumentDB Cluster."
  type        = string
}

variable "instance_count" {
  description = "The number of instances to create in the DocumentDB cluster."
  type        = number
  default     = 1
}

variable "instance_class" {
  description = "The instance type of the DocumentDB cluster. Example: 'db.r5.large'. Reference: https://docs.aws.amazon.com/documentdb/latest/developerguide/db-instance-classes.html#db-instance-class-specs"
  type        = string
  default     = "db.r5.large"
}

variable "promotion_tier" {
  description = "Failover Priority setting on instance level. The reader who has lower tier has higher priority to get promoted to a writer in case of failover."
  type        = number
  default     = 0
}

variable "tags" {
  description = "A map of tags to assign to the DocumentDB instance."
  type        = map(string)
  default     = null
}
