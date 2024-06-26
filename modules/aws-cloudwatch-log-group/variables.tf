variable "name" {
  description = "Name of AWS CloudWatch log group"
  type        = string
}

variable "retention_in_days" {
  description = "Specifies the number of days you want to retain log events in the specified log group. If you select 0, the events in the log group are always retained and never expire."
  type        = number
  default     = 7
}
