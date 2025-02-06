variable "config" {
  description = "The name of the instance's configuration (similar but not quite the same as a region) which defines the geographic placement and replication of your databases in this instance. It determines where your data is stored. Values are typically of the form `regional-europe-west1` , `us-central` etc. In order to obtain a valid list please consult the [Configuration section of the docs](https://cloud.google.com/spanner/docs/instances)."
  type        = string
  default     = null
}

variable "display_name" {
  description = "The descriptive name for this instance as it appears in UIs."
  type        = string
  default     = null
  validation {
    condition     = length(var.display_name) >= 4 && length(var.display_name) <= 30
    error_message = "The display name must be between 4 and 30 characters in length."
  }
}

variable "name" {
  description = "A unique identifier for the instance, which cannot be changed after the instance is created. If not provided, a random string starting with `tf-` will be selected."
  type        = string
  validation {
    condition     = length(var.name) >= 6 && length(var.name) <= 30
    error_message = "The name must be between 6 and 30 characters in length."
  }
}
