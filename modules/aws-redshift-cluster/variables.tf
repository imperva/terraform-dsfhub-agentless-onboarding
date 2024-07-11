variable "cluster_identifier" {
  description = "Identifier of the Redshift cluster. Must be a lower case string."
  type        = string
}

variable "database_name" {
  description = "The name of the first database to be created when the cluster is created."
  type        = string
  default     = "dev"
}

variable "default_iam_role_arn" {
  description = "The Amazon Resource Name (ARN) for the IAM role that was set as default for the cluster when the cluster was created."
  type        = string
  default     = null
}

variable "node_type" {
  description = "The node type to be provisioned for the cluster."
  type        = string
  default     = "dc2.large"
}

variable "cluster_type" {
  description = "The type of the cluster. Valid values: single-node | multi-node."
  type        = string
  default     = "single-node"
}

variable "master_password" {
  description = "The password for the master database user. Must contain at least 8 characters and contain at least one uppercase letter, one lowercase letter, and one number."
  type        = string
}

variable "master_username" {
  description = "The username for the master database user."
  type        = string
  default     = "admin"
}

variable "vpc_security_group_ids" {
  description = "A list of security group identifiers to associate with this cluster."
  type        = list(string)
  default     = null
}

variable "cluster_subnet_group_name" {
  description = "The name of a cluster subnet group to be associated with this cluster."
  type        = string
  default     = null
}

variable "preferred_maintenance_window" {
  description = "The weekly time range (in UTC) during which automated cluster maintenance can occur."
  type        = string
  default     = null
}

variable "cluster_parameter_group_name" {
  description = "The name of the parameter group to be associated with this cluster."
  type        = string
  default     = null
}

variable "port" {
  description = "The port number on which the cluster accepts incoming connections. Valid values are between 1115 and 65535"
  type        = number
  default     = 5439
}

variable "cluster_version" {
  description = "The version of the Amazon Redshift engine software that you want to deploy on the cluster."
  type        = string
  default     = "1.0"
}

variable "apply_immediately" {
  description = "A boolean that indicates whether major version upgrades are applied immediately, regardless of the maintenance window."
  type        = bool
  default     = true
}

variable "number_of_nodes" {
  description = "The number of compute nodes in the cluster. This parameter is required when the ClusterType parameter is specified as multi-node."
  type        = number
  default     = 1
}

variable "publicly_accessible" {
  description = "A boolean that indicates if the cluster is publicly accessible. If the value is true, the cluster can be accessed from a public network."
  type        = bool
  default     = true
}

variable "elastic_ip" {
  description = "The Elastic IP (EIP) address for the cluster."
  type        = string
  default     = null
}

variable "skip_final_snapshot" {
  description = "A boolean that indicates whether a final snapshot is created before the cluster is deleted."
  type        = bool
  default     = true
}

variable "final_snapshot_identifier" {
  description = "The identifier of the final snapshot that is to be created immediately before deleting the cluster."
  type        = string
  default     = null
}

variable "snapshot_identifier" {
  description = "The name of the snapshot from which to create the new cluster"
  type        = string
  default     = null
}

variable "snapshot_cluster_identifier" {
  description = "The name of the cluster the source snapshot was created from."
  type        = string
  default     = null
}

variable "iam_roles" {
  description = "A list of IAM roles to associate with the cluster. A maximum of 10 IAM roles can be associated to the cluster at any time."
  type        = list(string)
  default     = null
}

variable "tags" {
  description = "A map of tags to assign to the resource."
  type        = map(string)
  default     = null
}
