variable "description" {
  description = "The description of the Neptune cluster parameter group."
  type        = string
  default     = null
}

variable "family" {
  description = "The family of the Neptune cluster parameter group."
  type        = string
  default     = null
}

variable "name" {
  description = "The name of the Neptune cluster parameter group."
  type        = string
}

variable "parameters" {
  description = "List of objects containing parameters for the Neptune cluster parameter group."
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