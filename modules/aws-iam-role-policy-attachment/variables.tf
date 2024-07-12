variable "role" {
  description = "The IAM role to attach the policy to."
  type        = string
}

variable "policy_arn" {
  description = "The ARN of the IAM policy you want to apply."
  type        = string
}
