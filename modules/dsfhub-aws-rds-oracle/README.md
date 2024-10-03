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

Description: AWS ARN, e.g. "arn:aws:rds:us-east-2:123456790:db:db-name"

Type: `string`

### <a name="input_gateway_id"></a> [gateway\_id](#input\_gateway\_id)

Description: Unique identifier (UID) attached to the jSonar machine controlling the asset

Type: `string`

### <a name="input_server_host_name"></a> [server\_host\_name](#input\_server\_host\_name)

Description: Endpoint URL, e.g. <domain>.amazon.com

Type: `string`

### <a name="input_server_port"></a> [server\_port](#input\_server\_port)

Description: Endpoint URL, e.g. <domain>.amazon.com

Type: `string`

### <a name="input_service_name"></a> [service\_name](#input\_service\_name)

Description: Oracle service name, or SID. e.g. ORCL

Type: `string`

## Optional Inputs

The following input variables are optional (have default values):

### <a name="input_audit_pull_enabled"></a> [audit\_pull\_enabled](#input\_audit\_pull\_enabled)

Description: If true, sonargateway will collect the audit logs for this system if it can.

Type: `bool`

Default: `false`

### <a name="input_audit_type"></a> [audit\_type](#input\_audit\_type)

Description: Used to indicate what mechanism should be used to fetch logs on systems supporting multiple ways to get logs, see asset specific documentation for details

Type: `string`

Default: `null`

### <a name="input_auth_mechanism"></a> [auth\_mechanism](#input\_auth\_mechanism)

Description: Specifies the auth mechanism used by the connection

Type: `string`

Default: `null`

### <a name="input_dsn"></a> [dsn](#input\_dsn)

Description: Datasource name to use in odbc.ini. If using the asset for SDM, keep a dummy DSN value.

Type: `string`

Default: `null`

### <a name="input_parent_asset_id"></a> [parent\_asset\_id](#input\_parent\_asset\_id)

Description: The asset\_id that contains this asset (e.g. Asset ID of the database sending audit events)

Type: `string`

Default: `null`

### <a name="input_password"></a> [password](#input\_password)

Description: Password to use to connect to Oracle database. Must not include semicolons.

Type: `string`

Default: `null`

### <a name="input_reason"></a> [reason](#input\_reason)

Description: Used to differentiate connections that belong to the same asset

Type: `string`

Default: `"default"`

### <a name="input_region"></a> [region](#input\_region)

Description: AWS region containing the instance.

Type: `string`

Default: `null`

### <a name="input_username"></a> [username](#input\_username)

Description: Username to use to connect to Oracle database.

Type: `string`

Default: `null`

### <a name="input_wallet_dir"></a> [wallet\_dir](#input\_wallet\_dir)

Description: Path to the Oracle wallet directory

Type: `string`

Default: `null`

## Outputs

The following outputs are exported:

### <a name="output_this"></a> [this](#output\_this)

Description: AWS RDS Oracle asset
<!-- END_TF_DOCS -->