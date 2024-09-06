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
| [azurerm_eventhub_namespace_authorization_rule.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/eventhub_namespace_authorization_rule) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_listen"></a> [listen](#input\_listen) | Grants listen access to this this Authorization Rule. Defaults to false. | `bool` | `false` | no |
| <a name="input_manage"></a> [manage](#input\_manage) | Grants manage access to this this Authorization Rule. When this property is true - both listen and send must be too. Defaults to false. | `bool` | `false` | no |
| <a name="input_name"></a> [name](#input\_name) | Specifies the name of the Authorization Rule. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_namespace_name"></a> [namespace\_name](#input\_namespace\_name) | Specifies the name of the Event Hub Namespace. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The name of the resource group in which the Event Hub Namespace exists. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_send"></a> [send](#input\_send) | Grants send access to this this Authorization Rule. Defaults to false. | `bool` | `false` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_this"></a> [this](#output\_this) | Authorization Rule for an Event Hub Namespace |
<!-- END_TF_DOCS -->