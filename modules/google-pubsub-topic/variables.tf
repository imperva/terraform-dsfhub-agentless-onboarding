variable "name" {
  description = "Name of the topic."
  type        = string
}

variable "project" {
  description = "The ID of the project to create the sink in. If omitted, the project associated with the provider is used."
  type        = string
  default     = null
}
