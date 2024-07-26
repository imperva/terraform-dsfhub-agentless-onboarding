variable "description" {
  description = "The description of the rule."
  type        = string
  default     = null
}

variable "name" {
  description = "The name of the rule. If omitted, Terraform will assign a random, unique name."
  type        = string
  default     = null
}

variable "event_pattern" {
  description = "The event pattern described a JSON object. See full documentation of [Events and Event Patterns in EventBridge](https://docs.aws.amazon.com/eventbridge/latest/userguide/eventbridge-and-event-patterns.html) for details."
  type        = any
  default     = null
}

variable "state" {
  description = "State of the rule. Valid values are DISABLED, ENABLED, and ENABLED_WITH_ALL_CLOUDTRAIL_MANAGEMENT_EVENTS."
  type        = string
  default     = "ENABLED"
  validation {
    condition     = contains(["DISABLED", "ENABLED", "ENABLED_WITH_ALL_CLOUDTRAIL_MANAGEMENT_EVENTS"], var.state)
    error_message = "Invalid state. Valid values are DISABLED, ENABLED, and ENABLED_WITH_ALL_CLOUDTRAIL_MANAGEMENT_EVENTS."
  }
}

variable "tags" {
  description = "A map of tags to assign to the resource."
  type        = map(string)
  default     = null
}
