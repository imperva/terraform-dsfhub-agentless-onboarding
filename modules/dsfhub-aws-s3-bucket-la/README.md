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

- [dsfhub_log_aggregator.this](https://registry.terraform.io/providers/imperva/dsfhub/latest/docs/resources/log_aggregator) (resource)

## Required Inputs

The following input variables are required:

### <a name="input_admin_email"></a> [admin\_email](#input\_admin\_email)

Description: The email address to notify about this asset

Type: `string`

### <a name="input_asset_display_name"></a> [asset\_display\_name](#input\_asset\_display\_name)

Description: User-friendly name of the asset, defined by the user

Type: `string`

### <a name="input_asset_id"></a> [asset\_id](#input\_asset\_id)

Description: AWS ARN, e.g. "arn:aws:s3:::bucket-name"

Type: `string`

### <a name="input_gateway_id"></a> [gateway\_id](#input\_gateway\_id)

Description: Unique identifier (UID) attached to the jSonar machine controlling the asset

Type: `string`

### <a name="input_parent_asset_id"></a> [parent\_asset\_id](#input\_parent\_asset\_id)

Description: The asset\_id of AWS cloud account being used. E.g. Key-pair, iam\_role, profile or default

Type: `string`

### <a name="input_region"></a> [region](#input\_region)

Description: AWS region containing the instance.

Type: `string`

### <a name="input_server_host_name"></a> [server\_host\_name](#input\_server\_host\_name)

Description: S3 bucket name.

Type: `string`

### <a name="input_server_ip"></a> [server\_ip](#input\_server\_ip)

Description: S3 bucket ARN.

Type: `string`

## Optional Inputs

The following input variables are optional (have default values):

### <a name="input_audit_pull_enabled"></a> [audit\_pull\_enabled](#input\_audit\_pull\_enabled)

Description: Whether the DSFHUB should pull logs from the asset.

Type: `bool`

Default: `false`

### <a name="input_audit_type"></a> [audit\_type](#input\_audit\_type)

Description: Used to indicate what type of audit will be pulled on systems supporting multiple audit types. Default is null. Valid values: LOG\_GROUP, KINESIS, CLOUDWATCH, REDSHIFT, DYNAMODB

Type: `string`

Default: `null`

### <a name="input_bucket_account_id"></a> [bucket\_account\_id](#input\_bucket\_account\_id)

Description: Mandatory for audit types: REDSHIFT and DYNAMODB. Account number found in the prefix of the files we are pulling. e.g: `123456789012` out of `redshift/AWSLogs/123456789012/redshift/us-east-1/2024/06/25/my_file.gz`

Type: `string`

Default: `null`

### <a name="input_s3_provider"></a> [s3\_provider](#input\_s3\_provider)

Description: Required only for AWS RDS MS SQL SERVER. Accepted value: 'aws-rds-mssql'

Type: `string`

Default: `null`

### <a name="input_server_port"></a> [server\_port](#input\_server\_port)

Description: Database port being used.

Type: `number`

Default: `443`

## Outputs

The following outputs are exported:

### <a name="output_this"></a> [this](#output\_this)

Description: AWS S3 bucket log aggregator asset
<!-- END_TF_DOCS -->