variable "members" {
  description = "Identities that will be granted the privilege in role. See the [Google documentation](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/google_service_account_iam#member/members) for a list of possible values."
  type        = list(string)
  validation {
    condition = alltrue([
      for m in var.members : (
        m == "allUsers" ||
        m == "allAuthenticatedUsers" ||
        startswith(m, "user:") ||
        startswith(m, "serviceAccount:") ||
        startswith(m, "group:") ||
        startswith(m, "domain:")
      )
    ])
    error_message = "One or more 'member' values is invalid."
  }
}

variable "role" {
  description = "The role that should be applied."
  type        = string
}

variable "service_account_id" {
  description = "The fully-qualified name of the service account to apply the policy to."
  type        = string
}
