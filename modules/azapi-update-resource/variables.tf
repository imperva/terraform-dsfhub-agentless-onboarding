variable "body" {
  description = "It is in a format like <resource-type>@<api-version>. <resource-type> is the Azure resource type, for example, Microsoft.Storage/storageAccounts. <api-version> is version of the API used to manage this azure resource."
  type        = string
}

variable "resource_id" {
  description = "The ID of an existing azure source. Changing this forces a new azure resource to be created."
  type        = string
}

variable "type" {
  description = "The request body used to add on to an existing Azure resource."
  type        = any
}
