<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

The following providers are used by this module:

- <a name="provider_dsfhub"></a> [dsfhub](#provider\_dsfhub)

## Modules

No modules.

## Resources

The following resources are used by this module:

- [dsfhub_data_source.this](https://registry.terraform.io/providers/imperva/dsfhub/latest/docs/resources/data_source) (resource)

## Required Inputs

The following input variables are required:

### <a name="input_admin_email"></a> [admin\_email](#input\_admin\_email)

Description: The email address to notify about this asset

Type: `string`

### <a name="input_asset_display_name"></a> [asset\_display\_name](#input\_asset\_display\_name)

Description: User-friendly name of the asset, defined by user

Type: `string`

### <a name="input_asset_id"></a> [asset\_id](#input\_asset\_id)

Description: AWS ARN, e.g. "arn:aws:dynamodb:123456789012"

Type: `string`

### <a name="input_gateway_id"></a> [gateway\_id](#input\_gateway\_id)

Description: Unique identifier (UID) attached to the jSonar machine controlling the asset

Type: `string`

## Optional Inputs

The following input variables are optional (have default values):

### <a name="input_access_id"></a> [access\_id](#input\_access\_id)

Description: AWS Access ID. Required for "key" auth\_mechanism.

Type: `string`

Default: `null`

### <a name="input_audit_pull_enabled"></a> [audit\_pull\_enabled](#input\_audit\_pull\_enabled)

Description: If true, sonargateway will collect the audit logs for this system if it can.

Type: `bool`

Default: `null`

### <a name="input_audit_type"></a> [audit\_type](#input\_audit\_type)

Description: Used to indicate what mechanism should be used to fetch logs on systems supporting multiple ways to get logs, see asset specific documentation for details

Type: `string`

Default: `null`

### <a name="input_auth_mechanism"></a> [auth\_mechanism](#input\_auth\_mechanism)

Description: Specifies the auth mechanism used by the connection for the db asset. Valid values: key, profile, default or iam\_role.

Type: `string`

Default: `"default"`

### <a name="input_available_regions"></a> [available\_regions](#input\_available\_regions)

Description: A list of regions to use when pulling region-specific audit logs

Type: `list(string)`

Default: `null`

### <a name="input_iam_role_name"></a> [iam\_role\_name](#input\_iam\_role\_name)

Description: AWS arn of the IAM role to be assumed. Required for "iam\_role" auth\_mechanism.

Type: `string`

Default: `null`

### <a name="input_parent_asset_id"></a> [parent\_asset\_id](#input\_parent\_asset\_id)

Description: DSFHUB Cloud Account Asset ID

Type: `string`

Default: `null`

### <a name="input_region"></a> [region](#input\_region)

Description: AWS region of the DynamoDB instance.

Type: `string`

Default: `null`

### <a name="input_secret_key"></a> [secret\_key](#input\_secret\_key)

Description: AWS secret key. Required for "key" auth\_mechanism.

Type: `string`

Default: `null`

### <a name="input_server_host_name"></a> [server\_host\_name](#input\_server\_host\_name)

Description: AWS DynamoDB service endpoint

Type: `string`

Default: `"dynamodb.us-east-2.amazonaws.com"`

### <a name="input_server_port"></a> [server\_port](#input\_server\_port)

Description: AWS DynamoDB service endpoint port

Type: `string`

Default: `"443"`

### <a name="input_username"></a> [username](#input\_username)

Description: The name of a profile in /install\_dir/jsonar/local/credentials/.aws/credentials to use for authenticating

Type: `string`

Default: `null`

## Outputs

The following outputs are exported:

### <a name="output_this"></a> [this](#output\_this)

Description: AWS DynamoDB asset
<!-- END_TF_DOCS -->