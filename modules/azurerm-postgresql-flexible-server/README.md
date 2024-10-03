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

- [azurerm_postgresql_flexible_server.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/postgresql_flexible_server) (resource)

## Required Inputs

The following input variables are required:

### <a name="input_administrator_login"></a> [administrator\_login](#input\_administrator\_login)

Description: The Administrator login for the PostgreSQL Flexible Server.

Type: `string`

### <a name="input_administrator_password"></a> [administrator\_password](#input\_administrator\_password)

Description: The Password associated with the administrator\_login for the PostgreSQL Flexible Server.

Type: `string`

### <a name="input_location"></a> [location](#input\_location)

Description: The Azure Region where the PostgreSQL Flexible Server should exist. Changing this forces a new PostgreSQL Flexible Server to be created.

Type: `string`

### <a name="input_name"></a> [name](#input\_name)

Description: The name which should be used for this PostgreSQL Flexible Server. Changing this forces a new PostgreSQL Flexible Server to be created.

Type: `string`

### <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name)

Description: The name of the Resource Group where the PostgreSQL Flexible Server should exist. Changing this forces a new PostgreSQL Flexible Server to be created.

Type: `string`

## Optional Inputs

The following input variables are optional (have default values):

### <a name="input_postgres_version"></a> [postgres\_version](#input\_postgres\_version)

Description: The version of PostgreSQL Flexible Server to use. Possible values are 11, 12, 13, 14, 15 and 16. Defaults to 16.

Type: `number`

Default: `16`

### <a name="input_public_network_access_enabled"></a> [public\_network\_access\_enabled](#input\_public\_network\_access\_enabled)

Description: Specifies whether this PostgreSQL Flexible Server is publicly accessible. Defaults to true.

Type: `bool`

Default: `true`

### <a name="input_sku_name"></a> [sku\_name](#input\_sku\_name)

Description: The SKU Name for the PostgreSQL Flexible Server. The name of the SKU, follows the tier + name pattern (e.g. B\_Standard\_B1ms, GP\_Standard\_D2s\_v3, MO\_Standard\_E4s\_v3). Defaults to GP\_Standard\_D2s\_v3.

Type: `string`

Default: `"GP_Standard_D2s_v3"`

### <a name="input_storage_mb"></a> [storage\_mb](#input\_storage\_mb)

Description: The max storage allowed for the PostgreSQL Flexible Server. Possible values are 32768, 65536, 131072, 262144, 524288, 1048576, 2097152, 4193280, 4194304, 8388608, 16777216 and 33553408. Defaults to 32768.

Type: `number`

Default: `"32768"`

### <a name="input_storage_tier"></a> [storage\_tier](#input\_storage\_tier)

Description: The name of storage performance tier for IOPS of the PostgreSQL Flexible Server. Possible values are P4, P6, P10, P15,P20, P30,P40, P50,P60, P70 or P80. Default value is dependant on the storage\_mb value. Please see the storage\_tier defaults based on storage\_mb table [here](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/postgresql_flexible_server#storage_tier-defaults-based-on-storage_mb).

Type: `string`

Default: `null`

### <a name="input_tags"></a> [tags](#input\_tags)

Description: A mapping of tags to assign to the resource.

Type: `map(string)`

Default: `null`

## Outputs

The following outputs are exported:

### <a name="output_this"></a> [this](#output\_this)

Description: Azure PostgreSQL Flexible server.
<!-- END_TF_DOCS -->