# onboard-azure-mysql-flexible
Onboard Azure MySQL Flexible to DSF Hub.

## Notes
There are two prerequisites for using this module:
1. An Azure Event Hub Namespace and Event Hub. 
2. An Azure Storage Account and Container. This is used by DSF to store a marker which keeps track of what data in the Event Hub has been consumed.

They can be created along with an AZURE EVENTHUB asset via the ``onboard-azure-eventhub`` module.

See the corresponding example for more details.
<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_dsfhub"></a> [dsfhub](#requirement\_dsfhub) | >= 1.3.2 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_azure-mysql-flexible-asset"></a> [azure-mysql-flexible-asset](#module\_azure-mysql-flexible-asset) | ../dsfhub-azure-mysql-flexible | n/a |
| <a name="module_azure-mysql-flexible-server"></a> [azure-mysql-flexible-server](#module\_azure-mysql-flexible-server) | ../azurerm-mysql-flexible-server | n/a |
| <a name="module_mysql-diagnostic-setting"></a> [mysql-diagnostic-setting](#module\_mysql-diagnostic-setting) | ../azurerm-monitor-diagnostic-setting | n/a |

## Resources

| Name | Type |
|------|------|
| [azurerm_mysql_flexible_server_configuration.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/mysql_flexible_server_configuration) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_azure_mysql_flexible_admin_email"></a> [azure\_mysql\_flexible\_admin\_email](#input\_azure\_mysql\_flexible\_admin\_email) | The email address to notify about the asset. | `string` | n/a | yes |
| <a name="input_azure_mysql_flexible_audit_pull_enabled"></a> [azure\_mysql\_flexible\_audit\_pull\_enabled](#input\_azure\_mysql\_flexible\_audit\_pull\_enabled) | If true, sonargateway will collect the audit logs for this system if it can. | `bool` | `false` | no |
| <a name="input_azure_mysql_flexible_gateway_id"></a> [azure\_mysql\_flexible\_gateway\_id](#input\_azure\_mysql\_flexible\_gateway\_id) | Unique identifier (UID) attached to the jSonar machine controlling the asset | `string` | n/a | yes |
| <a name="input_azure_mysql_flexible_location"></a> [azure\_mysql\_flexible\_location](#input\_azure\_mysql\_flexible\_location) | Physical location/region of the MySQL instance, e.g. "EAST US" | `string` | `null` | no |
| <a name="input_azure_mysql_flexible_logs_destination_asset_id"></a> [azure\_mysql\_flexible\_logs\_destination\_asset\_id](#input\_azure\_mysql\_flexible\_logs\_destination\_asset\_id) | The asset\_id of the AZURE EVENTHUB asset that this instance is sending its audit logs to. | `string` | n/a | yes |
| <a name="input_azure_mysql_flexible_parent_asset_id"></a> [azure\_mysql\_flexible\_parent\_asset\_id](#input\_azure\_mysql\_flexible\_parent\_asset\_id) | The asset\_id of the AZURE asset representing the Azure account where this server is located. | `string` | `null` | no |
| <a name="input_diagnostic_setting_eventhub_authorization_rule_id"></a> [diagnostic\_setting\_eventhub\_authorization\_rule\_id](#input\_diagnostic\_setting\_eventhub\_authorization\_rule\_id) | Specifies the ID of an Event Hub Namespace Authorization Rule used to send Diagnostics Data. | `string` | `null` | no |
| <a name="input_diagnostic_setting_eventhub_name"></a> [diagnostic\_setting\_eventhub\_name](#input\_diagnostic\_setting\_eventhub\_name) | Specifies the name of the Event Hub where Diagnostics Data should be sent. | `string` | `null` | no |
| <a name="input_diagnostic_setting_name"></a> [diagnostic\_setting\_name](#input\_diagnostic\_setting\_name) | Specifies the name of the Diagnostic Setting. Changing this forces a new resource to be created. | `string` | `"dsfhubdiagnostic"` | no |
| <a name="input_require_secure_transport"></a> [require\_secure\_transport](#input\_require\_secure\_transport) | If true, requires secure transport for connections to the MySQL Flexible Server. Defaults to true. | `bool` | `true` | no |
| <a name="input_server_administrator_login"></a> [server\_administrator\_login](#input\_server\_administrator\_login) | The Administrator login for the MySQLs Flexible Server. | `string` | n/a | yes |
| <a name="input_server_administrator_password"></a> [server\_administrator\_password](#input\_server\_administrator\_password) | The Password associated with the administrator\_login for the MySQL Flexible Server. | `string` | n/a | yes |
| <a name="input_server_auto_grow_enabled"></a> [server\_auto\_grow\_enabled](#input\_server\_auto\_grow\_enabled) | Should Storage Auto Grow be enabled? Defaults to true | `bool` | `true` | no |
| <a name="input_server_io_scaling_enabled"></a> [server\_io\_scaling\_enabled](#input\_server\_io\_scaling\_enabled) | Should IO Scaling be enabled? If true, iops can not be set. Defaults to false | `bool` | `false` | no |
| <a name="input_server_iops"></a> [server\_iops](#input\_server\_iops) | The storage IOPS for the MySQL Flexible Server. Possible values are between 360 and 20000. Defaults to 360. If IO Scaling is enabled, this value must not be set. | `number` | `360` | no |
| <a name="input_server_location"></a> [server\_location](#input\_server\_location) | The Azure Region where the MySQL Flexible Server should exist. Changing this forces a new MySQL Flexible Server to be created. | `string` | n/a | yes |
| <a name="input_server_log_on_disk_enabled"></a> [server\_log\_on\_disk\_enabled](#input\_server\_log\_on\_disk\_enabled) | Should Storage Log On Disk be enabled? Defaults to false. | `bool` | `false` | no |
| <a name="input_server_mysql_version"></a> [server\_mysql\_version](#input\_server\_mysql\_version) | The version of MySQL Flexible Server to use. Possible values are 5.7 or 8.0.21 | `string` | n/a | yes |
| <a name="input_server_name"></a> [server\_name](#input\_server\_name) | The name which should be used for this MySQL Flexible Server. Changing this forces a new MySQL Flexible Server to be created. | `string` | n/a | yes |
| <a name="input_server_public_network_access"></a> [server\_public\_network\_access](#input\_server\_public\_network\_access) | Specifies whether this MySQL Flexible Server is publicly accessible. Possible values are Enabled and Disabled | `string` | n/a | yes |
| <a name="input_server_resource_group_name"></a> [server\_resource\_group\_name](#input\_server\_resource\_group\_name) | The name of the Resource Group where the MySQL Flexible Server should exist. Changing this forces a new MySQL Flexible Server to be created. | `string` | n/a | yes |
| <a name="input_server_size_gb"></a> [server\_size\_gb](#input\_server\_size\_gb) | The size of the storage in GB for the MySQL Flexible Server. Possible values are between 20 and 16384. Defaults to 20. | `number` | `20` | no |
| <a name="input_server_sku_name"></a> [server\_sku\_name](#input\_server\_sku\_name) | The SKU Name for the MySQL Flexible Server. The name of the SKU, follows the tier + name pattern (e.g. B\_Standard\_B1ms, GP\_Standard\_D2s\_v3, MO\_Standard\_E4s\_v3). Defaults to GP\_Standard\_D2ds\_v4 | `string` | `"GP_Standard_D2ds_v4"` | no |
| <a name="input_server_tags"></a> [server\_tags](#input\_server\_tags) | A mapping of tags to assign to the resource. | `map(string)` | `{}` | no |
| <a name="input_slow_query_log"></a> [slow\_query\_log](#input\_slow\_query\_log) | Enable or disable the slow query log. Defaults to false. | `bool` | `false` | no |
| <a name="input_slow_query_time"></a> [slow\_query\_time](#input\_slow\_query\_time) | The time in seconds that a query must take to be considered slow. Defaults to 0 seconds. | `number` | `0` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_azure-mysql-flexible-asset"></a> [azure-mysql-flexible-asset](#output\_azure-mysql-flexible-asset) | AZURE MYSQL FLEXIBLE asset. |
| <a name="output_mysql-diagnostic-setting"></a> [mysql-diagnostic-setting](#output\_mysql-diagnostic-setting) | Diagnostic setting. |
| <a name="output_mysql-server"></a> [mysql-server](#output\_mysql-server) | Azure MySQL Flexible server. |
| <a name="output_mysql-server-configurations"></a> [mysql-server-configurations](#output\_mysql-server-configurations) | Azure MySQL Flexible server configurations. |
<!-- END_TF_DOCS -->