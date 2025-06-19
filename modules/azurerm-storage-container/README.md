<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_storage_container.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_container) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_container_access_type"></a> [container\_access\_type](#input\_container\_access\_type) | The Access Level configured for this Container. Possible values are blob, container or private. Defaults to private. | `string` | `"private"` | no |
| <a name="input_name"></a> [name](#input\_name) | The name of the Container which should be created within the Storage Account. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_storage_account_id"></a> [storage\_account\_id](#input\_storage\_account\_id) | The name of the Storage Account where the Container should be created. Changing this forces a new resource to be created. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_this"></a> [this](#output\_this) | Azure storage container |
<!-- END_TF_DOCS -->