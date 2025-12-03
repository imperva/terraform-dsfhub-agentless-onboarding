<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_dsfhub"></a> [dsfhub](#provider\_dsfhub) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [dsfhub_cloud_account.this](https://registry.terraform.io/providers/imperva/dsfhub/latest/docs/resources/cloud_account) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_access_id"></a> [access\_id](#input\_access\_id) | Access key ID | `string` | `null` | no |
| <a name="input_access_key"></a> [access\_key](#input\_access\_key) | Access key secret | `string` | `null` | no |
| <a name="input_admin_email"></a> [admin\_email](#input\_admin\_email) | The email address to notify about this asset | `string` | n/a | yes |
| <a name="input_asset_display_name"></a> [asset\_display\_name](#input\_asset\_display\_name) | User-friendly name of the asset, defined by user | `string` | n/a | yes |
| <a name="input_asset_id"></a> [asset\_id](#input\_asset\_id) | Alibaba ARN, e.g. "arn:acs:123456789012" | `string` | n/a | yes |
| <a name="input_auth_mechanism"></a> [auth\_mechanism](#input\_auth\_mechanism) | Specifies the auth mechanism used by the connection for the account asset | `string` | `"default"` | no |
| <a name="input_gateway_id"></a> [gateway\_id](#input\_gateway\_id) | Unique identifier (UID) attached to the jSonar machine controlling the asset | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | Default Alibaba region of the account | `string` | n/a | yes |
| <a name="input_role_name"></a> [role\_name](#input\_role\_name) | What role is used to get credentials from. Defaults to the current machine's role | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_this"></a> [this](#output\_this) | ALIBABA cloud account asset |
<!-- END_TF_DOCS -->