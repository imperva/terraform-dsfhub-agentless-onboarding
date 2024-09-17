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
| [azurerm_mssql_server_extended_auditing_policy.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/mssql_server_extended_auditing_policy) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_enabled"></a> [enabled](#input\_enabled) | Whether to enable the extended auditing policy. Defaults to true. | `bool` | `true` | no |
| <a name="input_retention_in_days"></a> [retention\_in\_days](#input\_retention\_in\_days) | The number of days to retain logs for in the storage account. | `number` | `null` | no |
| <a name="input_server_id"></a> [server\_id](#input\_server\_id) | The ID of the SQL Server to set the extended auditing policy. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_storage_account_access_key"></a> [storage\_account\_access\_key](#input\_storage\_account\_access\_key) | The access key to use for the auditing storage account. | `string` | `null` | no |
| <a name="input_storage_account_subscription_id"></a> [storage\_account\_subscription\_id](#input\_storage\_account\_subscription\_id) | The ID of the Subscription containing the Storage Account. | `string` | `null` | no |
| <a name="input_storage_endpoint"></a> [storage\_endpoint](#input\_storage\_endpoint) | The blob storage endpoint (e.g. https://example.blob.core.windows.net). This blob storage will hold all extended auditing logs. | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_this"></a> [this](#output\_this) | Azure MS SQL Server Extended Auditing Policy. |
<!-- END_TF_DOCS -->