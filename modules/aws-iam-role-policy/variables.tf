variable "name" {
  description = "The name of the role policy. If omitted, Terraform will assign a random, unique name."
  type        = string
}

variable "policy" {
  description = "The inline policy document. This is a JSON formatted string. For more information about building IAM policy documents with Terraform, see the [AWS IAM Policy Document Guide](https://learn.hashicorp.com/terraform/aws/iam-policy)"
  type        = string
}

variable "role" {
  description = "The name of the IAM role to attach to the policy."
  type        = string
}
