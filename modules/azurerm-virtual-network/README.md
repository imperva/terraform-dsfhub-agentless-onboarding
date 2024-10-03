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
| [azurerm_virtual_network.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_address_space"></a> [address\_space](#input\_address\_space) | The address space that is used the virtual network. You can supply more than one address space. | `list(string)` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | The location/region where the virtual network is created. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | The name of the virtual network. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The name of the resource group in which to create the virtual network. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_subnets"></a> [subnets](#input\_subnets) | [<br>  {<br>    address\_prefixes: A list of address prefixes to use for the subnet<br>    default\_outbound\_access\_enabled: (Optional) Enable default outbound access to the internet for the subnet. Defaults to true.<br>    name: The name of the subnet<br>    route\_table\_id: (Optional) The ID of the Route Table that should be associated with this subnet.<br>    security\_group: (Optional) he Network Security Group to associate with the subnet. (Referenced by id, ie. azurerm\_network\_security\_group.example.id)<br><br>    deletegation: (Optional) One or more delegation blocks as defined below.<br>  }<br>]<br><br>delegation: {<br>  name: A name for this delegation.<br>  service\_delegation: A service\_delegation block as defined below.<br>}<br><br>service\_delegation: {<br>  name: The name of service to delegate to.<br>  actions: (Optional) A list of Actions which should be delegated. This list is specific to the service to delegate to.<br>} | <pre>list(<br>    object(<br>      {<br>        address_prefixes                = list(string),<br>        default_outbound_access_enabled = optional(bool, true)<br>        name                            = string<br>        route_table_id                  = optional(string)<br>        security_group                  = optional(string)<br><br>        delegation = optional(list(<br>          object(<br>            {<br>              name = string<br><br>              service_delegation = optional(list(<br>                object(<br>                  {<br>                    name    = string<br>                    actions = optional(list(string))<br>                  }<br>                )<br>              ))<br>            }<br>          )<br>        ))<br>      }<br>    )<br>  )</pre> | `null` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A mapping of tags to assign to the resource. | `map(string)` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_this"></a> [this](#output\_this) | Azure Virtual Network. |
<!-- END_TF_DOCS -->