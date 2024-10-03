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

Description: The email address to notify about the asset.

Type: `string`

### <a name="input_asset_display_name"></a> [asset\_display\_name](#input\_asset\_display\_name)

Description: User-friendly name of the asset, defined by user

Type: `string`

### <a name="input_asset_id"></a> [asset\_id](#input\_asset\_id)

Description: The Azure resource ID of the SQL Server instance.

Type: `string`

### <a name="input_gateway_id"></a> [gateway\_id](#input\_gateway\_id)

Description: Unique identifier (UID) attached to the jSonar machine controlling the asset

Type: `string`

### <a name="input_server_host_name"></a> [server\_host\_name](#input\_server\_host\_name)

Description: Hostname of the SQL Server instance.

Type: `string`

### <a name="input_server_ip"></a> [server\_ip](#input\_server\_ip)

Description: IP address / hostname of the SQL Server instance.

Type: `string`

## Optional Inputs

The following input variables are optional (have default values):

### <a name="input_audit_pull_enabled"></a> [audit\_pull\_enabled](#input\_audit\_pull\_enabled)

Description: If true, sonargateway will collect the audit logs for this system if it can.

Type: `bool`

Default: `false`

### <a name="input_auth_mechanism"></a> [auth\_mechanism](#input\_auth\_mechanism)

Description: Specifies the auth mechanism used by the connection

Type: `string`

Default: `null`

### <a name="input_database_name"></a> [database\_name](#input\_database\_name)

Description: Specifies the name of the database to connect to (or default DB).

Type: `string`

Default: `"master"`

### <a name="input_location"></a> [location](#input\_location)

Description: Physical location/region of the SQL Server instance, e.g. "EAST US"

Type: `string`

Default: `null`

### <a name="input_logs_destination_asset_id"></a> [logs\_destination\_asset\_id](#input\_logs\_destination\_asset\_id)

Description: The asset\_id of the AZURE EVENTHUB asset that this instance is sending its audit logs to.

Type: `string`

Default: `null`

### <a name="input_parent_asset_id"></a> [parent\_asset\_id](#input\_parent\_asset\_id)

Description: The asset\_id of the AZURE asset representing the Azure account where this server is located.

Type: `string`

Default: `null`

### <a name="input_password"></a> [password](#input\_password)

Description: Password to use to connect to the SQL Server instance.

Type: `string`

Default: `null`

### <a name="input_reason"></a> [reason](#input\_reason)

Description: Used to differentiate connections that belong to the same asset

Type: `string`

Default: `"default"`

### <a name="input_server_port"></a> [server\_port](#input\_server\_port)

Description: Port that the SQL Server instance listens on.

Type: `string`

Default: `"1433"`

### <a name="input_username"></a> [username](#input\_username)

Description: Username of SQL Server database user to connect with.

Type: `string`

Default: `null`

## Outputs

The following outputs are exported:

### <a name="output_this"></a> [this](#output\_this)

Description: AZURE MS SQL SERVER asset
<!-- END_TF_DOCS -->