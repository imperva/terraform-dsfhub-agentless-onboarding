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

## Optional Inputs

The following input variables are optional (have default values):

### <a name="input_audit_pull_enabled"></a> [audit\_pull\_enabled](#input\_audit\_pull\_enabled)

Description: If true, sonargateway will collect the audit logs for this system if it can.

Type: `bool`

Default: `false`

### <a name="input_database_name"></a> [database\_name](#input\_database\_name)

Description: Specifies the name of the database you are connected to (or default DB).

Type: `string`

Default: `null`

### <a name="input_db_engine_version"></a> [db\_engine\_version](#input\_db\_engine\_version)

Description: Denotes the major version of the DB engine of the asset, e.g. 2015 vs. 2019

Type: `string`

Default: `null`

### <a name="input_db_instance_count"></a> [db\_instance\_count](#input\_db\_instance\_count)

Description: Number of database instances.

Type: `number`

Default: `1`

### <a name="input_logs_destination_asset_id"></a> [logs\_destination\_asset\_id](#input\_logs\_destination\_asset\_id)

Description: asset\_id of the S3 bucket asset where the logs for this database can be found.

Type: `string`

Default: `null`

### <a name="input_parent_asset_id"></a> [parent\_asset\_id](#input\_parent\_asset\_id)

Description: The asset\_id that contains this asset (e.g. Asset ID of the database sending audit events)

Type: `string`

Default: `null`

### <a name="input_region"></a> [region](#input\_region)

Description: AWS region containing the instance.

Type: `string`

Default: `null`

### <a name="input_server_port"></a> [server\_port](#input\_server\_port)

Description: Endpoint URL, e.g. <domain>.amazon.com

Type: `string`

Default: `null`

## Outputs

The following outputs are exported:

### <a name="output_this"></a> [this](#output\_this)

Description: AWS RDS MS SQL Server asset
<!-- END_TF_DOCS -->