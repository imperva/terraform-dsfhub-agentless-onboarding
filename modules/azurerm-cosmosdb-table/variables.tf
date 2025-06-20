variable "name" {
  description = "Specifies the name of the Cosmos DB Table. Changing this forces a new resource to be created."
  type        = string
}
variable "resource_group_name" {
  description = "The name of the resource group in which the Cosmos DB Table is created. Changing this forces a new resource to be created."
  type        = string
}
variable "account_name" {
  description = "The name of the Cosmos DB Table to create the table within. Changing this forces a new resource to be created."
  type        = string
}
variable "throughput" {
  description = "The throughput of Table (RU/s). Must be set in increments of 100. The minimum value is 400. This must be set upon database creation otherwise it cannot be updated without a manual terraform destroy-apply."
  type        = number
  default     = 400
  validation {
    condition     = var.throughput % 100 == 0 && var.throughput >= 400 && var.throughput <= 1000000
    error_message = "Throughput must be set in increments of 100 and the minimum value is 400 and the maximum value is 1000000."
  }
}
