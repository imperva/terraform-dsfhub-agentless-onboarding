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

Description: AWS ARN, e.g. "arn:aws:rds:us-east-2:123456790:cluster:db-name"

Type: `string`

### <a name="input_gateway_id"></a> [gateway\_id](#input\_gateway\_id)

Description: Unique identifier (UID) attached to the jSonar machine controlling the asset

Type: `string`

### <a name="input_parent_asset_id"></a> [parent\_asset\_id](#input\_parent\_asset\_id)

Description: The asset\_id of the cloud account with auth-mech such as key-pair, iam-role etc.

Type: `string`

## Optional Inputs

The following input variables are optional (have default values):

### <a name="input_audit_type"></a> [audit\_type](#input\_audit\_type)

Description: Used to indicate what mechanism should be used to fetch logs on systems supporting multiple ways to get logs, see asset specific documentation for details

Type: `string`

Default: `null`

### <a name="input_auth_mechanism"></a> [auth\_mechanism](#input\_auth\_mechanism)

Description: Specifies the auth mechanism used by the connection

Type: `string`

Default: `null`

### <a name="input_password"></a> [password](#input\_password)

Description: User's password

Type: `string`

Default: `null`

### <a name="input_region"></a> [region](#input\_region)

Description: AWS region containing the cluster.

Type: `string`

Default: `null`

### <a name="input_server_host_name"></a> [server\_host\_name](#input\_server\_host\_name)

Description: Endpoint URL

Type: `string`

Default: `null`

### <a name="input_server_port"></a> [server\_port](#input\_server\_port)

Description: Port of the cluster for connection

Type: `string`

Default: `null`

### <a name="input_username"></a> [username](#input\_username)

Description: Username to use to connect to the cluster.

Type: `string`

Default: `null`

## Outputs

The following outputs are exported:

### <a name="output_this"></a> [this](#output\_this)

Description: Aurora PostgreSQL cluster DSF asset
<!-- END_TF_DOCS -->