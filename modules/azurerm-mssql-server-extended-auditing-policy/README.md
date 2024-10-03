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

- [azurerm_mssql_server_extended_auditing_policy.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/mssql_server_extended_auditing_policy) (resource)

## Required Inputs

The following input variables are required:

### <a name="input_server_id"></a> [server\_id](#input\_server\_id)

Description: The ID of the SQL Server to set the extended auditing policy. Changing this forces a new resource to be created.

Type: `string`

## Optional Inputs

The following input variables are optional (have default values):

### <a name="input_enabled"></a> [enabled](#input\_enabled)

Description: Whether to enable the extended auditing policy. Defaults to true.

Type: `bool`

Default: `true`

### <a name="input_retention_in_days"></a> [retention\_in\_days](#input\_retention\_in\_days)

Description: The number of days to retain logs for in the storage account.

Type: `number`

Default: `null`

### <a name="input_storage_account_access_key"></a> [storage\_account\_access\_key](#input\_storage\_account\_access\_key)

Description: The access key to use for the auditing storage account.

Type: `string`

Default: `null`

### <a name="input_storage_account_subscription_id"></a> [storage\_account\_subscription\_id](#input\_storage\_account\_subscription\_id)

Description: The ID of the Subscription containing the Storage Account.

Type: `string`

Default: `null`

### <a name="input_storage_endpoint"></a> [storage\_endpoint](#input\_storage\_endpoint)

Description: The blob storage endpoint (e.g. https://example.blob.core.windows.net). This blob storage will hold all extended auditing logs.

Type: `string`

Default: `null`

## Outputs

The following outputs are exported:

### <a name="output_this"></a> [this](#output\_this)

Description: Azure MS SQL Server Extended Auditing Policy.
<!-- END_TF_DOCS -->