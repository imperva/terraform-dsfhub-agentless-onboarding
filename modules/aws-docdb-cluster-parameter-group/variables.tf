variable "description" {
  type        = string
  description = "The description of the DocumentDB cluster parameter group."
  default     = null
}
variable "family" {
  description = "Database family version, e.g. \"docdb5.0\""
  type        = string
  default     = "docdb5.0"
}

variable "name" {
  description = "The name of the DocumentDB cluster parameter group."
  type        = string
  default     = "docdb-parameter-group"
}

variable "parameters" {
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

variable "tags" {
  description = "A map of tags to assign to the cluster."
  type        = map(string)
  default     = null
}
