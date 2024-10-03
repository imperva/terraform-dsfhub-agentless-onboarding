# dsfhub-aws-cloud-account

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

- [dsfhub_cloud_account.aws](https://registry.terraform.io/providers/imperva/dsfhub/latest/docs/resources/cloud_account) (resource)

## Required Inputs

The following input variables are required:

### <a name="input_admin_email"></a> [admin\_email](#input\_admin\_email)

Description: The email address to notify about this asset

Type: `string`

### <a name="input_asset_display_name"></a> [asset\_display\_name](#input\_asset\_display\_name)

Description: User-friendly name of the asset, defined by user

Type: `string`

### <a name="input_asset_id"></a> [asset\_id](#input\_asset\_id)

Description: AWS ARN, e.g. "arn:aws:iam::1234567890"

Type: `string`

### <a name="input_gateway_id"></a> [gateway\_id](#input\_gateway\_id)

Description: Unique identifier (UID) attached to the jSonar machine controlling the asset

Type: `string`

### <a name="input_region"></a> [region](#input\_region)

Description: Default AWS region of the account

Type: `string`

## Optional Inputs

The following input variables are optional (have default values):

### <a name="input_auth_mechanism"></a> [auth\_mechanism](#input\_auth\_mechanism)

Description: Specifies the auth mechanism used by the connection for the account asset

Type: `string`

Default: `"default"`

### <a name="input_aws_access_key"></a> [aws\_access\_key](#input\_aws\_access\_key)

Description: AWS Access ID

Type: `string`

Default: `null`

### <a name="input_aws_secret_key"></a> [aws\_secret\_key](#input\_aws\_secret\_key)

Description: AWS secret key

Type: `string`

Default: `null`

### <a name="input_profile_name"></a> [profile\_name](#input\_profile\_name)

Description: The name of a profile in /install\_dir/jsonar/local/credentials/.aws/credentials to use for authentication

Type: `string`

Default: `null`

## Outputs

The following outputs are exported:

### <a name="output_this"></a> [this](#output\_this)

Description: aws cloud account asset
<!-- END_TF_DOCS -->