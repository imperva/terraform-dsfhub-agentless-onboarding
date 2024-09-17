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
| [azurerm_cosmosdb_account.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/cosmosdb_account) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_capabilities"></a> [capabilities](#input\_capabilities) | Configures the capabilities to be enabled for this Cosmos DB account. | <pre>list(object({<br>    name = string<br>  }))</pre> | `null` | no |
| <a name="input_consistency_policy"></a> [consistency\_policy](#input\_consistency\_policy) | Block defining the database consistency level. See the [Azure documentation](https://learn.microsoft.com/en-us/azure/cosmos-db/consistency-levels) for more information. | <pre>list(<br>    object(<br>      {<br>        consistency_level       = string<br>        max_interval_in_seconds = optional(number, 5)<br>        max_staleness_prefix    = optional(number)<br>      }<br>    )<br>  )</pre> | <pre>[<br>  {<br>    "consistency_level": "Session"<br>  }<br>]</pre> | no |
| <a name="input_geo_location"></a> [geo\_location](#input\_geo\_location) | value | <pre>list(<br>    object(<br>      {<br>        location          = string<br>        failover_priority = number<br>        zone_redundant    = optional(bool, false)<br>      }<br>    )<br>  )</pre> | <pre>[<br>  {<br>    "failover_priority": 0,<br>    "location": "eastus",<br>    "zone_redundant": false<br>  }<br>]</pre> | no |
| <a name="input_kind"></a> [kind](#input\_kind) | Specifies the Kind of CosmosDB to create - possible values are GlobalDocumentDB (used for both SQL and Table API) and MongoDB. Defaults to GlobalDocumentDB. Changing this forces a new resource to be created. Defaults to GlobalDocumentDB. | `string` | `"GlobalDocumentDB"` | no |
| <a name="input_location"></a> [location](#input\_location) | Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_mongo_server_version"></a> [mongo\_server\_version](#input\_mongo\_server\_version) | The Server Version of a MongoDB account. Possible values are 4.2, 4.0, 3.6, and 3.2. | `string` | `null` | no |
| <a name="input_name"></a> [name](#input\_name) | Specifies the name of the CosmosDB Account. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The name of the resource group in which the CosmosDB Account is created. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | A mapping of tags to assign to the resource. | `map(string)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_this"></a> [this](#output\_this) | Azure CosmosDB account. |
<!-- END_TF_DOCS -->