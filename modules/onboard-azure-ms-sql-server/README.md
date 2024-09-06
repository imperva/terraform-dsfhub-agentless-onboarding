# onboard-azure-ms-sql-server
Onboard Azure SQL Server to DSF Hub.

## Notes
There are two prerequisites for using this module:
1. An Azure Event Hub Namespace and Event Hub. 
2. An Azure Storage Account and Container. This is used by DSF to store a marker which keeps track of what data in the Event Hub has been consumed.

See the corresponding example for more details.

<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | n/a |
| <a name="provider_time"></a> [time](#provider\_time) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_azure-eventhub-asset"></a> [azure-eventhub-asset](#module\_azure-eventhub-asset) | ../dsfhub-azure-eventhub | n/a |
| <a name="module_azure-ms-sql-server-asset"></a> [azure-ms-sql-server-asset](#module\_azure-ms-sql-server-asset) | ../dsfhub-azure-ms-sql-server | n/a |
| <a name="module_sql-server-diagnostic-setting"></a> [sql-server-diagnostic-setting](#module\_sql-server-diagnostic-setting) | ../azurerm-monitor-diagnostic-setting | n/a |
| <a name="module_sql-server-extended-server-audit-policy"></a> [sql-server-extended-server-audit-policy](#module\_sql-server-extended-server-audit-policy) | ../azurerm-mssql-server-extended-auditing-policy | n/a |
| <a name="module_sql-server-instance"></a> [sql-server-instance](#module\_sql-server-instance) | ../azurerm-mssql-server | n/a |

## Resources

| Name | Type |
|------|------|
| [time_sleep.wait](https://registry.terraform.io/providers/hashicorp/time/latest/docs/resources/sleep) | resource |
| [azurerm_mssql_database.master](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/mssql_database) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_audit_policy_enabled"></a> [audit\_policy\_enabled](#input\_audit\_policy\_enabled) | Whether to enable the extended auditing policy on the SQL Server instance. Defaults to true. | `bool` | `true` | no |
| <a name="input_azure_eventhub_admin_email"></a> [azure\_eventhub\_admin\_email](#input\_azure\_eventhub\_admin\_email) | The email address to notify about the asset. | `string` | n/a | yes |
| <a name="input_azure_eventhub_asset_display_name"></a> [azure\_eventhub\_asset\_display\_name](#input\_azure\_eventhub\_asset\_display\_name) | User-friendly name of the asset, defined by user | `string` | n/a | yes |
| <a name="input_azure_eventhub_asset_id"></a> [azure\_eventhub\_asset\_id](#input\_azure\_eventhub\_asset\_id) | The Azure resource ID of the eventhub. | `string` | n/a | yes |
| <a name="input_azure_eventhub_audit_pull_enabled"></a> [azure\_eventhub\_audit\_pull\_enabled](#input\_azure\_eventhub\_audit\_pull\_enabled) | If true, sonargateway will collect the audit logs for this system if it can. | `bool` | `false` | no |
| <a name="input_azure_eventhub_azure_storage_account"></a> [azure\_eventhub\_azure\_storage\_account](#input\_azure\_eventhub\_azure\_storage\_account) | Name of the Azure Storage Account that will be used to store a marker for the Event Hub pulls. | `string` | n/a | yes |
| <a name="input_azure_eventhub_azure_storage_container"></a> [azure\_eventhub\_azure\_storage\_container](#input\_azure\_eventhub\_azure\_storage\_container) | Name of the Azure Storage Container that will be used to store a marker for the Event Hub pulls. | `string` | n/a | yes |
| <a name="input_azure_eventhub_azure_storage_secret_key"></a> [azure\_eventhub\_azure\_storage\_secret\_key](#input\_azure\_eventhub\_azure\_storage\_secret\_key) | Access Key with permissions to access the Storage Account. | `string` | n/a | yes |
| <a name="input_azure_eventhub_eventhub_access_key"></a> [azure\_eventhub\_eventhub\_access\_key](#input\_azure\_eventhub\_eventhub\_access\_key) | The primary key of the shared shared access policy for the namespace containing the targeted Event Hub. | `string` | n/a | yes |
| <a name="input_azure_eventhub_eventhub_access_policy"></a> [azure\_eventhub\_eventhub\_access\_policy](#input\_azure\_eventhub\_eventhub\_access\_policy) | The name of the shared access policy for the namespace containing the targeted Event Hub. Must have read access. | `string` | n/a | yes |
| <a name="input_azure_eventhub_eventhub_name"></a> [azure\_eventhub\_eventhub\_name](#input\_azure\_eventhub\_eventhub\_name) | Name of the Event Hub containing the audit logs. | `string` | n/a | yes |
| <a name="input_azure_eventhub_eventhub_namespace"></a> [azure\_eventhub\_eventhub\_namespace](#input\_azure\_eventhub\_eventhub\_namespace) | Name of the Event Hub Namespace containing the Event Hub. | `string` | n/a | yes |
| <a name="input_azure_eventhub_gateway_id"></a> [azure\_eventhub\_gateway\_id](#input\_azure\_eventhub\_gateway\_id) | Unique identifier (UID) attached to the jSonar machine controlling the asset | `string` | n/a | yes |
| <a name="input_azure_eventhub_reason"></a> [azure\_eventhub\_reason](#input\_azure\_eventhub\_reason) | Used to differentiate connections that belong to the same asset | `string` | `"default"` | no |
| <a name="input_azure_ms_sql_server_admin_email"></a> [azure\_ms\_sql\_server\_admin\_email](#input\_azure\_ms\_sql\_server\_admin\_email) | The email address to notify about the asset. | `string` | n/a | yes |
| <a name="input_azure_ms_sql_server_audit_pull_enabled"></a> [azure\_ms\_sql\_server\_audit\_pull\_enabled](#input\_azure\_ms\_sql\_server\_audit\_pull\_enabled) | If true, sonargateway will collect the audit logs for this system if it can. | `bool` | `false` | no |
| <a name="input_azure_ms_sql_server_database_name"></a> [azure\_ms\_sql\_server\_database\_name](#input\_azure\_ms\_sql\_server\_database\_name) | Specifies the name of the database to connect to (or default DB). | `string` | `"master"` | no |
| <a name="input_azure_ms_sql_server_gateway_id"></a> [azure\_ms\_sql\_server\_gateway\_id](#input\_azure\_ms\_sql\_server\_gateway\_id) | Unique identifier (UID) attached to the jSonar machine controlling the asset | `string` | n/a | yes |
| <a name="input_azure_ms_sql_server_location"></a> [azure\_ms\_sql\_server\_location](#input\_azure\_ms\_sql\_server\_location) | Physical location/region of the SQL Server instance, e.g. "EAST US" | `string` | `null` | no |
| <a name="input_azure_ms_sql_server_parent_asset_id"></a> [azure\_ms\_sql\_server\_parent\_asset\_id](#input\_azure\_ms\_sql\_server\_parent\_asset\_id) | The asset\_id of the AZURE asset representing the Azure account where this server is located. | `string` | `null` | no |
| <a name="input_diagnostic_setting_eventhub_authorization_rule_id"></a> [diagnostic\_setting\_eventhub\_authorization\_rule\_id](#input\_diagnostic\_setting\_eventhub\_authorization\_rule\_id) | Specifies the ID of an Event Hub Namespace Authorization Rule used to send Diagnostics Data. Must have write access. | `string` | n/a | yes |
| <a name="input_diagnostic_setting_eventhub_name"></a> [diagnostic\_setting\_eventhub\_name](#input\_diagnostic\_setting\_eventhub\_name) | Specifies the name of the Event Hub where Diagnostics Data should be sent. | `string` | n/a | yes |
| <a name="input_diagnostic_setting_name"></a> [diagnostic\_setting\_name](#input\_diagnostic\_setting\_name) | Specifies the name of the Diagnostic Setting. Changing this forces a new resource to be created. | `string` | `"dsfhubdiagnostic"` | no |
| <a name="input_server_administrator_login"></a> [server\_administrator\_login](#input\_server\_administrator\_login) | The administrator login name for the new server. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_server_administrator_login_password"></a> [server\_administrator\_login\_password](#input\_server\_administrator\_login\_password) | The password associated with the administrator\_login user. | `string` | n/a | yes |
| <a name="input_server_location"></a> [server\_location](#input\_server\_location) | Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_server_name"></a> [server\_name](#input\_server\_name) | The name of the Microsoft SQL Server. This needs to be globally unique within Azure. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_server_public_network_access_enabled"></a> [server\_public\_network\_access\_enabled](#input\_server\_public\_network\_access\_enabled) | Whether public network access is allowed for this server. Defaults to true. | `bool` | `true` | no |
| <a name="input_server_resource_group_name"></a> [server\_resource\_group\_name](#input\_server\_resource\_group\_name) | The name of the resource group in which to create the Microsoft SQL Server. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_server_tags"></a> [server\_tags](#input\_server\_tags) | A mapping of tags to assign to the resource. | `map(string)` | `null` | no |
| <a name="input_server_version"></a> [server\_version](#input\_server\_version) | The version for the new server. Valid values are: 2.0 (for v11 server) and 12.0 (for v12 server). Changing this forces a new resource to be created. | `string` | `"12.0"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_azure-eventhub-asset"></a> [azure-eventhub-asset](#output\_azure-eventhub-asset) | AZURE EVENTHUB asset. |
| <a name="output_azure-ms-sql-server-asset"></a> [azure-ms-sql-server-asset](#output\_azure-ms-sql-server-asset) | AZURE MS SQL SERVER asset. |
| <a name="output_sql-server-diagnostic-setting"></a> [sql-server-diagnostic-setting](#output\_sql-server-diagnostic-setting) | Diagnostic Setting. |
| <a name="output_sql-server-extended-server-audit-policy"></a> [sql-server-extended-server-audit-policy](#output\_sql-server-extended-server-audit-policy) | Azure MS SQL Server Extended Auditing Policy. |
| <a name="output_sql-server-instance"></a> [sql-server-instance](#output\_sql-server-instance) | Azure SQL Server instance. |
<!-- END_TF_DOCS -->