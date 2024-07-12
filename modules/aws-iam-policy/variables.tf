variable "name" {
  description = "Name of the policy. If omitted, Terraform will assign a random, unique name."
  type        = string
}

variable "name_prefix" {
  description = "Creates a unique name beginning with the specified prefix. Conflicts with 'name'."
  type        = string
  default     = null
}

variable "description" {
  description = "Description of the IAM policy."
  type        = string
  default     = "Managed by Terraform"
}

variable "path" {
  description = "Path in which to create the policy. Default: '/'"
  type        = string
  default     = "/"
}

variable "policy" {
  description = "The policy document. This is a JSON formatted string."
  type        = string
}

variable "tags" {
  description = "A map of tags to assign to the policy."
  type        = map(string)
  default     = {}
}
