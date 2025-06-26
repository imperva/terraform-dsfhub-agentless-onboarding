variable "assume_role_policy" {
  description = "The policy that grants an entity permission to assume the role."
  type        = string
}

variable "description" {
  description = "The description of the IAM role."
  type        = string
  default     = null
}

variable "force_detach_policies" {
  description = "Specifies whether to force detaching any policies the role has before destroying it. Defaults to false."
  type        = bool
  default     = false
}

variable "max_session_duration" {
  description = "The maximum session duration (in seconds) that you want to set for the specified role. If you do not specify a value for this setting, the default maximum of one hour is applied. This setting can have a value from 1 hour to 12 hours."
  type        = number
  default     = 3600
}

variable "name" {
  description = "Friendly name of the role. If omitted, Terraform will assign a random, unique name. Forces new resource."
  type        = string
}

variable "name_prefix" {
  description = "Creates a unique friendly name beginning with the specified prefix. Conflicts with 'name'. Forces new resources."
  type        = string
  default     = null
}

variable "path" {
  description = "The path to the role. For more information about paths, see IAM Identifiers in the IAM User Guide."
  type        = string
  default     = "/"
}

variable "permissions_boundary" {
  description = "The ARN of the policy that is used to set the permissions boundary for the role."
  type        = string
  default     = null
}

variable "tags" {
  description = "Key-value mapping of tags for the IAM role."
  type        = map(string)
  default     = null
}
