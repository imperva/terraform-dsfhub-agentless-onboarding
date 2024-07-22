variable "custom_master_key_spec" {
  description = "Specifies whether the key contains a symmetric key or an asymmetric key pair and the encryption algorithms or signing algorithms that the key supports. Valid values: SYMMETRIC_DEFAULT, RSA_2048, RSA_3072, RSA_4096, HMAC_256, ECC_NIST_P256, ECC_NIST_P384, ECC_NIST_P521, or ECC_SECG_P256K1."
  type        = string
  default     = null
}

variable "deletion_window_in_days" {
  description = "The waiting period, specified in number of days. After the waiting period ends, AWS KMS deletes the KMS key. If you specify a value, it must be between 7 and 30, inclusive."
  type        = number
  default     = null
}

variable "description" {
  description = "The description of the key as viewed in AWS console."
  type        = string
  default     = null
}

variable "is_enabled" {
  description = "Specifies whether the key is enabled."
  type        = bool
  default     = null
}

variable "key_usage" {
  description = "Specifies the intended use of the key. Valid values: ENCRYPT_DECRYPT, SIGN_VERIFY, GENERATE_VERIFY_MAC."
  type        = string
  default     = null
}

variable "multi_region" {
  description = " Indicates whether the KMS key is a multi-Region (true) or regional (false) key."
  type        = bool
  default     = null
}

variable "tags" {
  description = "A map of tags to assign to the object."
  type        = map(string)
  default     = null
}
