variable "allocated_ip_range" {
  description = "The name of the allocated IP range for the private IP AlloyDB cluster. For example: 'google-managed-services-default'. If set, the instance IPs for this cluster will be created in the allocated range."
  type        = string
  default     = null
}

variable "cluster_id" {
  description = "The ID of the alloydb cluster."
  type        = string
}

variable "cluster_type" {
  description = "The type of cluster. If not set, defaults to PRIMARY. Default value is PRIMARY. Possible values are: PRIMARY, SECONDARY"
  type        = string
  validation {
    condition     = can(contains(["PRIMARY", "SECONDARY"], var.cluster_type))
    error_message = "Invalid cluster type. Supported values: PRIMARY, SECONDARY"
  }
  default = "PRIMARY"
}

variable "database_version" {
  description = "The database engine major version. This is an optional field and it's populated at the Cluster creation time. Note: Changing this field to a higer version results in upgrading the AlloyDB cluster which is an irreversible change."
  type        = string
  default     = null
}

variable "display_name" {
  description = "User-settable and human-readable display name for the Cluster."
  type        = string
}

variable "labels" {
  description = "Labels to apply to backups created using this configuration."
  type        = map(string)
  default     = {}
}

variable "location" {
  description = "The location where the alloydb cluster should reside."
  type        = string
}

variable "network" {
  description = "The resource link for the VPC network in which cluster resources are created and from which they are accessible via Private IP. The network must belong to the same project as the cluster. It is specified in the form: 'projects/{projectNumber}/global/networks/{network_id}'."
  type        = string
  default     = null
}

variable "password" {
  description = "The initial password for the user."
  type        = string
  default     = null
}

variable "primary_cluster_name" {
  description = "The name of the primary cluster. This field is used to specify the primary cluster for a secondary cluster. Must be in the format 'projects/{project}/locations/{location}/clusters/{cluster_id}'"
  type        = string
  default     = null
}

variable "project" {
  description = "The ID of the project in which the resource belongs. If it is not provided, the provider project is used."
  type        = string
}

variable "skip_await_major_version_upgrade" {
  description = "Set to true to skip awaiting on the major version upgrade of the cluster."
  type        = bool
  default     = null
}

variable "subscription_type" {
  description = "The subscription type of cluster. Possible values are: TRIAL, STANDARD. Default value is STANDARD."
  type        = string
  validation {
    condition     = can(contains(["STANDARD", "TRIAL"], var.subscription_type))
    error_message = "Invalid subscription type. Supported values: STANDARD, TRIAL"
  }
  default = "STANDARD"
}

variable "user" {
  description = "The initial user's database username. Default is 'postgres'."
  type        = string
  default     = "postgres"
}
