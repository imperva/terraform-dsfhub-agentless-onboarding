variable "cloud_watch_logs_group_arn" {
  description = "The ARN of the CloudWatch log group to which CloudTrail logs will be delivered."
  type        = string
  default     = null
}

variable "cloud_watch_logs_role_arn" {
  description = "The ARN of the IAM role that CloudTrail assumes to write to the CloudWatch log group."
  type        = string
  default     = null
}

variable "enable_logging" {
  description = "Enables logging for the trail. Setting this to \"false\" will pause logging."
  type        = bool
  default     = true
}

variable "include_global_service_events" {
  description = "Whether the trail is publishing events from global services such as IAM to the log files."
  type        = bool
  default     = true
}

variable "is_multi_region_trail" {
  description = "Whether the trail is created in the current region or in all regions."
  type        = bool
  default     = false
}

variable "name" {
  description = "Name of the trail."
  type        = string
}

variable "s3_bucket_name" {
  description = "Name of the S3 bucket designated for publishing log files."
  type        = string
}

variable "s3_key_prefix" {
  description = "The S3 key prefix that follows the name of the bucket you have designated for log file delivery."
  type        = string
  default     = null
}

variable "event_selector" {
  description = "Specifies an event selector for enabling data event logging."
  type = list(
    object(
      {
        data_resource = optional(
          object(
            {
              type   = string
              values = list(string)
            }
          )
        )
        exclude_management_event_sources = optional(list(string))
        include_management_events        = optional(bool)
        read_write_type                  = optional(string)
      }
    )
  )
  default = null
}
