<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azapi"></a> [azapi](#provider\_azapi) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azapi_update_resource.this](https://registry.terraform.io/providers/Azure/azapi/latest/docs/resources/update_resource) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_body"></a> [body](#input\_body) | It is in a format like resource-type@api-version. resource-type is the Azure resource type, for example, Microsoft.Storage/storageAccounts. api-version is version of the API used to manage this azure resource. | `string` | n/a | yes |
| <a name="input_resource_id"></a> [resource\_id](#input\_resource\_id) | The ID of an existing azure source. Changing this forces a new azure resource to be created. | `string` | n/a | yes |
| <a name="input_type"></a> [type](#input\_type) | The request body used to add on to an existing Azure resource. | `any` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_this"></a> [this](#output\_this) | API update for existing Azure resource manager resource. |
<!-- END_TF_DOCS -->