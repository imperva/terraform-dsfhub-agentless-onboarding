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
| [azurerm_mssql_managed_instance.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/mssql_managed_instance) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_administrator_login"></a> [administrator\_login](#input\_administrator\_login) | The administrator login name for the new SQL Managed Instance. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_administrator_login_password"></a> [administrator\_login\_password](#input\_administrator\_login\_password) | The password associated with the administrator\_login user. Needs to comply with Azure's [Password Policy](https://learn.microsoft.com/en-us/sql/relational-databases/security/password-policy?view=sql-server-ver16&redirectedfrom=MSDN) | `string` | n/a | yes |
| <a name="input_license_type"></a> [license\_type](#input\_license\_type) | What type of license the Managed Instance will use. Possible values are LicenseIncluded and BasePrice. Defaults to LicenseIncluded. | `string` | `"LicenseIncluded"` | no |
| <a name="input_location"></a> [location](#input\_location) | Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | The name of the SQL Managed Instance. This needs to be globally unique within Azure. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_public_data_endpoint_enabled"></a> [public\_data\_endpoint\_enabled](#input\_public\_data\_endpoint\_enabled) | Is the public data endpoint enabled? Default value is false. | `bool` | `false` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The name of the resource group in which to create the SQL Managed Instance. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_sku_name"></a> [sku\_name](#input\_sku\_name) | Specifies the SKU Name for the SQL Managed Instance. Valid values include GP\_Gen4, GP\_Gen5, GP\_Gen8IM, GP\_Gen8IH, BC\_Gen4, BC\_Gen5, BC\_Gen8IM or BC\_Gen8IH. Defaults to GP\_Gen5. | `string` | `"GP_Gen5"` | no |
| <a name="input_storage_size_in_gb"></a> [storage\_size\_in\_gb](#input\_storage\_size\_in\_gb) | Maximum storage space for the SQL Managed instance. This should be a multiple of 32 (GB). Defaults to 32. | `number` | `32` | no |
| <a name="input_subnet_id"></a> [subnet\_id](#input\_subnet\_id) | The subnet resource id that the SQL Managed Instance will be associated with. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | A mapping of tags to assign to the resource. | `map(string)` | `null` | no |
| <a name="input_vcores"></a> [vcores](#input\_vcores) | Number of cores that should be assigned to the SQL Managed Instance. Values can be 8, 16, or 24 for Gen4 SKUs, or 4, 6, 8, 10, 12, 16, 20, 24, 32, 40, 48, 56, 64, 80, 96 or 128 for Gen5 SKUs. Defaults to 4. | `number` | `4` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_this"></a> [this](#output\_this) | Azure SQL Managed Instance. |
<!-- END_TF_DOCS -->