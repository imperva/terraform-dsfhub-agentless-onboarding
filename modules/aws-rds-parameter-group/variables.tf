variable "description" {
  description = "The description of the DB parameter group."
  type        = string
  default     = null
}

variable "family" {
  description = "The family of the DB parameter group. For example, 'oracle-ee', 'postgres', etc."
  type        = string
}

variable "name" {
  description = "The name of the DB parameter group."
  type        = string
  default     = null
}

variable "parameters" {
  description = "List of objects containing parameters for the DB parameter group."
  type = list(
    object({
      name         = string
      apply_method = optional(string, "immediate") 
      value        = any
    })
  )
}

variable "tags" {
  description = "A map of tags to assign to the resource."
  type        = map(string)
  default     = null
}
