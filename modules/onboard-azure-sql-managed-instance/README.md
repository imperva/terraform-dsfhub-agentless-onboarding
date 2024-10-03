# onboard-azure-sql-managed-instance

Onboard Azure SQL Managed Instance to DSF Hub.

## Notes
There are two prerequisites for using this module:
1. An Azure Event Hub Namespace and Event Hub. 
2. An Azure Storage Account and Container. This is used by DSF to store a marker which keeps track of what data in the Event Hub has been consumed.
3. A method to create a server audit policy on the managed instance.

The first two can be created along with an AZURE EVENTHUB asset via the ``onboard-azure-eventhub`` module.

See the corresponding example for more details.

<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_azure-ms-sql-managed-instance"></a> [azure-ms-sql-managed-instance](#module\_azure-ms-sql-managed-instance) | ../azurerm-mssql-managed-instance | n/a |
| <a name="module_azure-sql-managed-instance-asset"></a> [azure-sql-managed-instance-asset](#module\_azure-sql-managed-instance-asset) | ../dsfhub-azure-sql-managed-instance | n/a |
| <a name="module_diagnostic-setting"></a> [diagnostic-setting](#module\_diagnostic-setting) | ../azurerm-monitor-diagnostic-setting | n/a |
| <a name="module_route-table"></a> [route-table](#module\_route-table) | ../azurerm-route-table | n/a |
| <a name="module_security-group"></a> [security-group](#module\_security-group) | ../azurerm-network-security-group | n/a |
| <a name="module_virtual-network"></a> [virtual-network](#module\_virtual-network) | ../azurerm-virtual-network | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_azure_sql_managed_instance_admin_email"></a> [azure\_sql\_managed\_instance\_admin\_email](#input\_azure\_sql\_managed\_instance\_admin\_email) | The email address to notify about the asset. | `string` | n/a | yes |
| <a name="input_azure_sql_managed_instance_audit_pull_enabled"></a> [azure\_sql\_managed\_instance\_audit\_pull\_enabled](#input\_azure\_sql\_managed\_instance\_audit\_pull\_enabled) | If true, sonargateway will collect the audit logs for this system if it can. | `bool` | `false` | no |
| <a name="input_azure_sql_managed_instance_auth_mechanism"></a> [azure\_sql\_managed\_instance\_auth\_mechanism](#input\_azure\_sql\_managed\_instance\_auth\_mechanism) | Specifies the auth mechanism used by the connection | `string` | `null` | no |
| <a name="input_azure_sql_managed_instance_database_name"></a> [azure\_sql\_managed\_instance\_database\_name](#input\_azure\_sql\_managed\_instance\_database\_name) | Specifies the name of the database to connect to (or default DB). | `string` | `"master"` | no |
| <a name="input_azure_sql_managed_instance_gateway_id"></a> [azure\_sql\_managed\_instance\_gateway\_id](#input\_azure\_sql\_managed\_instance\_gateway\_id) | Unique identifier (UID) attached to the jSonar machine controlling the asset | `string` | n/a | yes |
| <a name="input_azure_sql_managed_instance_location"></a> [azure\_sql\_managed\_instance\_location](#input\_azure\_sql\_managed\_instance\_location) | Physical location/region of the SQL Managed instance, e.g. "EAST US" | `string` | `null` | no |
| <a name="input_azure_sql_managed_instance_logs_destination_asset_id"></a> [azure\_sql\_managed\_instance\_logs\_destination\_asset\_id](#input\_azure\_sql\_managed\_instance\_logs\_destination\_asset\_id) | The asset\_id of the AZURE EVENTHUB asset that this instance is sending its audit logs to. | `string` | `null` | no |
| <a name="input_azure_sql_managed_instance_parent_asset_id"></a> [azure\_sql\_managed\_instance\_parent\_asset\_id](#input\_azure\_sql\_managed\_instance\_parent\_asset\_id) | The asset\_id of the AZURE asset representing the Azure account where this server is located. | `string` | `null` | no |
| <a name="input_azure_sql_managed_instance_password"></a> [azure\_sql\_managed\_instance\_password](#input\_azure\_sql\_managed\_instance\_password) | Password to use to connect to the SQL Managed instance. | `string` | `null` | no |
| <a name="input_azure_sql_managed_instance_reason"></a> [azure\_sql\_managed\_instance\_reason](#input\_azure\_sql\_managed\_instance\_reason) | Used to differentiate connections that belong to the same asset | `string` | `"default"` | no |
| <a name="input_azure_sql_managed_instance_username"></a> [azure\_sql\_managed\_instance\_username](#input\_azure\_sql\_managed\_instance\_username) | Username of SQL database user to connect with. | `string` | `null` | no |
| <a name="input_diagnostic_setting_eventhub_authorization_rule_id"></a> [diagnostic\_setting\_eventhub\_authorization\_rule\_id](#input\_diagnostic\_setting\_eventhub\_authorization\_rule\_id) | Specifies the ID of an Event Hub Namespace Authorization Rule used to send Diagnostics Data. | `string` | `null` | no |
| <a name="input_diagnostic_setting_eventhub_name"></a> [diagnostic\_setting\_eventhub\_name](#input\_diagnostic\_setting\_eventhub\_name) | Specifies the name of the Event Hub where Diagnostics Data should be sent. | `string` | `null` | no |
| <a name="input_diagnostic_setting_name"></a> [diagnostic\_setting\_name](#input\_diagnostic\_setting\_name) | Specifies the name of the Diagnostic Setting. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_managed_instance_administrator_login"></a> [managed\_instance\_administrator\_login](#input\_managed\_instance\_administrator\_login) | The administrator login name for the new SQL Managed Instance. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_managed_instance_administrator_login_password"></a> [managed\_instance\_administrator\_login\_password](#input\_managed\_instance\_administrator\_login\_password) | The password associated with the administrator\_login user. Needs to comply with Azure's [Password Policy](https://learn.microsoft.com/en-us/sql/relational-databases/security/password-policy?view=sql-server-ver16&redirectedfrom=MSDN) | `string` | n/a | yes |
| <a name="input_managed_instance_license_type"></a> [managed\_instance\_license\_type](#input\_managed\_instance\_license\_type) | What type of license the Managed Instance will use. Possible values are LicenseIncluded and BasePrice. Defaults to LicenseIncluded. | `string` | `"LicenseIncluded"` | no |
| <a name="input_managed_instance_location"></a> [managed\_instance\_location](#input\_managed\_instance\_location) | Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_managed_instance_name"></a> [managed\_instance\_name](#input\_managed\_instance\_name) | The name of the SQL Managed Instance. This needs to be globally unique within Azure. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_managed_instance_public_data_endpoint_enabled"></a> [managed\_instance\_public\_data\_endpoint\_enabled](#input\_managed\_instance\_public\_data\_endpoint\_enabled) | Is the public data endpoint enabled? Default value is false. | `bool` | `false` | no |
| <a name="input_managed_instance_resource_group_name"></a> [managed\_instance\_resource\_group\_name](#input\_managed\_instance\_resource\_group\_name) | The name of the resource group in which to create the SQL Managed Instance. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_managed_instance_sku_name"></a> [managed\_instance\_sku\_name](#input\_managed\_instance\_sku\_name) | Specifies the SKU Name for the SQL Managed Instance. Valid values include GP\_Gen4, GP\_Gen5, GP\_Gen8IM, GP\_Gen8IH, BC\_Gen4, BC\_Gen5, BC\_Gen8IM or BC\_Gen8IH. Defaults to GP\_Gen5. | `string` | `"GP_Gen5"` | no |
| <a name="input_managed_instance_storage_size_in_gb"></a> [managed\_instance\_storage\_size\_in\_gb](#input\_managed\_instance\_storage\_size\_in\_gb) | Maximum storage space for the SQL Managed instance. This should be a multiple of 32 (GB). Defaults to 32. | `number` | `32` | no |
| <a name="input_managed_instance_tags"></a> [managed\_instance\_tags](#input\_managed\_instance\_tags) | A mapping of tags to assign to the resource. | `map(string)` | `null` | no |
| <a name="input_managed_instance_vcores"></a> [managed\_instance\_vcores](#input\_managed\_instance\_vcores) | Number of cores that should be assigned to the SQL Managed Instance. Values can be 8, 16, or 24 for Gen4 SKUs, or 4, 6, 8, 10, 12, 16, 20, 24, 32, 40, 48, 56, 64, 80, 96 or 128 for Gen5 SKUs. Defaults to 4. | `number` | `4` | no |
| <a name="input_route_table_resource_group_name"></a> [route\_table\_resource\_group\_name](#input\_route\_table\_resource\_group\_name) | The name of the resource group in which to create the network route table. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_security_group_resource_group_name"></a> [security\_group\_resource\_group\_name](#input\_security\_group\_resource\_group\_name) | The name of the resource group in which to create the network security group. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_security_group_security_rules"></a> [security\_group\_security\_rules](#input\_security\_group\_security\_rules) | List of security\_rule objects representing security rules, see the [azurerm documentation](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_security_group#security_rule) for more details. These will be applied in addition to the default security rule settings for Managed Instances. | <pre>list(<br>    object(<br>      {<br>        access                       = string<br>        description                  = optional(string)<br>        destination_address_prefix   = optional(string)<br>        destination_address_prefixes = optional(list(string))<br>        destination_port_range       = optional(string)<br>        destination_port_ranges      = optional(list(string))<br>        direction                    = string<br>        name                         = string<br>        priority                     = number<br>        protocol                     = string<br>        source_address_prefix        = optional(string)<br>        source_address_prefixes      = optional(list(string))<br>        source_port_range            = optional(string)<br>        source_port_ranges           = optional(list(string))<br><br>      }<br>    )<br>  )</pre> | `[]` | no |
| <a name="input_security_group_tags"></a> [security\_group\_tags](#input\_security\_group\_tags) | A mapping of tags to assign to the resource. | `map(string)` | `null` | no |
| <a name="input_virtual_network_resource_group_name"></a> [virtual\_network\_resource\_group\_name](#input\_virtual\_network\_resource\_group\_name) | The name of the resource group in which to create the virtual network. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_virtual_network_tags"></a> [virtual\_network\_tags](#input\_virtual\_network\_tags) | A mapping of tags to assign to the resource. | `map(string)` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_azure-ms-sql-managed-instance"></a> [azure-ms-sql-managed-instance](#output\_azure-ms-sql-managed-instance) | Microsoft SQL Azure Managed Instance. |
| <a name="output_azure-sql-managed-instance-asset"></a> [azure-sql-managed-instance-asset](#output\_azure-sql-managed-instance-asset) | AZURE SQL MANAGED INSTANCE asseet. |
| <a name="output_default-managed-instance-security-rules"></a> [default-managed-instance-security-rules](#output\_default-managed-instance-security-rules) | Security rules required for Managed Instances by default. |
| <a name="output_diagnostic-setting"></a> [diagnostic-setting](#output\_diagnostic-setting) | Diagnostic Setting. |
| <a name="output_route-table"></a> [route-table](#output\_route-table) | Azure Managed Instance Route Table. |
| <a name="output_security-group"></a> [security-group](#output\_security-group) | Azure Network Security Group. |
| <a name="output_virtual-network"></a> [virtual-network](#output\_virtual-network) | Azure Managed Instance Virtual Network. |
<!-- END_TF_DOCS -->