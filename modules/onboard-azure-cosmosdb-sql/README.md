# onboard-azure-cosmosdb-sql
Onboard Azure Cosmos DB with SQL API to DSF Hub.

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

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_azure-cosmosdb-asset"></a> [azure-cosmosdb-asset](#module\_azure-cosmosdb-asset) | ../dsfhub-azure-cosmosdb | n/a |
| <a name="module_cosmos-sql-account"></a> [cosmos-sql-account](#module\_cosmos-sql-account) | ../azurerm-cosmosdb-account | n/a |
| <a name="module_diagnostic-setting"></a> [diagnostic-setting](#module\_diagnostic-setting) | ../azurerm-monitor-diagnostic-setting | n/a |
| <a name="module_enable-full-text-query"></a> [enable-full-text-query](#module\_enable-full-text-query) | ../azapi-update-resource | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_azure_cosmosdb_admin_email"></a> [azure\_cosmosdb\_admin\_email](#input\_azure\_cosmosdb\_admin\_email) | The email address to notify about this asset | `string` | n/a | yes |
| <a name="input_azure_cosmosdb_audit_pull_enabled"></a> [azure\_cosmosdb\_audit\_pull\_enabled](#input\_azure\_cosmosdb\_audit\_pull\_enabled) | If true, sonargateway will collect the audit logs for this system if it can. | `bool` | `false` | no |
| <a name="input_azure_cosmosdb_gateway_id"></a> [azure\_cosmosdb\_gateway\_id](#input\_azure\_cosmosdb\_gateway\_id) | Unique identifier (UID) attached to the jSonar machine controlling the asset | `string` | n/a | yes |
| <a name="input_azure_cosmosdb_logs_destination_asset_id"></a> [azure\_cosmosdb\_logs\_destination\_asset\_id](#input\_azure\_cosmosdb\_logs\_destination\_asset\_id) | The asset\_id of the AZURE EVENTHUB asset that this instance is sending its audit logs to. | `string` | n/a | yes |
| <a name="input_cosmosdb_account_capabilities"></a> [cosmosdb\_account\_capabilities](#input\_cosmosdb\_account\_capabilities) | Configures the capabilities to be enabled for this Cosmos DB account. | <pre>list(object({<br>    name = string<br>  }))</pre> | `null` | no |
| <a name="input_cosmosdb_account_consistency_policy"></a> [cosmosdb\_account\_consistency\_policy](#input\_cosmosdb\_account\_consistency\_policy) | Block defining the database consistency level. See the [Azure documentation](https://learn.microsoft.com/en-us/azure/cosmos-db/consistency-levels) for more information. | <pre>list(<br>    object(<br>      {<br>        consistency_level       = string<br>        max_interval_in_seconds = optional(number, 5)<br>        max_staleness_prefix    = optional(number)<br>      }<br>    )<br>  )</pre> | <pre>[<br>  {<br>    "consistency_level": "Session"<br>  }<br>]</pre> | no |
| <a name="input_cosmosdb_account_geo_location"></a> [cosmosdb\_account\_geo\_location](#input\_cosmosdb\_account\_geo\_location) | Used to define where data should be replicated with the failover\_priority 0 specifying the primary location. | <pre>list(<br>    object(<br>      {<br>        location          = string<br>        failover_priority = number<br>        zone_redundant    = optional(bool, false)<br>      }<br>    )<br>  )</pre> | <pre>[<br>  {<br>    "failover_priority": 0,<br>    "location": "eastus",<br>    "zone_redundant": false<br>  }<br>]</pre> | no |
| <a name="input_cosmosdb_account_location"></a> [cosmosdb\_account\_location](#input\_cosmosdb\_account\_location) | Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_cosmosdb_account_name"></a> [cosmosdb\_account\_name](#input\_cosmosdb\_account\_name) | Specifies the name of the CosmosDB Account. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_cosmosdb_account_resource_group_name"></a> [cosmosdb\_account\_resource\_group\_name](#input\_cosmosdb\_account\_resource\_group\_name) | The name of the resource group in which the CosmosDB Account is created. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_cosmosdb_account_tags"></a> [cosmosdb\_account\_tags](#input\_cosmosdb\_account\_tags) | A mapping of tags to assign to the resource. | `map(string)` | `null` | no |
| <a name="input_diagnostic_setting_eventhub_authorization_rule_id"></a> [diagnostic\_setting\_eventhub\_authorization\_rule\_id](#input\_diagnostic\_setting\_eventhub\_authorization\_rule\_id) | Specifies the ID of an Event Hub Namespace Authorization Rule used to send Diagnostics Data. | `string` | n/a | yes |
| <a name="input_diagnostic_setting_eventhub_name"></a> [diagnostic\_setting\_eventhub\_name](#input\_diagnostic\_setting\_eventhub\_name) | Specifies the name of the Event Hub where Diagnostics Data should be sent. | `string` | n/a | yes |
| <a name="input_diagnostic_setting_name"></a> [diagnostic\_setting\_name](#input\_diagnostic\_setting\_name) | Specifies the name of the Diagnostic Setting. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_diagnostic_setting_storage_account_id"></a> [diagnostic\_setting\_storage\_account\_id](#input\_diagnostic\_setting\_storage\_account\_id) | The ID of the Storage Account where logs should be sent. | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_azure-cosmosdb-asset"></a> [azure-cosmosdb-asset](#output\_azure-cosmosdb-asset) | AZURE COSMOSDB asset. |
| <a name="output_cosmos-sql-account"></a> [cosmos-sql-account](#output\_cosmos-sql-account) | CosmosDB SQL account. |
| <a name="output_diagnostic-setting"></a> [diagnostic-setting](#output\_diagnostic-setting) | Diagnostic Setting. |
| <a name="output_enable-full-text-query"></a> [enable-full-text-query](#output\_enable-full-text-query) | API update to enable full text query logging. |
<!-- END_TF_DOCS -->