variable "resource_arn" {
  description = "The Amazon Resource Name (ARN) of the DB cluster"
  type        = string
}

variable "mode" {
  description = "Specifies the mode of the database activity stream. Database events such as a change or access generate an activity stream event. The database session can handle these events either synchronously or asynchronously. One of: sync, async."
  type        = string
  validation {
    condition     = contains(["sync", "async"], var.mode)
    error_message = "Invalid value, select either 'sync' or 'async'."
  }
}

variable "kms_key_id" {
  description = "The AWS KMS key identifier for encrypting messages in the database activity stream. The AWS KMS key identifier is the key ARN, key ID, alias ARN, or alias name for the KMS key."
  type        = string
}

variable "engine_native_audit_fields_included" {
  description = "Specifies whether the database activity stream includes engine-native audit fields. This option only applies to an Oracle DB instance. By default, no engine-native audit fields are included."
  type        = string
  default     = null
}
