# onboard-azure-cosmosdb-mongo
Onboard Azure Cosmos DB API for MongoDB to DSF Hub.

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

The following Modules are called:

### <a name="module_azure-cosmosdb-mongo-asset"></a> [azure-cosmosdb-mongo-asset](#module\_azure-cosmosdb-mongo-asset)

Source: ../dsfhub-azure-cosmosdb-mongo

Version:

### <a name="module_cosmos-mongo-account"></a> [cosmos-mongo-account](#module\_cosmos-mongo-account)

Source: ../azurerm-cosmosdb-account

Version:

### <a name="module_diagnostic-setting"></a> [diagnostic-setting](#module\_diagnostic-setting)

Source: ../azurerm-monitor-diagnostic-setting

Version:

## Resources

No resources.

## Required Inputs

The following input variables are required:

### <a name="input_azure_cosmosdb_mongo_admin_email"></a> [azure\_cosmosdb\_mongo\_admin\_email](#input\_azure\_cosmosdb\_mongo\_admin\_email)

Description: The email address to notify about this asset

Type: `string`

### <a name="input_azure_cosmosdb_mongo_gateway_id"></a> [azure\_cosmosdb\_mongo\_gateway\_id](#input\_azure\_cosmosdb\_mongo\_gateway\_id)

Description: Unique identifier (UID) attached to the jSonar machine controlling the asset

Type: `string`

### <a name="input_azure_cosmosdb_mongo_logs_destination_asset_id"></a> [azure\_cosmosdb\_mongo\_logs\_destination\_asset\_id](#input\_azure\_cosmosdb\_mongo\_logs\_destination\_asset\_id)

Description: The asset\_id of the AZURE EVENTHUB asset that this instance is sending its audit logs to.

Type: `string`

### <a name="input_cosmosdb_account_location"></a> [cosmosdb\_account\_location](#input\_cosmosdb\_account\_location)

Description: Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created.

Type: `string`

### <a name="input_cosmosdb_account_name"></a> [cosmosdb\_account\_name](#input\_cosmosdb\_account\_name)

Description: Specifies the name of the CosmosDB Account. Changing this forces a new resource to be created.

Type: `string`

### <a name="input_cosmosdb_account_resource_group_name"></a> [cosmosdb\_account\_resource\_group\_name](#input\_cosmosdb\_account\_resource\_group\_name)

Description: The name of the resource group in which the CosmosDB Account is created. Changing this forces a new resource to be created.

Type: `string`

### <a name="input_diagnostic_setting_eventhub_authorization_rule_id"></a> [diagnostic\_setting\_eventhub\_authorization\_rule\_id](#input\_diagnostic\_setting\_eventhub\_authorization\_rule\_id)

Description: Specifies the ID of an Event Hub Namespace Authorization Rule used to send Diagnostics Data.

Type: `string`

### <a name="input_diagnostic_setting_eventhub_name"></a> [diagnostic\_setting\_eventhub\_name](#input\_diagnostic\_setting\_eventhub\_name)

Description: Specifies the name of the Event Hub where Diagnostics Data should be sent.

Type: `string`

### <a name="input_diagnostic_setting_name"></a> [diagnostic\_setting\_name](#input\_diagnostic\_setting\_name)

Description: Specifies the name of the Diagnostic Setting. Changing this forces a new resource to be created.

Type: `string`

## Optional Inputs

The following input variables are optional (have default values):

### <a name="input_azure_cosmosdb_mongo_audit_pull_enabled"></a> [azure\_cosmosdb\_mongo\_audit\_pull\_enabled](#input\_azure\_cosmosdb\_mongo\_audit\_pull\_enabled)

Description: If true, sonargateway will collect the audit logs for this system if it can.

Type: `bool`

Default: `false`

### <a name="input_cosmosdb_account_capabilities"></a> [cosmosdb\_account\_capabilities](#input\_cosmosdb\_account\_capabilities)

Description: Configures the capabilities to be enabled for this Cosmos DB account.

Type:

```hcl
list(object({
    name = string
  }))
```

Default: `null`

### <a name="input_cosmosdb_account_consistency_policy"></a> [cosmosdb\_account\_consistency\_policy](#input\_cosmosdb\_account\_consistency\_policy)

Description: Block defining the database consistency level. See the [Azure documentation](https://learn.microsoft.com/en-us/azure/cosmos-db/consistency-levels) for more information.

Type:

```hcl
list(
    object(
      {
        consistency_level       = string
        max_interval_in_seconds = optional(number, 5)
        max_staleness_prefix    = optional(number)
      }
    )
  )
```

Default:

```json
[
  {
    "consistency_level": "Session"
  }
]
```

### <a name="input_cosmosdb_account_geo_location"></a> [cosmosdb\_account\_geo\_location](#input\_cosmosdb\_account\_geo\_location)

Description: value

Type:

```hcl
list(
    object(
      {
        location          = string
        failover_priority = number
        zone_redundant    = optional(bool, false)
      }
    )
  )
```

Default:

```json
[
  {
    "failover_priority": 0,
    "location": "eastus",
    "zone_redundant": false
  }
]
```

### <a name="input_cosmosdb_account_mongo_server_version"></a> [cosmosdb\_account\_mongo\_server\_version](#input\_cosmosdb\_account\_mongo\_server\_version)

Description: The Server Version of a MongoDB account. Possible values are 4.2, 4.0, 3.6, and 3.2. Defaults to 4.2.

Type: `string`

Default: `"4.2"`

### <a name="input_cosmosdb_account_tags"></a> [cosmosdb\_account\_tags](#input\_cosmosdb\_account\_tags)

Description: A mapping of tags to assign to the resource.

Type: `map(string)`

Default: `null`

### <a name="input_diagnostic_setting_storage_account_id"></a> [diagnostic\_setting\_storage\_account\_id](#input\_diagnostic\_setting\_storage\_account\_id)

Description: The ID of the Storage Account where logs should be sent.

Type: `string`

Default: `null`

## Outputs

The following outputs are exported:

### <a name="output_azure-cosmosdb-asset"></a> [azure-cosmosdb-asset](#output\_azure-cosmosdb-asset)

Description: AZURE COSMOSDB MONGO asset.

### <a name="output_cosmos-mongo-account"></a> [cosmos-mongo-account](#output\_cosmos-mongo-account)

Description: CosmosDB MongoDB account.

### <a name="output_diagnostic-setting"></a> [diagnostic-setting](#output\_diagnostic-setting)

Description: Diagnostic Setting.
<!-- END_TF_DOCS -->