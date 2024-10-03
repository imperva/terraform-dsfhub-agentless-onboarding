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
| [azurerm_network_security_group.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_security_group) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_location"></a> [location](#input\_location) | Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | Specifies the name of the network security group. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The name of the resource group in which to create the network security group. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_security_rules"></a> [security\_rules](#input\_security\_rules) | List of security\_rule objects representing security rules, see the [azurerm documentation](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_security_group#security_rule) for more details. | <pre>list(<br>    object(<br>      {<br>        access                       = string<br>        description                  = optional(string)<br>        destination_address_prefix   = optional(string)<br>        destination_address_prefixes = optional(list(string))<br>        destination_port_range       = optional(string)<br>        destination_port_ranges      = optional(list(string))<br>        direction                    = string<br>        name                         = string<br>        priority                     = number<br>        protocol                     = string<br>        source_address_prefix        = optional(string)<br>        source_address_prefixes      = optional(list(string))<br>        source_port_range            = optional(string)<br>        source_port_ranges           = optional(list(string))<br><br>      }<br>    )<br>  )</pre> | `[]` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A mapping of tags to assign to the resource. | `map(string)` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_this"></a> [this](#output\_this) | Azure Network Security Rule. |
<!-- END_TF_DOCS -->