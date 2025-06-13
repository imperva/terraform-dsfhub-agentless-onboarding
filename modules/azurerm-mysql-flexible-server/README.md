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
| [azurerm_mysql_flexible_server.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/mysql_flexible_server) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_administrator_login"></a> [administrator\_login](#input\_administrator\_login) | The Administrator login for the MySQL Flexible Server. | `string` | n/a | yes |
| <a name="input_administrator_password"></a> [administrator\_password](#input\_administrator\_password) | The Password associated with the administrator\_login for the MySQL Flexible Server. | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | The Azure Region where the MySQL Flexible Server should exist. Changing this forces a new MySQL Flexible Server to be created. | `string` | n/a | yes |
| <a name="input_mysql_version"></a> [mysql\_version](#input\_mysql\_version) | The version of the MySQL Flexible Server to use. Possible values are 5.7, and 8.0.21. | `string` | `null` | no |
| <a name="input_name"></a> [name](#input\_name) | The name which should be used for this MySQL Flexible Server. Changing this forces a new MySQL Flexible Server to be created. | `string` | n/a | yes |
| <a name="input_public_network_access"></a> [public\_network\_access](#input\_public\_network\_access) | Whether approved public traffic is allowed through the firewall to this MySQL Flexible Server. Possible values are Enabled and Disabled. | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The name of the Resource Group where the MySQL Flexible Server should exist. Changing this forces a new MySQL Flexible Server to be created. | `string` | n/a | yes |
| <a name="input_sku_name"></a> [sku\_name](#input\_sku\_name) | The SKU Name for the MySQL Flexible Server. The name of the SKU, follows the tier + name pattern (e.g. B\_Standard\_B1ms, GP\_Standard\_D2s\_v3, MO\_Standard\_E4s\_v3). Defaults to GP\_Standard\_D2s\_v3. | `string` | `"GP_Standard_D2s_v3"` | no |
| <a name="input_storage_auto_grow_enabled"></a> [storage\_auto\_grow\_enabled](#input\_storage\_auto\_grow\_enabled) | Specifies whether auto grow is enabled for the MySQL Flexible Server. Defaults to true. | `bool` | `true` | no |
| <a name="input_storage_io_scaling_enabled"></a> [storage\_io\_scaling\_enabled](#input\_storage\_io\_scaling\_enabled) | Specifies whether IO scaling is enabled for the MySQL Flexible Server. Defaults to true. | `bool` | `true` | no |
| <a name="input_storage_iops"></a> [storage\_iops](#input\_storage\_iops) | The number of IOPS for the MySQL Flexible Server. Possible Values are between 360 to 20000. | `number` | n/a | yes |
| <a name="input_storage_log_on_disk_enabled"></a> [storage\_log\_on\_disk\_enabled](#input\_storage\_log\_on\_disk\_enabled) | Specifies whether storage log on disk is enabled for the MySQL Flexible Server. Defaults to false. | `bool` | `false` | no |
| <a name="input_storage_size_gb"></a> [storage\_size\_gb](#input\_storage\_size\_gb) | The max storage allowed for the MySQL Flexible Server. Possible values are between 20 and 16384. | `number` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | A mapping of tags which should be assigned to the MySQL Flexible Server. | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_this"></a> [this](#output\_this) | Azure MySQL Flexible server. |
<!-- END_TF_DOCS -->