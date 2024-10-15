variable "description" {
  description = "A description of this sink. The maximum length of the description is 8000 characters."
  type        = string
  default     = ""
}

variable "exclusions" {
  description = <<EOF
  A list of exclusion objects as defined below.

  exclusion:
  - description: (Optional) A description of this exclusion.
  - filter:  An advanced logs filter that matches the log entries to be excluded.
  - name: A client-assigned identifier for the exclusion filter.
  EOF
  type = list(
    object(
      {
        description = optional(string)
        filter      = string
        name        = string
      }
    )
  )
  default = null
}

variable "filter" {
  description = "The filter to apply when exporting logs. Only log entries that match the filter are exported."
  type        = string
}

variable "name" {
  description = "The name of the logging sink."
  type        = string
}

variable "project" {
  description = "The ID of the project to create the sink in. If omitted, the project associated with the provider is used."
  type        = string
  default     = null
}

variable "pubsub_topic_id" {
  description = "ID of the PubSub topic to forward logs to, in the form of '/projects/[PROJECT_ID]/topics/[TOPIC_ID]'."
  type        = string
}

