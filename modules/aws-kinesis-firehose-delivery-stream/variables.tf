variable "destination" {
  description = "This is the destination to where the data is delivered. Valid values: extended_s3, redshift, elasticsearch, splunk, http_endpoint, opensearch, opensearchserverless, snowflake."
  type        = string
  validation {
    condition     = contains(["extended_s3", "redshift", "elasticsearch", "splunk", "http_endpoint", "opensearch", "opensearchserverless", "snowflake"], var.destination)
    error_message = "Invalid destination. Valid values: extended_s3, redshift, elasticsearch, splunk, http_endpoint, opensearch, opensearchserverless, snowflake."
  }
}

variable "extended_s3_configuration" {
  description = "Enhanced configuration options for the s3 destination."
  type = object(
    {
      bucket_arn          = optional(string)
      compression_format  = optional(string)
      error_output_prefix = optional(string)
      file_extension      = optional(string)
      prefix              = optional(string)
      role_arn            = optional(string)
      processing_configuration = optional(
        object(
          {
            enabled = string
            processors = optional(
              object(
                {
                  type = string
                }
              )
            )
          }
        )
      )
    }
  )
  default = null
}

variable "name" {
  description = "A name to identify the stream. This is unique to the AWS account and region the Stream is created in."
  type        = string
}

variable "tags" {
  description = "A map of tags to assign to the resource."
  type        = map(string)
  default     = null
}
