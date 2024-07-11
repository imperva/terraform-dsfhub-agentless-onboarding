<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_dsfhub"></a> [dsfhub](#requirement\_dsfhub) | >= 1.2.46 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_dsfhub"></a> [dsfhub](#provider\_dsfhub) | >= 1.2.46 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [dsfhub_data_source.this](https://registry.terraform.io/providers/imperva/dsfhub/latest/docs/resources/data_source) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_access_id"></a> [access\_id](#input\_access\_id) | The cluster identifier. | `string` | `null` | no |
| <a name="input_admin_email"></a> [admin\_email](#input\_admin\_email) | The email address to notify about this asset | `string` | n/a | yes |
| <a name="input_asset_display_name"></a> [asset\_display\_name](#input\_asset\_display\_name) | User-friendly name of the asset, defined by user | `string` | n/a | yes |
| <a name="input_asset_id"></a> [asset\_id](#input\_asset\_id) | AWS ARN, e.g. "arn:aws:rds:us-east-2:123456790:cluster:cluster-name" | `string` | n/a | yes |
| <a name="input_audit_pull_enabled"></a> [audit\_pull\_enabled](#input\_audit\_pull\_enabled) | Whether the DSFHUB should pull logs from the asset. | `bool` | `false` | no |
| <a name="input_audit_type"></a> [audit\_type](#input\_audit\_type) | Used to indicate what mechanism should be used to fetch logs on systems supporting multiple ways to get logs, see asset specific documentation for details. Valid values: TABLE \| REDSHIFT. | `string` | `null` | no |
| <a name="input_auth_mechanism"></a> [auth\_mechanism](#input\_auth\_mechanism) | The authentication mechanism to use for the Redshift asset. | `string` | `null` | no |
| <a name="input_aws_connection_id"></a> [aws\_connection\_id](#input\_aws\_connection\_id) | The stringified object ID of the AWS connection document. | `string` | `null` | no |
| <a name="input_bucket_account_id"></a> [bucket\_account\_id](#input\_bucket\_account\_id) | The account\_id of the bucket owner | `string` | `null` | no |
| <a name="input_database_name"></a> [database\_name](#input\_database\_name) | The database name. | `string` | `"dev"` | no |
| <a name="input_gateway_id"></a> [gateway\_id](#input\_gateway\_id) | Unique identifier (UID) attached to the jSonar machine controlling the asset | `string` | n/a | yes |
| <a name="input_logs_destination_asset_id"></a> [logs\_destination\_asset\_id](#input\_logs\_destination\_asset\_id) | The asset\_id of the AWS S3 bucket asset when the audit\_type is set to REDSHIFT. | `string` | `null` | no |
| <a name="input_parent_asset_id"></a> [parent\_asset\_id](#input\_parent\_asset\_id) | The asset\_id of AWS cloud account being used. E.g. Key-pair, iam\_role, profile or default | `string` | n/a | yes |
| <a name="input_password"></a> [password](#input\_password) | The password to use for authentication. | `string` | `null` | no |
| <a name="input_region"></a> [region](#input\_region) | AWS region containing the Redshift cluster. | `string` | n/a | yes |
| <a name="input_server_host_name"></a> [server\_host\_name](#input\_server\_host\_name) | Endpoint URL, e.g. <domain>.amazon.com | `string` | n/a | yes |
| <a name="input_server_ip"></a> [server\_ip](#input\_server\_ip) | Endpoint URL, e.g. <domain>.amazon.com | `string` | n/a | yes |
| <a name="input_server_port"></a> [server\_port](#input\_server\_port) | Database port being used. Default: 5439 | `number` | `5439` | no |
| <a name="input_service_name"></a> [service\_name](#input\_service\_name) | The database name (see Service Name Guidelines). | `string` | `null` | no |
| <a name="input_ssl"></a> [ssl](#input\_ssl) | Whether to use SSL for the connection. | `bool` | `null` | no |
| <a name="input_tmp_user"></a> [tmp\_user](#input\_tmp\_user) | Whether the DSFHUB should create a temp user. | `bool` | `null` | no |
| <a name="input_username"></a> [username](#input\_username) | The username to use for authentication. | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_this"></a> [this](#output\_this) | AWS Redshift cluster asset |
<!-- END_TF_DOCS -->