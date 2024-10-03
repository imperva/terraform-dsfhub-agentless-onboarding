<!-- BEGIN_TF_DOCS -->
## Requirements

The following requirements are needed by this module:

- <a name="requirement_dsfhub"></a> [dsfhub](#requirement\_dsfhub) (>= 1.2.46)

## Providers

The following providers are used by this module:

- <a name="provider_dsfhub"></a> [dsfhub](#provider\_dsfhub) (>= 1.2.46)

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

Description: AWS ARN, e.g. "arn:aws:rds:us-east-2:123456790:cluster:cluster-name"

Type: `string`

### <a name="input_gateway_id"></a> [gateway\_id](#input\_gateway\_id)

Description: Unique identifier (UID) attached to the jSonar machine controlling the asset

Type: `string`

### <a name="input_parent_asset_id"></a> [parent\_asset\_id](#input\_parent\_asset\_id)

Description: The asset\_id of AWS cloud account being used. E.g. Key-pair, iam\_role, profile or default

Type: `string`

### <a name="input_region"></a> [region](#input\_region)

Description: AWS region containing the Redshift cluster.

Type: `string`

### <a name="input_server_host_name"></a> [server\_host\_name](#input\_server\_host\_name)

Description: Endpoint URL, e.g. <domain>.amazon.com

Type: `string`

### <a name="input_server_ip"></a> [server\_ip](#input\_server\_ip)

Description: Endpoint URL, e.g. <domain>.amazon.com

Type: `string`

## Optional Inputs

The following input variables are optional (have default values):

### <a name="input_access_id"></a> [access\_id](#input\_access\_id)

Description: The cluster identifier.

Type: `string`

Default: `null`

### <a name="input_audit_pull_enabled"></a> [audit\_pull\_enabled](#input\_audit\_pull\_enabled)

Description: Whether the DSFHUB should pull logs from the asset.

Type: `bool`

Default: `false`

### <a name="input_audit_type"></a> [audit\_type](#input\_audit\_type)

Description: Used to indicate what mechanism should be used to fetch logs on systems supporting multiple ways to get logs, see asset specific documentation for details. Valid values: TABLE | REDSHIFT.

Type: `string`

Default: `null`

### <a name="input_auth_mechanism"></a> [auth\_mechanism](#input\_auth\_mechanism)

Description: The authentication mechanism to use for the Redshift asset.

Type: `string`

Default: `null`

### <a name="input_aws_connection_id"></a> [aws\_connection\_id](#input\_aws\_connection\_id)

Description: The stringified object ID of the AWS connection document.

Type: `string`

Default: `null`

### <a name="input_bucket_account_id"></a> [bucket\_account\_id](#input\_bucket\_account\_id)

Description: The account\_id of the bucket owner

Type: `string`

Default: `null`

### <a name="input_database_name"></a> [database\_name](#input\_database\_name)

Description: The database name.

Type: `string`

Default: `"dev"`

### <a name="input_logs_destination_asset_id"></a> [logs\_destination\_asset\_id](#input\_logs\_destination\_asset\_id)

Description: The asset\_id of the AWS S3 bucket asset when the audit\_type is set to REDSHIFT.

Type: `string`

Default: `null`

### <a name="input_password"></a> [password](#input\_password)

Description: The password to use for authentication.

Type: `string`

Default: `null`

### <a name="input_server_port"></a> [server\_port](#input\_server\_port)

Description: Database port being used. Default: 5439

Type: `number`

Default: `5439`

### <a name="input_service_name"></a> [service\_name](#input\_service\_name)

Description: The database name (see Service Name Guidelines).

Type: `string`

Default: `null`

### <a name="input_ssl"></a> [ssl](#input\_ssl)

Description: Whether to use SSL for the connection.

Type: `bool`

Default: `null`

### <a name="input_tmp_user"></a> [tmp\_user](#input\_tmp\_user)

Description: Whether the DSFHUB should create a temp user.

Type: `bool`

Default: `null`

### <a name="input_username"></a> [username](#input\_username)

Description: The username to use for authentication.

Type: `string`

Default: `null`

## Outputs

The following outputs are exported:

### <a name="output_this"></a> [this](#output\_this)

Description: AWS Redshift cluster asset
<!-- END_TF_DOCS -->