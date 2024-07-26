variable "policy_document" {
  description = "Details of the resource policy, including the identity of the principal that is enabled to put logs to this account. This is formatted as a JSON string. Maximum length of 5120 characters."
  type        = any
}

variable "policy_name" {
  description = "Name of the resource policy."
  type        = string
}
