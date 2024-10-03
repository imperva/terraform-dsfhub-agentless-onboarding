<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

The following providers are used by this module:

- <a name="provider_azapi"></a> [azapi](#provider\_azapi)

## Modules

No modules.

## Resources

The following resources are used by this module:

- [azapi_update_resource.this](https://registry.terraform.io/providers/Azure/azapi/latest/docs/resources/update_resource) (resource)

## Required Inputs

The following input variables are required:

### <a name="input_body"></a> [body](#input\_body)

Description: The request body used to add on to an existing Azure resource.

Type: `string`

### <a name="input_resource_id"></a> [resource\_id](#input\_resource\_id)

Description: The ID of an existing azure source. Changing this forces a new azure resource to be created.

Type: `string`

### <a name="input_type"></a> [type](#input\_type)

Description: It is in a format like resource-type@api-version. resource-type is the Azure resource type, for example, Microsoft.Storage/storageAccounts. api-version is version of the API used to manage this azure resource.

Type: `any`

## Optional Inputs

No optional inputs.

## Outputs

The following outputs are exported:

### <a name="output_this"></a> [this](#output\_this)

Description: API update for existing Azure resource manager resource.
<!-- END_TF_DOCS -->