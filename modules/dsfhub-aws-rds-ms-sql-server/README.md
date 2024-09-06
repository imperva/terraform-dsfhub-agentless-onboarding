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
| <a name="input_admin_email"></a> [admin\_email](#input\_admin\_email) | The email address to notify about this asset | `string` | n/a | yes |
| <a name="input_asset_display_name"></a> [asset\_display\_name](#input\_asset\_display\_name) | User-friendly name of the asset, defined by user | `string` | n/a | yes |
| <a name="input_asset_id"></a> [asset\_id](#input\_asset\_id) | AWS ARN, e.g. "arn:aws:rds:us-east-2:123456790:db:db-name" | `string` | n/a | yes |
| <a name="input_audit_pull_enabled"></a> [audit\_pull\_enabled](#input\_audit\_pull\_enabled) | If true, sonargateway will collect the audit logs for this system if it can. | `bool` | `false` | no |
| <a name="input_database_name"></a> [database\_name](#input\_database\_name) | Specifies the name of the database you are connected to (or default DB). | `string` | `null` | no |
| <a name="input_db_engine_version"></a> [db\_engine\_version](#input\_db\_engine\_version) | Denotes the major version of the DB engine of the asset, e.g. 2015 vs. 2019 | `string` | `null` | no |
| <a name="input_db_instance_count"></a> [db\_instance\_count](#input\_db\_instance\_count) | Number of database instances. | `number` | `1` | no |
| <a name="input_gateway_id"></a> [gateway\_id](#input\_gateway\_id) | Unique identifier (UID) attached to the jSonar machine controlling the asset | `string` | n/a | yes |
| <a name="input_logs_destination_asset_id"></a> [logs\_destination\_asset\_id](#input\_logs\_destination\_asset\_id) | asset\_id of the S3 bucket asset where the logs for this database can be found. | `string` | `null` | no |
| <a name="input_parent_asset_id"></a> [parent\_asset\_id](#input\_parent\_asset\_id) | The asset\_id that contains this asset (e.g. Asset ID of the database sending audit events) | `string` | `null` | no |
| <a name="input_region"></a> [region](#input\_region) | AWS region containing the instance. | `string` | `null` | no |
| <a name="input_server_host_name"></a> [server\_host\_name](#input\_server\_host\_name) | Endpoint URL, e.g. <domain>.amazon.com | `string` | n/a | yes |
| <a name="input_server_port"></a> [server\_port](#input\_server\_port) | Endpoint URL, e.g. <domain>.amazon.com | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_this"></a> [this](#output\_this) | AWS RDS MS SQL Server asset |
<!-- END_TF_DOCS -->