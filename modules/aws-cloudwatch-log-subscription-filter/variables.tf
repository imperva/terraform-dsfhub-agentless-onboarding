variable "destination_arn" {
  description = "The ARN of the destination to deliver matching log events to. Kinesis stream or Lambda function ARN."
  type        = string
}

variable "distribution" {
  description = "The method used to distribute log data to the destination. By default log data is grouped by log stream, but the grouping can be set to random for a more even distribution. This property is only applicable when the destination is an Amazon Kinesis stream. Valid values are 'Random' and 'ByLogStream'."
  type        = string
  default     = null
  validation {
    condition     = can(regex("Random|ByLogStream", var.distribution)) || var.distribution == null
    error_message = "Invalid distribution value. Valid values are 'Random' and 'ByLogStream'."
  }
}

variable "filter_pattern" {
  description = "A valid CloudWatch Logs filter pattern for subscribing to a filtered stream of log events. Use empty string to match everything. For more information, see the [Amazon CloudWatch Logs User Guide.](https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/FilterAndPatternSyntax.html)"
  type        = string
}

variable "log_group_name" {
  description = "The name of the log group to associate the subscription filter with."
  type        = string
}

variable "name" {
  description = "A name for the subscription filter."
  type        = string
}

variable "role_arn" {
  description = "The ARN of an IAM role that grants Amazon CloudWatch Logs permissions to deliver ingested log events to the destination."
  type        = string
}
