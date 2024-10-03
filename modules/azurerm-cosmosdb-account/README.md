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

- [azurerm_cosmosdb_account.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/cosmosdb_account) (resource)

## Required Inputs

The following input variables are required:

### <a name="input_location"></a> [location](#input\_location)

Description: Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created.

Type: `string`

### <a name="input_name"></a> [name](#input\_name)

Description: Specifies the name of the CosmosDB Account. Changing this forces a new resource to be created.

Type: `string`

### <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name)

Description: The name of the resource group in which the CosmosDB Account is created. Changing this forces a new resource to be created.

Type: `string`

### <a name="input_tags"></a> [tags](#input\_tags)

Description: A mapping of tags to assign to the resource.

Type: `map(string)`

## Optional Inputs

The following input variables are optional (have default values):

### <a name="input_capabilities"></a> [capabilities](#input\_capabilities)

Description: Configures the capabilities to be enabled for this Cosmos DB account.

Type:

```hcl
list(object({
    name = string
  }))
```

Default: `null`

### <a name="input_consistency_policy"></a> [consistency\_policy](#input\_consistency\_policy)

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

### <a name="input_geo_location"></a> [geo\_location](#input\_geo\_location)

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

### <a name="input_kind"></a> [kind](#input\_kind)

Description: Specifies the Kind of CosmosDB to create - possible values are GlobalDocumentDB (used for both SQL and Table API) and MongoDB. Defaults to GlobalDocumentDB. Changing this forces a new resource to be created. Defaults to GlobalDocumentDB.

Type: `string`

Default: `"GlobalDocumentDB"`

### <a name="input_mongo_server_version"></a> [mongo\_server\_version](#input\_mongo\_server\_version)

Description: The Server Version of a MongoDB account. Possible values are 4.2, 4.0, 3.6, and 3.2.

Type: `string`

Default: `null`

## Outputs

The following outputs are exported:

### <a name="output_this"></a> [this](#output\_this)

Description: Azure CosmosDB account.
<!-- END_TF_DOCS -->