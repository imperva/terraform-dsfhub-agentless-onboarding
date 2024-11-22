variable "force_destroy" {
  description = "When deleting a bucket, this boolean option will delete all contained objects. If you try to delete a bucket that contains objects, Terraform will fail that run. Defaults to false."
  type        = bool
  default     = false
}

variable "location" {
  description = "The [GCS location](https://cloud.google.com/storage/docs/locations)."
  type        = string
}

variable "name" {
  description = "The name of the bucket"
  type        = string
}

variable "project" {
  description = "The ID of the project in which the resource belongs. If it is not provided, the provider project is used."
  type        = string
  default     = null
}

variable "storage_class" {
  description = "The [Storage Class](https://cloud.google.com/storage/docs/storage-classes) of the new bucket."
  type        = string
  default     = "STANDARD"
}
