variable "arn" {
  description = "The Amazon Resource Name (ARN) of the target."
  type        = string
}

variable "role_arn" {
  description = "The Amazon Resource Name (ARN) of the IAM role to be used for this target when the rule is triggered."
  type        = string
  default     = null
}

variable "rule" {
  description = "The name of the rule you want to add targets to."
  type        = string
}
