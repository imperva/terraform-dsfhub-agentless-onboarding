variable "description" {
  description = "The description of the DB option group."
  type        = string
  default     = null
}

variable "engine_name" {
  description = "value"
  type        = any
}

variable "major_engine_version" {
  description = "value"
  type        = any
}

variable "name" {
  description = "The name of the DB option group."
  type        = string
}

variable "options" {
  description = "List of objects containing options for the DB option group."
  type = list(
    object({
      option_name = string
      option_settings = optional(
        list(
          object({
            name  = string
            value = string
          })
        ),
        null
      )
      port                           = optional(string, null)
      version                        = optional(string, null)
      db_security_group_memberships  = optional(list(string), null)
      vpc_security_group_memberships = optional(list(string), null)
    })
  )
}

variable "tags" {
  description = "A map of tags to assign to the resource."
  type        = map(string)
  default     = null
}
