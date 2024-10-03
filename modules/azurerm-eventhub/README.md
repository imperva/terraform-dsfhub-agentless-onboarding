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

- [azurerm_eventhub.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/eventhub) (resource)

## Required Inputs

The following input variables are required:

### <a name="input_name"></a> [name](#input\_name)

Description: Specifies the name of the Event Hub resource. Changing this forces a new resource to be created.

Type: `string`

### <a name="input_namespace_name"></a> [namespace\_name](#input\_namespace\_name)

Description: Specifies the name of the Event Hub Namespace. Changing this forces a new resource to be created.

Type: `string`

### <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name)

Description: The name of the resource group in which the Event Hub's parent Namespace exists. Changing this forces a new resource to be created.

Type: `string`

## Optional Inputs

The following input variables are optional (have default values):

### <a name="input_message_retention"></a> [message\_retention](#input\_message\_retention)

Description: Specifies the number of days to retain the events for this Event Hub. Defaults to 1.

Type: `number`

Default: `1`

### <a name="input_partition_count"></a> [partition\_count](#input\_partition\_count)

Description: Specifies the current number of shards on the Event Hub. Note: partition\_count cannot be changed unless Eventhub Namespace SKU is Premium and cannot be decreased. Defaults to 1.

Type: `number`

Default: `1`

### <a name="input_status"></a> [status](#input\_status)

Description: Specifies the status of the Event Hub resource. Possible values are Active, Disabled and SendDisabled. Defaults to Active.

Type: `string`

Default: `"Active"`

## Outputs

The following outputs are exported:

### <a name="output_this"></a> [this](#output\_this)

Description: Azure Event Hub
<!-- END_TF_DOCS -->