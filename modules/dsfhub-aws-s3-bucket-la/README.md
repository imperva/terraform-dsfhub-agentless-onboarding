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
| [dsfhub_log_aggregator.this](https://registry.terraform.io/providers/imperva/dsfhub/latest/docs/resources/log_aggregator) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_admin_email"></a> [admin\_email](#input\_admin\_email) | The email address to notify about this asset | `string` | n/a | yes |
| <a name="input_asset_display_name"></a> [asset\_display\_name](#input\_asset\_display\_name) | User-friendly name of the asset, defined by the user | `string` | n/a | yes |
| <a name="input_asset_id"></a> [asset\_id](#input\_asset\_id) | AWS ARN, e.g. "arn:aws:s3:::bucket-name" | `string` | n/a | yes |
| <a name="input_audit_pull_enabled"></a> [audit\_pull\_enabled](#input\_audit\_pull\_enabled) | Whether the DSFHUB should pull logs from the asset. | `bool` | `false` | no |
| <a name="input_audit_type"></a> [audit\_type](#input\_audit\_type) | Used to indicate what type of audit will be pulled on systems supporting multiple audit types. Default is null. Valid values: LOG\_GROUP, KINESIS, CLOUDWATCH, REDSHIFT, DYNAMODB | `string` | `null` | no |
| <a name="input_bucket_account_id"></a> [bucket\_account\_id](#input\_bucket\_account\_id) | Mandatory for audit types: REDSHIFT and DYNAMODB. Account number found in the prefix of the files we are pulling. e.g: `123456789012` out of `redshift/AWSLogs/123456789012/redshift/us-east-1/2024/06/25/my_file.gz` | `string` | `null` | no |
| <a name="input_gateway_id"></a> [gateway\_id](#input\_gateway\_id) | Unique identifier (UID) attached to the jSonar machine controlling the asset | `string` | n/a | yes |
| <a name="input_parent_asset_id"></a> [parent\_asset\_id](#input\_parent\_asset\_id) | The asset\_id of AWS cloud account being used. E.g. Key-pair, iam\_role, profile or default | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | AWS region containing the instance. | `string` | n/a | yes |
| <a name="input_s3_provider"></a> [s3\_provider](#input\_s3\_provider) | Required only for AWS RDS MS SQL SERVER. Accepted value: 'aws-rds-mssql' | `string` | `null` | no |
| <a name="input_server_host_name"></a> [server\_host\_name](#input\_server\_host\_name) | S3 bucket name. | `string` | n/a | yes |
| <a name="input_server_ip"></a> [server\_ip](#input\_server\_ip) | S3 bucket ARN. | `string` | n/a | yes |
| <a name="input_server_port"></a> [server\_port](#input\_server\_port) | Database port being used. | `number` | `443` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_this"></a> [this](#output\_this) | AWS S3 bucket log aggregator asset |
<!-- END_TF_DOCS -->