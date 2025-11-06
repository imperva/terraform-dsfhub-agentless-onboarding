variable "log_group_class" {
  description = "Specified the log class of the log group. Possible values are: STANDARD, INFREQUENT_ACCESS, or DELIVERY. Defaults to STANDARD."
  type        = string
  default     = "STANDARD"
  validation {
    condition     = can(regex("^(STANDARD|INFREQUENT_ACCESS|DELIVERY)$", var.log_group_class))
    error_message = "log_group_class must be one of STANDARD, INFREQUENT_ACCESS, or DELIVERY."
  }
}

variable "name" {
  description = "Name of AWS CloudWatch log group"
  type        = string
}

variable "retention_in_days" {
  description = "Specifies the number of days you want to retain log events in the specified log group. Possible values are: 1, 3, 5, 7, 14, 30, 60, 90, 120, 150, 180, 365, 400, 545, 731, 1096, 1827, 2192, 2557, 2922, 3288, 3653, and 0. If you select 0, the events in the log group are always retained and never expire. If log_group_class is set to DELIVERY, this argument is ignored and retention_in_days is forcibly set to 2. Defaults to 7."
  type        = number
  default     = 7
}

variable "skip_destroy" {
  description = "Set to true if you do not wish the log group (and any logs it may contain) to be deleted at destroy time, and instead just remove the log group from the Terraform state. Defaults to false."
  type        = bool
  default     = false
}

variable "tags" {
  description = "A map of tags to assign to the resource. If configured with a provider default_tags configuration block present, tags with matching keys will overwrite those defined at the provider-level."
  type        = map(string)
  default     = null
}
