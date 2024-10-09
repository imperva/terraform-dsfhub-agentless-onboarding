variable "message_retention_duration" {
  description = "How long to retain unacknowledged messages in the subscription's backlog, from the moment a message is published. If retain_acked_messages is true, then this also configures the retention of acknowledged messages. Defaults to 7 days."
  type        = string
  default     = "604800s"
  validation {
    condition     = can(regex("[0-9]+?s", var.message_retention_duration))
    error_message = "Invalid message_retention_duration. Value must be in the form '123s'"
  }
}

variable "name" {
  description = "Name of the subscription."
  type        = string
}

variable "project" {
  description = "The ID of the project to create the sink in. If omitted, the project associated with the provider is used."
  type        = string
  default     = null
}

variable "retain_acked_messages" {
  description = "Indicates whether to retain acknowledged messages. If true, then messages are not expunged from the subscription's backlog, even if they are acknowledged, until they fall out of the messageRetentionDuration window. Defaults to false."
  type        = bool
  default     = false
}

variable "topic" {
  description = "A reference to a Topic resource, of the form projects/{project}/topics/{{name}} (as in the id property of a google_pubsub_topic), or just a topic name if the topic is in the same project as the subscription."
  type        = string
}
