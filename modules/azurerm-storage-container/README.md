<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

The following providers are used by this module:

- <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm)

## Modules

No modules.

## Resources

The following resources are used by this module:

- [azurerm_storage_container.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_container) (resource)

## Required Inputs

The following input variables are required:

### <a name="input_name"></a> [name](#input\_name)

Description: The name of the Container which should be created within the Storage Account. Changing this forces a new resource to be created.

Type: `string`

### <a name="input_storage_account_name"></a> [storage\_account\_name](#input\_storage\_account\_name)

Description: The name of the Storage Account where the Container should be created. Changing this forces a new resource to be created.

Type: `string`

## Optional Inputs

The following input variables are optional (have default values):

### <a name="input_container_access_type"></a> [container\_access\_type](#input\_container\_access\_type)

Description: The Access Level configured for this Container. Possible values are blob, container or private. Defaults to private.

Type: `string`

Default: `"private"`

## Outputs

The following outputs are exported:

### <a name="output_this"></a> [this](#output\_this)

Description: Azure storage container
<!-- END_TF_DOCS -->