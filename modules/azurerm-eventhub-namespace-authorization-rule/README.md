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

- [azurerm_eventhub_namespace_authorization_rule.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/eventhub_namespace_authorization_rule) (resource)

## Required Inputs

The following input variables are required:

### <a name="input_name"></a> [name](#input\_name)

Description: Specifies the name of the Authorization Rule. Changing this forces a new resource to be created.

Type: `string`

### <a name="input_namespace_name"></a> [namespace\_name](#input\_namespace\_name)

Description: Specifies the name of the Event Hub Namespace. Changing this forces a new resource to be created.

Type: `string`

### <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name)

Description: The name of the resource group in which the Event Hub Namespace exists. Changing this forces a new resource to be created.

Type: `string`

## Optional Inputs

The following input variables are optional (have default values):

### <a name="input_listen"></a> [listen](#input\_listen)

Description: Grants listen access to this Authorization Rule. Defaults to false.

Type: `bool`

Default: `false`

### <a name="input_manage"></a> [manage](#input\_manage)

Description: Grants manage access to this Authorization Rule. When this property is true - both listen and send must be too. Defaults to false.

Type: `bool`

Default: `false`

### <a name="input_send"></a> [send](#input\_send)

Description: Grants send access to this Authorization Rule. Defaults to false.

Type: `bool`

Default: `false`

## Outputs

The following outputs are exported:

### <a name="output_this"></a> [this](#output\_this)

Description: Authorization Rule for an Event Hub Namespace
<!-- END_TF_DOCS -->