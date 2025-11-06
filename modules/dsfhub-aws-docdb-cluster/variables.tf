# DSFHUB asset variables
variable "admin_email" {
  description = "The email address to notify about the assets."
  type        = string
  default     = "test@example.com"
}

variable "asset_display_name" {
  description = "The display name of the asset."
  type        = string
  default     = "AWS DocumentDB Cluster"
}

variable "asset_id" {
  description = "The unique identifier of the asset, typically its arn."
  type        = string
}

variable "cluster_id" {
  description = "Identifier of AWS DocumentDB Cluster."
  type        = string
}

variable "gateway_id" {
  description = "Unique identifier (UID) attached to the jSonar machine controlling the asset"
  type        = string
}

variable "parent_asset_id" {
  description = "DSFHUB Cloud Account Asset ID"
  type        = string
}

variable "region" {
  description = "AWS region of the AWS DocumentDB Cluster."
  type        = string
}

variable "server_host_name" {
  description = "The endpoint of the AWS DocumentDB Cluster."
  type        = string
}

variable "server_ip" {
  description = "The IP address of the AWS DocumentDB Cluster."
  type        = string
}

variable "server_port" {
  description = "The port on which the DB accepts connections."
  type        = number
  default     = 27017
}
