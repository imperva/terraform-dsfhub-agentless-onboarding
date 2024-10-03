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
| [azurerm_route_table.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/route_table) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_location"></a> [location](#input\_location) | Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | The name of the route table. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The name of the resource group in which to create the route table. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_route"></a> [route](#input\_route) | A list of route objects. See the [azure documentation](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/route_table) for more details. | <pre>list(<br>    object(<br>      {<br>        name                   = string<br>        address_prefix         = string<br>        next_hop_type          = string<br>        next_hop_in_ip_address = optional(string)<br>      }<br>    )<br>  )</pre> | `null` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A mapping of tags to assign to the resource. | `map(string)` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_this"></a> [this](#output\_this) | Azure Route Table and Routes. |
<!-- END_TF_DOCS -->