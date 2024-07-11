variable "description" {
  description = "The description of the Redshift parameter group."
  type        = string
  default     = null
}

variable "family" {
  description = "The family of the Redshift parameter group."
  type        = string
  default     = "redshift-1.0"
}

variable "name" {
  description = "The name of the Redshift parameter group."
  type        = string
}

variable "parameters" {
  description = "A list of Redshift parameters to apply."
  type = list(
    object({
      name  = string
      value = any
    })
  )
  default = [{
    name  = "enable_user_activity_logging"
    value = "true"
  }]
}

variable "tags" {
  description = "A map of tags to assign to the resource."
  type        = map(string)
  default     = null
}
