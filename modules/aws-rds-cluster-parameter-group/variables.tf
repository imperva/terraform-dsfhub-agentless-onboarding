variable "name" {
  description = "The name of the DB cluster parameter group"
  type        = string
}

variable "family" {
  description = "The family of the DB cluster parameter group."
  type        = string
}

variable "description" {
  description = "The description of the DB cluster parameter group."
  type        = string
  default     = null
}

variable "parameters" {
  description = "List of objects containing parameters for the DB cluster parameter group."
  type = list(
    object({
      name         = string
      apply_method = optional(string, "immediate")
      value        = any
    })
  )
  default = null
}

variable "tags" {
  description = "A map of tags to assign to the resource."
  type        = map(string)
  default     = null
}
