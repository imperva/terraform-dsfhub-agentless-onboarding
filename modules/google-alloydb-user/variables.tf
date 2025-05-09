variable "cluster" {
  description = "Identifies the alloydb cluster. Must be in the format 'projects/{project}/locations/{location}/clusters/{cluster_id}'."
  type        = string
}

variable "password" {
  description = "Password for this database user."
  type        = string
}

variable "user_id" {
  description = "The database role name of the user."
  type        = string
}

variable "user_type" {
  description = "The type of this user. Possible values are: ALLOYDB_BUILT_IN, ALLOYDB_IAM_USER."
  type        = string
  validation {
    condition     = can(contains(["ALLOYDB_BUILT_IN", "ALLOYDB_IAM_USER"], var.user_type))
    error_message = "Invalid user type. Supported values: ALLOYDB_BUILT_IN, ALLOYDB_IAM_USER"
  }
}

variable "database_roles" {
  description = "List of database roles this database user has."
  type        = list(string)
}
