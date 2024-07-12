variable "cluster_identifier" {
  description = "Identifier of the source cluster."
  type        = string
}

variable "log_destination_type" {
  description = "The log destination type. DSFHUB only supports s3 or null (audit via ODBC tables). Default is s3."
  type        = string
  default     = "s3"
}
variable "bucket_name" {
  description = "The name of an existing S3 bucket where the log files are to be stored. Must be in the same region as the cluster and the cluster must have read bucket and put object permissions."
  type        = string
}

variable "s3_key_prefix" {
  description = "The prefix applied to the log file names. Must be 'redshift' for DSFHUB."
  type        = string
  default     = "redshift"
}
