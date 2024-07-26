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
| [dsfhub_data_source.this](https://registry.terraform.io/providers/imperva/dsfhub/latest/docs/resources/data_source) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_access_id"></a> [access\_id](#input\_access\_id) | AWS Access ID. Required for "key" auth\_mechanism. | `string` | `null` | no |
| <a name="input_admin_email"></a> [admin\_email](#input\_admin\_email) | The email address to notify about this asset | `string` | n/a | yes |
| <a name="input_asset_display_name"></a> [asset\_display\_name](#input\_asset\_display\_name) | User-friendly name of the asset, defined by user | `string` | n/a | yes |
| <a name="input_asset_id"></a> [asset\_id](#input\_asset\_id) | AWS ARN, e.g. "arn:aws:dynamodb:123456789012" | `string` | n/a | yes |
| <a name="input_audit_pull_enabled"></a> [audit\_pull\_enabled](#input\_audit\_pull\_enabled) | If true, sonargateway will collect the audit logs for this system if it can. | `bool` | `null` | no |
| <a name="input_audit_type"></a> [audit\_type](#input\_audit\_type) | Used to indicate what mechanism should be used to fetch logs on systems supporting multiple ways to get logs, see asset specific documentation for details | `string` | `null` | no |
| <a name="input_auth_mechanism"></a> [auth\_mechanism](#input\_auth\_mechanism) | Specifies the auth mechanism used by the connection for the db asset. Valid values: key, profile, default or iam\_role. | `string` | `"default"` | no |
| <a name="input_available_regions"></a> [available\_regions](#input\_available\_regions) | A list of regions to use when pulling region-specific audit logs | `list(string)` | `null` | no |
| <a name="input_gateway_id"></a> [gateway\_id](#input\_gateway\_id) | Unique identifier (UID) attached to the jSonar machine controlling the asset | `string` | n/a | yes |
| <a name="input_iam_role_name"></a> [iam\_role\_name](#input\_iam\_role\_name) | AWS arn of the IAM role to be assumed. Required for "iam\_role" auth\_mechanism. | `string` | `null` | no |
| <a name="input_parent_asset_id"></a> [parent\_asset\_id](#input\_parent\_asset\_id) | DSFHUB Cloud Account Asset ID | `string` | `null` | no |
| <a name="input_region"></a> [region](#input\_region) | AWS region of the DynamoDB instance. | `string` | `null` | no |
| <a name="input_secret_key"></a> [secret\_key](#input\_secret\_key) | AWS secret key. Required for "key" auth\_mechanism. | `string` | `null` | no |
| <a name="input_server_host_name"></a> [server\_host\_name](#input\_server\_host\_name) | AWS DynamoDB service endpoint | `string` | `"dynamodb.us-east-2.amazonaws.com"` | no |
| <a name="input_server_port"></a> [server\_port](#input\_server\_port) | AWS DynamoDB service endpoint port | `string` | `"443"` | no |
| <a name="input_username"></a> [username](#input\_username) | The name of a profile in /install\_dir/jsonar/local/credentials/.aws/credentials to use for authenticating | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_this"></a> [this](#output\_this) | AWS DynamoDB asset |
<!-- END_TF_DOCS -->