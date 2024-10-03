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

- [azurerm_mssql_server.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/mssql_server) (resource)

## Required Inputs

The following input variables are required:

### <a name="input_administrator_login"></a> [administrator\_login](#input\_administrator\_login)

Description: The administrator login name for the new server. Changing this forces a new resource to be created.

Type: `string`

### <a name="input_administrator_login_password"></a> [administrator\_login\_password](#input\_administrator\_login\_password)

Description: The password associated with the administrator\_login user.

Type: `string`

### <a name="input_location"></a> [location](#input\_location)

Description: Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created.

Type: `string`

### <a name="input_name"></a> [name](#input\_name)

Description: The name of the Microsoft SQL Server. This needs to be globally unique within Azure. Changing this forces a new resource to be created.

Type: `string`

### <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name)

Description: The name of the resource group in which to create the Microsoft SQL Server. Changing this forces a new resource to be created.

Type: `string`

## Optional Inputs

The following input variables are optional (have default values):

### <a name="input_public_network_access_enabled"></a> [public\_network\_access\_enabled](#input\_public\_network\_access\_enabled)

Description: Whether public network access is allowed for this server. Defaults to true.

Type: `bool`

Default: `true`

### <a name="input_server_version"></a> [server\_version](#input\_server\_version)

Description: The version for the new server. Valid values are: 2.0 (for v11 server) and 12.0 (for v12 server). Changing this forces a new resource to be created.

Type: `string`

Default: `"12.0"`

### <a name="input_tags"></a> [tags](#input\_tags)

Description: A mapping of tags to assign to the resource.

Type: `map(string)`

Default: `null`

## Outputs

The following outputs are exported:

### <a name="output_this"></a> [this](#output\_this)

Description: Microsoft SQL Azure Database Server
<!-- END_TF_DOCS -->