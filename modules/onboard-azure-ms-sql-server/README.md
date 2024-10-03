# onboard-azure-ms-sql-server
Onboard Azure SQL Server to DSF Hub.

## Notes
There are two prerequisites for using this module:
1. An Azure Event Hub Namespace and Event Hub. 
2. An Azure Storage Account and Container. This is used by DSF to store a marker which keeps track of what data in the Event Hub has been consumed.

These can be created along with an AZURE EVENTHUB asset via the ``onboard-azure-eventhub`` module.

See the corresponding example for more details.

<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

The following providers are used by this module:

- <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm)

- <a name="provider_time"></a> [time](#provider\_time)

## Modules

The following Modules are called:

### <a name="module_azure-ms-sql-server-asset"></a> [azure-ms-sql-server-asset](#module\_azure-ms-sql-server-asset)

Source: ../dsfhub-azure-ms-sql-server

Version:

### <a name="module_sql-server-diagnostic-setting"></a> [sql-server-diagnostic-setting](#module\_sql-server-diagnostic-setting)

Source: ../azurerm-monitor-diagnostic-setting

Version:

### <a name="module_sql-server-extended-server-audit-policy"></a> [sql-server-extended-server-audit-policy](#module\_sql-server-extended-server-audit-policy)

Source: ../azurerm-mssql-server-extended-auditing-policy

Version:

### <a name="module_sql-server-instance"></a> [sql-server-instance](#module\_sql-server-instance)

Source: ../azurerm-mssql-server

Version:

## Resources

The following resources are used by this module:

- [time_sleep.wait](https://registry.terraform.io/providers/hashicorp/time/latest/docs/resources/sleep) (resource)
- [azurerm_mssql_database.master](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/mssql_database) (data source)

## Required Inputs

The following input variables are required:

### <a name="input_azure_ms_sql_server_admin_email"></a> [azure\_ms\_sql\_server\_admin\_email](#input\_azure\_ms\_sql\_server\_admin\_email)

Description: The email address to notify about the asset.

Type: `string`

### <a name="input_azure_ms_sql_server_gateway_id"></a> [azure\_ms\_sql\_server\_gateway\_id](#input\_azure\_ms\_sql\_server\_gateway\_id)

Description: Unique identifier (UID) attached to the jSonar machine controlling the asset

Type: `string`

### <a name="input_azure_ms_sql_server_logs_destination_asset_id"></a> [azure\_ms\_sql\_server\_logs\_destination\_asset\_id](#input\_azure\_ms\_sql\_server\_logs\_destination\_asset\_id)

Description: The asset\_id of the AZURE EVENTHUB asset that this instance is sending its audit logs to.

Type: `string`

### <a name="input_diagnostic_setting_eventhub_authorization_rule_id"></a> [diagnostic\_setting\_eventhub\_authorization\_rule\_id](#input\_diagnostic\_setting\_eventhub\_authorization\_rule\_id)

Description: Specifies the ID of an Event Hub Namespace Authorization Rule used to send Diagnostics Data. Must have write access.

Type: `string`

### <a name="input_diagnostic_setting_eventhub_name"></a> [diagnostic\_setting\_eventhub\_name](#input\_diagnostic\_setting\_eventhub\_name)

Description: Specifies the name of the Event Hub where Diagnostics Data should be sent.

Type: `string`

### <a name="input_server_administrator_login"></a> [server\_administrator\_login](#input\_server\_administrator\_login)

Description: The administrator login name for the new server. Changing this forces a new resource to be created.

Type: `string`

### <a name="input_server_administrator_login_password"></a> [server\_administrator\_login\_password](#input\_server\_administrator\_login\_password)

Description: The password associated with the administrator\_login user.

Type: `string`

### <a name="input_server_location"></a> [server\_location](#input\_server\_location)

Description: Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created.

Type: `string`

### <a name="input_server_name"></a> [server\_name](#input\_server\_name)

Description: The name of the Microsoft SQL Server. This needs to be globally unique within Azure. Changing this forces a new resource to be created.

Type: `string`

### <a name="input_server_resource_group_name"></a> [server\_resource\_group\_name](#input\_server\_resource\_group\_name)

Description: The name of the resource group in which to create the Microsoft SQL Server. Changing this forces a new resource to be created.

Type: `string`

## Optional Inputs

The following input variables are optional (have default values):

### <a name="input_audit_policy_enabled"></a> [audit\_policy\_enabled](#input\_audit\_policy\_enabled)

Description: Whether to enable the extended auditing policy on the SQL Server instance. Defaults to true.

Type: `bool`

Default: `true`

### <a name="input_azure_ms_sql_server_audit_pull_enabled"></a> [azure\_ms\_sql\_server\_audit\_pull\_enabled](#input\_azure\_ms\_sql\_server\_audit\_pull\_enabled)

Description: If true, sonargateway will collect the audit logs for this system if it can.

Type: `bool`

Default: `false`

### <a name="input_azure_ms_sql_server_database_name"></a> [azure\_ms\_sql\_server\_database\_name](#input\_azure\_ms\_sql\_server\_database\_name)

Description: Specifies the name of the database to connect to (or default DB).

Type: `string`

Default: `"master"`

### <a name="input_azure_ms_sql_server_location"></a> [azure\_ms\_sql\_server\_location](#input\_azure\_ms\_sql\_server\_location)

Description: Physical location/region of the SQL Server instance, e.g. "EAST US"

Type: `string`

Default: `null`

### <a name="input_azure_ms_sql_server_parent_asset_id"></a> [azure\_ms\_sql\_server\_parent\_asset\_id](#input\_azure\_ms\_sql\_server\_parent\_asset\_id)

Description: The asset\_id of the AZURE asset representing the Azure account where this server is located.

Type: `string`

Default: `null`

### <a name="input_diagnostic_setting_name"></a> [diagnostic\_setting\_name](#input\_diagnostic\_setting\_name)

Description: Specifies the name of the Diagnostic Setting. Changing this forces a new resource to be created.

Type: `string`

Default: `"dsfhubdiagnostic"`

### <a name="input_server_public_network_access_enabled"></a> [server\_public\_network\_access\_enabled](#input\_server\_public\_network\_access\_enabled)

Description: Whether public network access is allowed for this server. Defaults to true.

Type: `bool`

Default: `true`

### <a name="input_server_tags"></a> [server\_tags](#input\_server\_tags)

Description: A mapping of tags to assign to the resource.

Type: `map(string)`

Default: `null`

### <a name="input_server_version"></a> [server\_version](#input\_server\_version)

Description: The version for the new server. Valid values are: 2.0 (for v11 server) and 12.0 (for v12 server). Changing this forces a new resource to be created.

Type: `string`

Default: `"12.0"`

## Outputs

The following outputs are exported:

### <a name="output_azure-ms-sql-server-asset"></a> [azure-ms-sql-server-asset](#output\_azure-ms-sql-server-asset)

Description: AZURE MS SQL SERVER asset.

### <a name="output_sql-server-diagnostic-setting"></a> [sql-server-diagnostic-setting](#output\_sql-server-diagnostic-setting)

Description: Diagnostic Setting.

### <a name="output_sql-server-extended-server-audit-policy"></a> [sql-server-extended-server-audit-policy](#output\_sql-server-extended-server-audit-policy)

Description: Azure MS SQL Server Extended Auditing Policy.

### <a name="output_sql-server-instance"></a> [sql-server-instance](#output\_sql-server-instance)

Description: Azure SQL Server instance.
<!-- END_TF_DOCS -->