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
| [azurerm_eventhub.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/eventhub) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_message_retention"></a> [message\_retention](#input\_message\_retention) | Specifies the number of days to retain the events for this Event Hub. Defaults to 1. | `number` | `1` | no |
| <a name="input_name"></a> [name](#input\_name) | Specifies the name of the Event Hub resource. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_namespace_id"></a> [namespace\_id](#input\_namespace\_id) | Specifies the ID of the EventHub Namespace. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_partition_count"></a> [partition\_count](#input\_partition\_count) | Specifies the current number of shards on the Event Hub. Note: partition\_count cannot be changed unless Eventhub Namespace SKU is Premium and cannot be decreased. Defaults to 1. | `number` | `1` | no |
| <a name="input_status"></a> [status](#input\_status) | Specifies the status of the Event Hub resource. Possible values are Active, Disabled and SendDisabled. Defaults to Active. | `string` | `"Active"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_this"></a> [this](#output\_this) | Azure Event Hub |
<!-- END_TF_DOCS -->