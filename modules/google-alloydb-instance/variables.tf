variable "cidr_range" {
  description = "CIDR range for one authorized network of the instance."
  type        = string
  default     = null
}

variable "cluster" {
  description = "Identifies the alloydb cluster. Must be in the format 'projects/{project}/locations/{location}/clusters/{cluster_id}'."
  type        = string
  validation {
    condition     = can(regex("projects/.+/locations/.+/clusters/.+", var.cluster))
    error_message = "Invalid cluster ID. Must be in the format 'projects/{project}/locations/{location}/clusters/{cluster_id}'."
  }
}

variable "database_flags" {
  description = "List of database flags to assign to the instance."
  type        = map(string)
  default     = null
}

variable "display_name" {
  description = "User-settable and human-readable display name for the Instance."
  type        = string
}

variable "enable_outbound_public_ip" {
  description = "Whether to enable outbound public IP for the instance. Default is true."
  type        = bool
  default     = null
}

variable "enable_public_ip" {
  description = "Enabling public ip for the instance. If a user wishes to disable this, please also clear the list of the authorized external networks set on the same instance. Default is true."
  type        = bool
  default     = null
}

variable "instance_id" {
  description = "The ID of the alloydb instance."
  type        = string
}

variable "instance_type" {
  description = "The type of the instance. If the instance type is READ_POOL, provide the associated PRIMARY/SECONDARY instance in the depends_on meta-data attribute. If the instance type is SECONDARY, point to the cluster_type of the associated secondary cluster instead of mentioning SECONDARY. Example: {instance_type = google_alloydb_cluster..cluster_type} instead of {instance_type = SECONDARY} If the instance type is SECONDARY, the terraform delete instance operation does not delete the secondary instance but abandons it instead. Use deletion_policy = \"FORCE\" in the associated secondary cluster and delete the cluster forcefully to delete the secondary cluster as well its associated secondary instance. Users can undo the delete secondary instance action by importing the deleted secondary instance by calling terraform import. Possible values are: PRIMARY, READ_POOL, SECONDARY."
  type        = string
  default     = "PRIMARY"
  validation {
    condition     = can(contains(["PRIMARY", "READ_POOL", "SECONDARY"], var.instance_type))
    error_message = "Invalid instance type. Supported values: PRIMARY, READ_POOL, SECONDARY"
  }
}

variable "labels" {
  description = "Labels to apply to this instance."
  type        = map(string)
  default     = {}
}

variable "node_count" {
  description = "Number of nodes in the read pool. This field is required for READ_POOL instance type."
  type        = number
  default     = null
}

variable "ssl_mode" {
  description = "SSL mode. Specifies client-server SSL/TLS connection behavior. Possible values are: ENCRYPTED_ONLY, ALLOW_UNENCRYPTED_AND_ENCRYPTED."
  type        = string
  default     = null
}
